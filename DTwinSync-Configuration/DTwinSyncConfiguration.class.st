Class {
	#name : 'DTwinSyncConfiguration',
	#superclass : 'Object',
	#instVars : [
		'brokerHost'
	],
	#category : 'DTwinSync-Configuration',
	#package : 'DTwinSync-Configuration'
}

{ #category : 'initialization' }
DTwinSyncConfiguration class >> setLogo [
	| form logoMorph |
	form := Form fromFileNamed: FileLocator workingDirectory fullName
		        ,
		        '/hsdt1.png'.
	logoMorph := ImageMorph new image: form.
	PolymorphSystemSettings setDesktopLogoWith: logoMorph
]

{ #category : 'accessing' }
DTwinSyncConfiguration >> brokerHost [

	^ brokerHost
]

{ #category : 'accessing' }
DTwinSyncConfiguration >> brokerHost: anObject [

	brokerHost := anObject
]
