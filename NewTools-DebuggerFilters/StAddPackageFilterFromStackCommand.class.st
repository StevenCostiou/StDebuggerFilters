Class {
	#name : #StAddPackageFilterFromStackCommand,
	#superclass : #SpToolCommand,
	#category : #'NewTools-DebuggerFilters-presenters'
}

{ #category : #executing }
StAddPackageFilterFromStackCommand >> execute [
	self context addPackageFilterFromStackSelection
]

{ #category : #executing }
StAddPackageFilterFromStackCommand >> name [ 
	^'Filter package'
]
