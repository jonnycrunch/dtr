import "whatwg-fetch"; // a window.fetch polyfill
import "fhirclient"; // sets window.FHIR
// import demoElm from "./cql/Demo.json";
import cqlfhir from "cql-exec-fhir";
import executeElm from "./elmExecutor/buildElmExecutor";
import urlUtils from "./util/url";

import React from "react";
import ReactDOM from "react-dom";
import App from "./App.js";

// ReactDOM.render(<App />, document.getElementById("root"));

const valueSetDB = {};

// // get the URL parameters received from the authorization server
// const state = urlUtils.getUrlParameter("state"); // session key
// const code = urlUtils.getUrlParameter("code"); // authorization code

// // load the app parameters stored in the session
// const params = JSON.parse(sessionStorage[state]); // load app session
// const tokenUri = params.tokenUri;
// const clientId = params.clientId;
// const secret = params.secret;
// const serviceUri = params.serviceUri;
// const redirectUri = params.redirectUri;
// const patientIdfromAppParams = params.patientId;

// // Prep the token exchange call parameters
// const data = new URLSearchParams();
// data.append("code", code);
// data.append("grant_type", "authorization_code");
// data.append("redirect_uri", redirectUri);
// if (!secret) data.append("client_id", clientId);

// const headers = {
//   "Content-Type": "application/x-www-form-urlencoded"
// };
// if (secret) headers["Authorization"] = "Basic " + btoa(clientId + ":" + secret);

// obtain authorization token from the authorization service using the authorization code
// fetch(tokenUri, {
//   method: "POST",
//   headers: headers,
//   body: data.toString()
// })
//   .then(res => res.json())
//   // should get back the access token and maybe the patient ID
//   .then(function (auth_response) {
//     const patientId = patientIdfromAppParams || auth_response.patient;
//     if (patientId == null) {
//       errorMsg = "Failed to get a patientId from the app params or the authorization response.";
//       document.body.innerText = errorMsg;
//       console.error(errorMsg);
//       return;
//     }
//     var smart = FHIR.client({
//       serviceUrl: serviceUri,
//       patientId: patientId,
//       auth: {
//         type: "bearer",
//         token: auth_response.access_token
//       }
//     });
//     go(smart);
//   });


const devreq = {
  "resourceType": "DeviceRequest",
  "id": "devreq013",
  "meta": {
    "versionId": "1",
    "lastUpdated": "2019-03-28T12:04:26.239-04:00",
    "profile": [
      "http://hl7.org/fhir/us/davinci-crd/STU3/StructureDefinition/profile-devicerequest-stu3"
    ]
  },
  "extension": [
    {
      "url": "http://build.fhir.org/ig/HL7/davinci-crd/STU3/ext-insurance.html",
      "valueReference": {
        "reference": "Coverage/cov013"
      }
    }
  ],
  "status": "draft",
  "codeCodeableConcept": {
    "coding": [
      {
        "system": "https://bluebutton.cms.gov/resources/codesystem/hcpcs",
        "code": "E0424",
        "display": "Stationary Compressed Gaseous Oxygen System, Rental"
      }
    ]
  },
  "subject": {
    "reference": "Patient/pat013"
  },
  "performer": {
    "reference": "Practitioner/pra1234"
  }
}

const fhirWrapper = cqlfhir.FHIRWrapper.FHIRv300()
const fhir_devreq = fhirWrapper.wrap(devreq)

var smart = FHIR.client({
  serviceUrl: "http://localhost:8080/fhir",
  patientId: "pat013"
});

var old_elm_string = "";

function go() {
  fetch('Demo.json')
    .then(function(response) {
      return response.json();
    })
    .then(function(elmJson) {
      let elm_string = JSON.stringify(elmJson)
      if (old_elm_string == elm_string) return;
      old_elm_string = elm_string;
      document.body.innerHTML = "Calculating...";
      const executionInputs = {
        elm: elmJson,
        elmDependencies: {},
        valueSetDB: valueSetDB,
        parameters: {device_request: fhir_devreq}
        // parameters: {}
      }
      executeElm(smart, "stu3", executionInputs,
        function(results) {
          console.log("RESULTS", results);
          document.body.innerHTML = "Done, results in console.";
          // document.body.innerHTML = "RESULTS<pre>" + JSON.stringify(results, null, 2) + "</pre>";
        },
        function(error) {
          console.error("ERROR", error);
          document.body.innerHTML = "ERROR<pre>" + JSON.stringify(error, null, 2) + "</pre>";
        }
      );
    });
}

setInterval(function(){ go(); }, 1000);