Class {
	#name : 'EntropyModel',
	#superclass : 'DTwinModel',
	#instVars : [
		'coordinates',
		'gridSize',
		'entropy',
		'entropyLogs'
	],
	#category : 'DTwinSyncCore',
	#package : 'DTwinSyncCore'
}

{ #category : 'control' }
EntropyModel >> compute [ 
	| points numPoints grid nCells totalPoints probabilities coord valueEntropy|

	"1. Générer des points aléatoires dans un plan de [0, 100] x [0, 100]"
	numPoints := self dt data size.
	points := OrderedCollection new.
	self dt data valuesDo: [ :value |
		points add: (value at: (value size))
		 ].
	
	"points := (1 to: numPoints) collect: [ :i | 
    { (100 * (Random new next)). (100 * (Random new next)) } ]."
	"2. Diviser le plan en une grille n x n"
	nCells := 10.
	gridSize := 100.0 / nCells.
	grid := Array new: nCells.
	1 to: nCells do: [ :i | grid at: i put: (Array new: nCells withAll: 0) ].

	"3. Compter les points dans chaque cellule"
	points do: [ :point |
    | xIdx yIdx |
	coord := self formatByteString: point.
    xIdx := ((coord first) // gridSize) asInteger + 1.
    yIdx := ((coord second) // gridSize) asInteger + 1.
    (grid at: xIdx) at: yIdx put: ((grid at: xIdx) at: yIdx) + 1 ].

	"4. Calculer les probabilités et l'entropie"
	totalPoints := numPoints.
	probabilities := grid collect: [ :row | row collect: [ :count | count / totalPoints ] ].

	valueEntropy := 0.0.
	probabilities do: [ :row |
    row do: [ :p |
        p > 0 ifTrue: [ valueEntropy := valueEntropy - (p * (p ln)) ] ] ].
	
	self entropyLogs add: valueEntropy.
	
	
	

	
]

{ #category : 'control' }
EntropyModel >> computeEntropy [
	[[
   	 	self compute .
		1 second wait.
	] repeat. Processor yield] fork.
]

{ #category : 'accessing' }
EntropyModel >> coordinates [

	^ coordinates
]

{ #category : 'accessing' }
EntropyModel >> coordinates: anObject [

	coordinates := anObject
]

{ #category : 'accessing' }
EntropyModel >> entropy [

	^ entropy
]

{ #category : 'accessing' }
EntropyModel >> entropy: anObject [

	entropy := anObject
]

{ #category : 'accessing' }
EntropyModel >> entropyLogs [

	^ entropyLogs
]

{ #category : 'accessing' }
EntropyModel >> entropyLogs: anObject [

	entropyLogs := anObject
]

{ #category : 'utilities' }
EntropyModel >> formatByteString: aByteString [
	| elements orderedCollection |
	elements := aByteString copyFrom: 2 to: aByteString size - 1.  "Supprimer les crochets"
	elements := elements findTokens: ' '.  "Séparer les éléments par espace"

	"3. Convertir les éléments en nombres et les mettre dans une OrderedCollection"
	orderedCollection := OrderedCollection new.
	elements do: [ :each | orderedCollection add: each asNumber ].
	
	^ orderedCollection .

]

{ #category : 'accessing' }
EntropyModel >> gridSize [

	^ gridSize
]

{ #category : 'accessing' }
EntropyModel >> gridSize: anObject [

	gridSize := anObject
]

{ #category : 'initialization' }
EntropyModel >> initialize [ 
	coordinates := OrderedCollection new.
	gridSize := 10.
	entropyLogs := OrderedCollection new.
	self entropy: 0.0
]
