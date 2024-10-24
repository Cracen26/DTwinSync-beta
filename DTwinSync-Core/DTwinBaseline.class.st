Class {
	#name : 'DTwinBaseline',
	#superclass : 'Object',
	#instVars : [
		'id',
		'models',
		'data',
		'services',
		'mqttclients'
	],
	#category : 'DTwinSync-Core',
	#package : 'DTwinSync-Core'
}

{ #category : 'control' }
DTwinBaseline >> compute [
	"launch the computing of the models embedded"
	self models valuesDo: [ :model |
		model computeEntropy.
		 ].
	self services valuesDo: [ :service |
		service display.
		 ]
]

{ #category : 'accessing' }
DTwinBaseline >> data [

	^ data
]

{ #category : 'accessing' }
DTwinBaseline >> data: anObject [

	data := anObject
]

{ #category : 'accessing' }
DTwinBaseline >> id [

	^ id
]

{ #category : 'accessing' }
DTwinBaseline >> id: anObject [

	id := anObject
]

{ #category : 'initialization' }
DTwinBaseline >> initialize [ 
	super initialize .
	id := (1000 atRandom) asString.
	mqttclients := Dictionary new.
	models := Dictionary new.
	services := Dictionary new.
	data := Dictionary new.
	
	
]

{ #category : 'actions api' }
DTwinBaseline >> load: aClass [
	|instance|
	instance := aClass new.
	instance dt: self.
	(instance class superclass name) = 'DTwinModel' 
		ifTrue: [ 
			self models at: (aClass name) asString put: (instance). ] 
		ifFalse: [ self services at: (aClass name) asString put: (instance). ] .
]

{ #category : 'accessing' }
DTwinBaseline >> models [

	^ models
]

{ #category : 'accessing' }
DTwinBaseline >> models: anObject [

	models := anObject
]

{ #category : 'accessing' }
DTwinBaseline >> mqttclients [

	^ mqttclients
]

{ #category : 'accessing' }
DTwinBaseline >> mqttclients: anObject [

	mqttclients := anObject
]

{ #category : 'accessing' }
DTwinBaseline >> services [

	^ services
]

{ #category : 'accessing' }
DTwinBaseline >> services: anObject [

	services := anObject
]
