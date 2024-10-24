"
represent the physical asset
"
Class {
	#name : 'PhysicalCounterpart',
	#superclass : 'Object',
	#instVars : [
		'id',
		'designation',
		'host',
		'data'
	],
	#category : 'DTwinSyncCore',
	#package : 'DTwinSyncCore'
}

{ #category : 'accessing' }
PhysicalCounterpart >> data [

	^ data
]

{ #category : 'accessing' }
PhysicalCounterpart >> data: anObject [

	data := anObject
]

{ #category : 'accessing' }
PhysicalCounterpart >> designation [

	^ designation
]

{ #category : 'accessing' }
PhysicalCounterpart >> designation: anObject [

	designation := anObject
]

{ #category : 'accessing' }
PhysicalCounterpart >> host [

	^ host
]

{ #category : 'accessing' }
PhysicalCounterpart >> host: anObject [

	host := anObject
]

{ #category : 'accessing' }
PhysicalCounterpart >> id [

	^ id
]

{ #category : 'accessing' }
PhysicalCounterpart >> id: anObject [

	id := anObject
]
