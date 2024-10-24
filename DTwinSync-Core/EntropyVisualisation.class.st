Class {
	#name : 'EntropyVisualisation',
	#superclass : 'DTwinService',
	#instVars : [
		'data'
	],
	#category : 'DTwinSync-Core',
	#package : 'DTwinSync-Core'
}

{ #category : 'accessing' }
EntropyVisualisation >> data [

	^ data
]

{ #category : 'accessing' }
EntropyVisualisation >> data: anObject [

	data := anObject
]

{ #category : 'api' }
EntropyVisualisation >> display [
	| collection collection1 c p keys |
	collection := OrderedCollection withAll: #(1 4 2 5 3 6 4 7).
	collection1 := (dt models at: 'EntropyModel') entropyLogs.
	keys := OrderedCollection new.
	1 to: collection1 size do: [ :i |
		keys add: i.
		].
	c := RSCompositeChart new.
	p := RSLinePlot new x: keys y: collection1 .
	c add: p.

	c xlabel: 'Steps'.
	c ylabel: 'Entropy'.
	c horizontalTick doNotUseNiceLabel.

	c addDecoration: (RSHorizontalTick new doNotUseNiceLabel asFloat: 3).
	c addDecoration: RSVerticalTick new.
	c open.
	^ c
]

{ #category : 'initialization' }
EntropyVisualisation >> initialize [ 
	super initialize .
	data := OrderedCollection new.
]
