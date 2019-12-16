Extension: TreatmentIntent
Id:  TreatmentIntent
Title: "Treatment Intent"
Description: "The purpose of a treatment."
* value[x] only CodeableConcept
* valueCodeableConcept from TreatmentIntentVS (required)

Extension: TerminationReason
Id:  TerminationReason
Title: "Termination Reason"
Description: "A code explaning an unplanned or premature termination of a plan of treatment, course of medication, or research study."
* value[x] only CodeableConcept
* valueCodeableConcept from TreatmentTerminationReasonVS (required)

Extension: StatementDateTime
Id:  StatementDateTime
Title: "Statement Date Time"
Description: "The point in time when the statement was created."
* value[x] only dateTime

Extension: Laterality
Id:  Laterality
Title: "Laterality"
Description: "Body side of the body location, if needed to distinguish from a similar location on the other side of the body."
* value[x] only CodeableConcept
* valueCodeableConcept from LateralityVS (required)

Extension: AnatomicalOrientation
Id:  AnatomicalOrientation
Title: "Anatomical Orientation"
Description: "AnatomicalOrientation of the body location, if needed to distinguish from a similar location in another orientation."
* value[x] only CodeableConcept
* valueCodeableConcept from AnatomicalOrientationVS (required)

Extension: RelationToLandmark
Id:  RelationToLandmark
Title: "Relation to Landmark"
Description: """
The relationship between a landmark that helps determine a body location and the body location itself. The location relative to a landmark is specified by:
* Specifying the location and type of landmark using a body site code and optional laterality/orientation,
* Specifying the direction from the landmark to the body location, and
* Specifying the distance from the landmark to the body location.
"""
* extension contains
    LandmarkType 0..1 and
    LandmarkLocation 0..1 and
    LandmarkToBodyLocationDirection 0..1 and
    LandmarkToBodyLocationDistance 0..1

Extension: LandmarkType
Id:  LandmarkType
Title: "Landmark Type"
Description: "The type of feature that constitutes the landmark, particularly if the landmark is an acquired body structure or physical object."
* value[x] only CodeableConcept
* valueCodeableConcept from LandmarkTypeVS (extensible)

Extension: LandmarkLocation
Id:  LandmarkLocation
Title: "Landmark Location"
Description: "The body location of the landmark, specified by a location code and optional laterality and orientation."
* extension contains 
    Laterality 0..1 and
    AnatomicalOrientation 0..* and
    RelationToLandmark 0..*

Extension: LandmarkToBodyLocationDirection
Id:  LandmarkToBodyLocationDirection
Title: "Landmark to Body Location Direction"
Description: "The direction from the landmark to the body location of interest, given as a clockface direction or anatomical direction."
* value[x] only CodeableConcept
* valueCodeableConcept from AnatomicalDirectionVS (preferred)

Extension: LandmarkToBodyLocationDistance
Id:  LandmarkToBodyLocationDistance
Title: "Landmark to Body Location Distance"
Description: "How far the body location of interest is from the given landmark."
* value[x] only Quantity
* valueQuantity units from UnitsOfLengthVS (required)