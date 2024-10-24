Class {
	#name : 'DTwinHL',
	#superclass : 'DTwinBaseline',
	#instVars : [
		'composition',
		'aggregationType',
		'depth'
	],
	#classInstVars : [
		'composition'
	],
	#category : 'DTwinSyncCore',
	#package : 'DTwinSyncCore'
}

{ #category : 'control' }
DTwinHL >> aggregate: anArray [
	|isModel isData isService|
	isModel := false.
	isData := false.
	isService := false.
	anArray do: [ :each |
		self composition add: each.
		 ].
	
	aggregationType do: [ :each |
		(each type ='dataAggregation') ifTrue: [ isData := true  ].
		(each type = 'modelAggregation') ifTrue: [ isModel := true ].
		each type = 'serviceAggregation' ifTrue: [ isService := true ].
		 ].
	
	composition do: [ :each |
			isData ifTrue: [ self data at: (each id) put: each physicalData ].
			isModel ifTrue: [ self models at: (each id) put: each models ].
			isService ifTrue: [ self services at: (each id) put: each services ].
		]
		
]

{ #category : 'accessing' }
DTwinHL >> aggregationType [

	^ aggregationType
]

{ #category : 'accessing' }
DTwinHL >> aggregationType: anObject [

	aggregationType := anObject
]

{ #category : 'accessing' }
DTwinHL >> composition [

	^ composition
]

{ #category : 'accessing' }
DTwinHL >> composition: anObject [

	composition := anObject
]

{ #category : 'accessing' }
DTwinHL >> depth [

	^ depth
]

{ #category : 'accessing' }
DTwinHL >> depth: anObject [

	depth := anObject
]

{ #category : 'compute' }
DTwinHL >> formatByteString: aByteString [
	| elements orderedCollection |
	elements := aByteString copyFrom: 2 to: aByteString size - 1.  "Supprimer les crochets"
	elements := elements findTokens: ' '.  "Séparer les éléments par espace"

	"3. Convertir les éléments en nombres et les mettre dans une OrderedCollection"
	orderedCollection := OrderedCollection new.
	elements do: [ :each | orderedCollection add: each asNumber ].
	
	^ orderedCollection .

]

{ #category : 'initialization' }
DTwinHL >> initialize [ 
	super initialize.
	aggregationType := OrderedCollection new.
	composition := OrderedCollection new.
]
