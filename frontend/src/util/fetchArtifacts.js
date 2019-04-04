
function fetchArtifacts(fhirUriPrefix, questionnaireUri, smart, deviceRequestId) {
  return new Promise(function(resolve, reject) {
    function handleFetchErrors(response) {
      if (!response.ok) {
        reject("Failure when fetching resource.");
      }
      return response;
    }

    const fetchedUris = new Set();
    let pendingFetches = 0;

    const retVal = {
      questionnaire: null,
      mainLibraryElm: null,
      dependentElms: [],
      deviceRequest: null
    }

    function resolveIfDone(){
      if (pendingFetches != 0) return;
      if (retVal.questionnaire && retVal.mainLibraryElm && retVal.deviceRequest) resolve(retVal)
      else reject("Failed to fetch all artifacts.")
    }

    pendingFetches += 1;
    smart.patient.api.read({type: "DeviceRequest", id: deviceRequestId})
    .then(response => {
      pendingFetches -= 1;
      if (response.status !== "success") reject("Failed ot fetch device request.");
      retVal.deviceRequest = response.data;
      resolveIfDone()
    }, error => reject(err))


    var questionnaireUrl = new URL(fhirUriPrefix+encodeURIComponent(questionnaireUri));
    fetch(questionnaireUrl).then(handleFetchErrors).then(r => r.json())
    .then(questionnaire => {
      retVal.questionnaire = questionnaire;
      fetchedUris.add(questionnaireUri)
      const mainElmUri = questionnaire.extension.filter(ext => ext.url == "http://hl7.org/fhir/StructureDefinition/cqif-library")[0].valueReference.reference;
      fetchElm(mainElmUri, true)
    })
    .catch(err => reject(err));

    function fetchElm(libraryUri, isMain = false){
      if (libraryUri in fetchedUris) return;
      let libraryUrl = new URL(fhirUriPrefix+encodeURIComponent(libraryUri));
      pendingFetches += 1;
      fetch(libraryUrl).then(handleFetchErrors).then(r => r.json())
      .then(libraryResource => {
        pendingFetches -= 1;
        fetchedUris.add(libraryUri);
        fetchRelatedElms(libraryResource);
        fetchElmFile(libraryResource, isMain);
      })
      .catch(err => reject(err));
    }

    function fetchRelatedElms(libraryResource){
      if (libraryResource.relatedArtifact == null) return
      const libUris = libraryResource.relatedArtifact.filter(a => a.type == "depends-on").map(a => a.resource.reference);
      libUris.forEach(libUri => fetchElm(libUri));
    }

    function fetchElmFile(libraryResource, isMain){
      const elmUri = libraryResource.content.filter(c => c.contentType == "text/elm")[0].url;
      if (elmUri in fetchedUris) return;
      let elmUrl = new URL(fhirUriPrefix+encodeURIComponent(elmUri));
      pendingFetches += 1;
      fetch(elmUrl).then(handleFetchErrors).then(r => r.json())
      .then(elm => {
        pendingFetches -= 1;
        fetchedUris.add(elmUri);
        if (isMain) retVal.mainLibraryElm = elm;
        else retVal.dependentElms.push(elm);
        resolveIfDone();
      })
      .catch(err => reject(err));
    }
  });
}

export default fetchArtifacts;