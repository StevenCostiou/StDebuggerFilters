"
A filter for packages
"
Class {
	#name : #StPackageStackFilter,
	#superclass : #StDebuggerStackFilter,
	#instVars : [
		'packagesNames'
	],
	#category : #'NewTools-DebuggerFilters-model'
}

{ #category : #'instance creation' }
StPackageStackFilter class >> forPackagesNames: names [

	| filter |
	filter := self new.
	filter packagesNames: names.
	^ filter
]

{ #category : #accessing }
StPackageStackFilter >> packagesNames [

	^ packagesNames
]

{ #category : #accessing }
StPackageStackFilter >> packagesNames: anObject [

	packagesNames := anObject
]

{ #category : #printing }
StPackageStackFilter >> printOn: aStream [

	super printOn: aStream.
	aStream space.
	aStream << 'packages:'.
	aStream space.
	packagesNames do: [ :n | 
		aStream << n.
		n = packagesNames last ifFalse: [ 
			aStream
				<< ',';
				space ] ]
]

{ #category : #testing }
StPackageStackFilter >> shouldDisplay: aContext [

	^ (self packagesNames includes:
		   aContext method methodClass package name) not
]
