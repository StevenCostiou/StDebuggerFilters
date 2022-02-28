Class {
	#name : #StRemoveDebuggerStackFilterCommand,
	#superclass : #SpToolCommand,
	#category : #'NewTools-DebuggerFilters-presenters'
}

{ #category : #executing }
StRemoveDebuggerStackFilterCommand >> execute [
	self context removeSelectedDebuggerStackFilter
]

{ #category : #accessing }
StRemoveDebuggerStackFilterCommand >> name [ 
	^'Remove filter'
]
