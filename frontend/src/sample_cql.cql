library Demo version '1.0.0'
using FHIR version '1.0.2'
include FHIRHelpers version '1.0.2' called FHIRHelpers

context Patient

define PatientName: Patient.name[use.value='official'][0]
define PatientLastName: "PatientName".family //need to concat this list
define PatientFirstName: "PatientName".given[0]
define PatientMiddleInitial: "PatientName".given[1].first letter

define PatientMiddleInitial: Patient.birthDate
define PatientGender: Patient.gender.value

//define "PatientMedicareId"
