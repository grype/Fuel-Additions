Class {
	#name : #BaselineOfFuelAdditions,
	#superclass : #BaselineOf,
	#category : #BaselineOfFuelAdditions
}

{ #category : #baselines }
BaselineOfFuelAdditions >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Fuel'
				with: [ spec repository: 'github://theseion/Fuel:3.0.0/repository' ].
			spec package: #'Fuel-Additions'.
			spec group: 'default' with: #('Fuel-Additions') ]
]
