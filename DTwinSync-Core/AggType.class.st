Class {
	#name : 'AggType',
	#superclass : 'Object',
	#instVars : [
		'type'
	],
	#classInstVars : [
		'type'
	],
	#category : 'DTwinSync-Core',
	#package : 'DTwinSync-Core'
}

{ #category : 'enumeration' }
AggType class >> dataAggregation [
	^ self new initType: 'dataAggregation'.
]

{ #category : 'enumeration' }
AggType class >> modelAggregation [
	^ self new initType: 'modelAggregation'.
]

{ #category : 'enumeration' }
AggType class >> serviceAggregation [
	^ self new initType: 'serviceAggregation'.
]

{ #category : 'enumeration' }
AggType >> initType: aString [
	type := aString
]

{ #category : 'printing' }
AggType >> printOn: aStream [
    aStream nextPutAll: self type.
]

{ #category : 'accessing' }
AggType >> type [
	^ type
]
