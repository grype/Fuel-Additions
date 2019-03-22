"
I provide export/import facility to an object, using FUEL.

I provide two methods:
	- #fuelOut: on the instance side
	- #fuelIn: on the class side
	
Extend any object with this protocol and you'll be able to dump it into a file via #fuelOut:, and re-create an instace via #fuelIn:
"
Trait {
	#name : #TFuelable,
	#category : #'Fuel-Additions'
}

{ #category : #'instance creation' }
TFuelable classSide >> fuelIn: aFilePath [
	| result |
	result := nil.
	aFilePath asFileReference
		binaryReadStreamDo: [ :str | 
			| gzip |
			gzip := GZipReadStream on: str.
			result := FLMaterializer newDefault materializeFrom: gzip.
			gzip close ].
	^ result root
]

{ #category : #exporting }
TFuelable >> fuelOut: aFilePath [
	aFilePath asFileReference
		binaryWriteStreamDo: [ :str | 
			| gzip |
			gzip := GZipWriteStream on: str.
			FLSerializer serialize: self on: gzip.
			gzip close ]
]
