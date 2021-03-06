Profile:  CancerDiseaseStatus
Parent:   Observation
Id:       mcode-cancer-disease-status
Title:    "Cancer Disease Status"
Description:    "A clinician's qualitative judgment on the current trend of the cancer, e.g., whether it is stable, worsening (progressing), or improving (responding). The judgment may be based a single type or multiple kinds of evidence, such as imaging data, assessment of symptoms, tumor markers, laboratory data, etc."
/* There are several anomalies in mCODE 0.9.3:
1) Not sure if `basedOn` should include MedicationRequest or just ServiceRequest. 
2) ProcedureRequest shouldn't in `basedOn` -- it is an artifact of OBF (doesn't exist in FHIR)
3) Should `partOf` include MedicationAdministration or MedicationStatement?
4) There's no reason category should be 0..1 (maybe because of DSTU2?) 
4) Binding of category should be preferred, not extensible
5) Unless we are forcing US Core onto mCODE users, encounter should be Reference(Encounter), not Reference(US Core Encounter)
6) patient should be Reference(CancerPatient) -- the mCODE profile -- not Reference(US Core Patient)
7) There's no apparent reason that interpretation should constrained to 0..1 (from 0..*)
8) derivedFrom is missing Reference(ImagingStudy | MolecularSequence) choices - I think these were omitted only because they weren't in OBF.
*/
* extension contains EvidenceType 0..*
* extension[EvidenceType].valueCodeableConcept from CancerDiseaseStatusEvidenceTypeVS (required)
* status, code, subject, effective[x], valueCodeableConcept MS
* bodySite 0..0
* specimen 0..0
* device 0..0
* referenceRange 0..0
* hasMember 0..0
* component 0..0
* interpretation 0..1
* subject 1..1
* basedOn only Reference(ServiceRequest | MedicationRequest)
* partOf only Reference(MedicationAdministration | MedicationStatement | Procedure)
* code = LNC#88040-1 "Response to cancer treatment"
* subject only Reference(CancerPatient)
* focus only Reference(CancerConditionParent)
* effective[x] only dateTime or Period
* performer only Reference(USCorePractitioner)
* value[x] only CodeableConcept
* valueCodeableConcept from ConditionStatusTrendVS (required)


Extension: EvidenceType
Title: "Evidence Type"
Id:  mcode-evidence-type
Description: "Categorization of the kind of evidence used as input to the clinical judgment. This corresponds to both the S and O in SOAP."
* value[x] only CodeableConcept


