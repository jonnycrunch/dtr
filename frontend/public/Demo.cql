library Demo version '1.0.0'
using FHIR version '3.0.0'
include FHIRHelpers version '3.0.0' called FHIRHelpers

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED-CT": 'http://snomed.info/sct'

//COPD_Codes
code "J44": 'J44' from "ICD-10-CM"
code "J44.0": 'J44.0' from "ICD-10-CM"
code "J44.1": 'J44.1' from "ICD-10-CM"
code "J44.9": 'J44.9' from "ICD-10-CM"

//Bronchiectasis_Codes
code "J47": 'J47' from "ICD-10-CM"
code "J47.0": 'J47.0' from "ICD-10-CM"
code "J47.1": 'J47.1' from "ICD-10-CM"
code "J47.9": 'J47.9' from "ICD-10-CM"

//Diffuse_interstitial_lung_disease_Codes
code "J84": 'J84' from "ICD-10-CM"
code "J84.0": 'J84.0' from "ICD-10-CM"
code "J84.01": 'J84.01' from "ICD-10-CM"
code "J84.02": 'J84.02' from "ICD-10-CM"
code "J84.03": 'J84.03' from "ICD-10-CM"
code "J84.09": 'J84.09' from "ICD-10-CM"
code "J84.1": 'J84.1' from "ICD-10-CM"
code "J84.10": 'J84.10' from "ICD-10-CM"
code "J84.11": 'J84.11' from "ICD-10-CM"
code "J84.111": 'J84.111' from "ICD-10-CM"
code "J84.112": 'J84.112' from "ICD-10-CM"
code "J84.113": 'J84.113' from "ICD-10-CM"
code "J84.114": 'J84.114' from "ICD-10-CM"
code "J84.115": 'J84.115' from "ICD-10-CM"
code "J84.116": 'J84.116' from "ICD-10-CM"
code "J84.117": 'J84.117' from "ICD-10-CM"
code "J84.17": 'J84.17' from "ICD-10-CM"
code "J84.2": 'J84.2' from "ICD-10-CM"
code "J84.8": 'J84.8' from "ICD-10-CM"
code "J84.81": 'J84.81' from "ICD-10-CM"
code "J84.82": 'J84.82' from "ICD-10-CM"
code "J84.83": 'J84.83' from "ICD-10-CM"
code "J84.84": 'J84.84' from "ICD-10-CM"
code "J84.841": 'J84.841' from "ICD-10-CM"
code "J84.842": 'J84.842' from "ICD-10-CM"
code "J84.843": 'J84.843' from "ICD-10-CM"
code "J84.848": 'J84.848' from "ICD-10-CM"
code "J84.89": 'J84.89' from "ICD-10-CM"
code "J84.9": 'J84.9' from "ICD-10-CM"

//Cystic_fibrosis_Codes
code "E84": 'E84' from "ICD-10-CM"
code "E84.0": 'E84.0' from "ICD-10-CM"
code "E84.1": 'E84.1' from "ICD-10-CM"
code "E84.11": 'E84.11' from "ICD-10-CM"
code "E84.19": 'E84.19' from "ICD-10-CM"
code "E84.8": 'E84.8' from "ICD-10-CM"
code "E84.9": 'E84.9' from "ICD-10-CM"

//Pulmonary_hypertension_Codes
code "I27.0": 'I27.0' from "ICD-10-CM"
code "I27.2": 'I27.2' from "ICD-10-CM"

//Hypoxemia_Codes
code "R09.02": 'R09.02' from "ICD-10-CM"


//  Loinc codes for observations
//Arterial_oxygen_saturation_Codes
code "59408-5": '59408-5' from "LOINC"

//Hematocrit_lab_test_Codes
code "20570-8": '20570-8' from "LOINC"
code "31100-1": '31100-1' from "LOINC"
code "32354-3": '32354-3' from "LOINC"
code "41654-5": '41654-5' from "LOINC"
code "41655-2": '41655-2' from "LOINC"
code "4544-3": '4544-3' from "LOINC"
code "4545-0": '4545-0' from "LOINC"
code "71829-6": '71829-6' from "LOINC"
code "71830-4": '71830-4' from "LOINC"
code "71832-0": '71832-0' from "LOINC"
code "71833-8": '71833-8' from "LOINC"



//Immobilization_Codes
code "102491009": '102491009' from "SNOMED-CT"
code "129857008": '129857008' from "SNOMED-CT"
code "129859006": '129859006' from "SNOMED-CT"
code "160685001": '160685001' from "SNOMED-CT"
code "371632003": '371632003' from "SNOMED-CT"
code "8510008": '8510008' from "SNOMED-CT"


parameter device_request DeviceRequest

// Relevant Diagnosis Code Lists
define "COPD_Codes": { "J44", "J44.0", "J44.1", "J44.9" }
define "Bronchiectasis_Codes": { "J47", "J47.0", "J47.1", "J47.9" }
define "Diffuse_interstitial_lung_disease_Codes": { "J84", "J84.0", "J84.01", "J84.02", "J84.03",
  "J84.09", "J84.1", "J84.10", "J84.11", "J84.111", "J84.112", "J84.113", "J84.114", "J84.115",
  "J84.116", "J84.117", "J84.17", "J84.2", "J84.8", "J84.81", "J84.82", "J84.83", "J84.84",
  "J84.841", "J84.842", "J84.843", "J84.848", "J84.89", "J84.9" }
define "Cystic_fibrosis_Codes": { "E84", "E84.0", "E84.1", "E84.11", "E84.19", "E84.8", "E84.9" }
define "Pulmonary_hypertension_Codes": { "I27.0", "I27.2" }
define "Hypoxemia_Codes": { "R09.02" }

// Observation code lists
define "Arterial_oxygen_saturation_Codes": { "59408-5" }
define "Hematocrit_lab_test_Codes": { "20570-8", "31100-1", "32354-3", "41654-5", "41655-2", "4544-3", "4545-0", "71829-6", "71830-4", "71832-0", "71833-8" }

// Other codes
define "Immobilization_Codes": { "102491009", "129857008", "129859006", "160685001", "371632003", "8510008" }

context Patient


define PatientName: singleton from (Patient.name name where name.use.value = 'official')
define PatientLastName: "PatientName".family.value
define PatientMiddleInitial: Substring(Combine(("PatientName".given given return Substring(given.value,0,1)),', '),3)
define PatientFirstName: "PatientName".given[0].value
define PatientGender: Patient.gender.value

define RelevantDiagnoses: {
  if exists([Condition: "COPD_Codes"]) then 'COPD' else 'null',
  if exists([Condition: "Bronchiectasis_Codes"]) then 'Bronchiectasis' else 'null',
  if exists([Condition: "Diffuse_interstitial_lung_disease_Codes"]) then 'Diffuse Interstitial Lung Disease' else 'null',
  if exists([Condition: "Cystic_fibrosis_Codes"]) then 'Cystic Fibrosis' else 'null',
  if exists([Condition: "Pulmonary_hypertension_Codes"]) then 'Pulmonary Hypertension' else 'null',
  if exists([Condition: "Hypoxemia_Codes"]) then 'Hypoxemia' else 'null'
} except { 'null' } // except 'null' is a workaround since I don't see how to remove actual nulls


define DeviceRequestHcpcsCoding: singleton from (
  ((cast device_request.code as CodeableConcept).coding) coding
    where coding.system.value = 'https://bluebutton.cms.gov/resources/codesystem/hcpcs')

define DeviceRequestDescription: 'HCPCS ' + "DeviceRequestHcpcsCoding".code.value + ' - ' + "DeviceRequestHcpcsCoding".display.value
define DeviceRequestedIsPortable: "DeviceRequestHcpcsCoding".code.value in { 'E0433', 'E0434', 'E0444', 'EO431', 'K0738', 'E0443', 'E1392' }
define DeviceRequestedIsStationary: "DeviceRequestHcpcsCoding".code.value in { 'E0439', 'E0442', 'E0424', 'E0441', 'E1390', 'E1391' }

define OrderingProvider: singleton from (
  [Practitioner] practitioner
    where ('Practitioner/' + practitioner.id) = device_request.performer.reference.value)
define OrderingProviderName: singleton from (OrderingProvider.name name where name.use.value = 'official')
define OrderingProviderLastName: "OrderingProviderName".family.value
define OrderingProviderMiddleInitial: Substring(Combine(("OrderingProviderName".given given return Substring(given.value,0,1)),', '),3)
define OrderingProviderFirstName: "OrderingProviderName".given[0].value
define OrderingProviderNPI: (singleton from (
  "OrderingProvider".identifier identifier
    where identifier.system.value = 'http://hl7.org/fhir/sid/us-npi')).value.value



define ArterialOxygenSaturation: [Observation: "Arterial_oxygen_saturation_Codes"]

