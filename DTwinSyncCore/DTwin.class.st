Class {
	#name : 'DTwin',
	#superclass : 'DTwinBaseline',
	#instVars : [
		'physicalCounterpart',
		'physicalData'
	],
	#category : 'DTwinSyncCore',
	#package : 'DTwinSyncCore'
}

{ #category : 'control' }
DTwin >> getDataStream: physicalCounterpartId [
	"mqttclient1 := MQTTClient new.
	mqttclient1 
		clientId: self id asString;
		open.
"
	(mqttclients at: 'ps2dt') subscribeToTopic: 'uv','/data/', physicalCounterpartId asString.
	"read the flux of data from the reality"
	self streamPhysicalData .
]

{ #category : 'initialization' }
DTwin >> initialize [ 
	super initialize.
	physicalData := OrderedCollection new.
	mqttclients at: 'ps2dt' put: (MQTTClient new).
	mqttclients at: 'dt2dt' put: (MQTTClient new).
	
	(mqttclients at: 'ps2dt') clientId: id; host: 'localhost'; open.
	physicalData := OrderedCollection new.
	
]

{ #category : 'control' }
DTwin >> load: aService [
]

{ #category : 'accessing' }
DTwin >> physicalCounterpart [

	^ physicalCounterpart
]

{ #category : 'accessing' }
DTwin >> physicalCounterpart: anObject [

	physicalCounterpart := anObject
]

{ #category : 'accessing' }
DTwin >> physicalData [

	^ physicalData
]

{ #category : 'accessing' }
DTwin >> physicalData: anObject [

	physicalData := anObject
]

{ #category : 'control' }
DTwin >> start: anPhysicalCounterpart [
	"[self discoverSuperviser. Processor yield ] fork."
	self getDataStream: anPhysicalCounterpart id.
]

{ #category : 'control' }
DTwin >> streamPhysicalData [
	[[
    [
		self physicalData add: (mqttclients at: 'ps2dt') readMessage contents asString
    ] on: ConnectionTimedOut do: [ :ex |
        self inform: 'end of stream, stopping the loop'.
        ex pass.
    ].
	] repeat. Processor yield] fork.
]
