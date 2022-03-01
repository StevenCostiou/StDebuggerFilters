Class {
	#name : #StDebuggerStackFilterOutStrategy,
	#superclass : #StDebuggerStackFilterStrategy,
	#category : #'NewTools-DebuggerFilters-model'
}

{ #category : #'as yet unclassified' }
StDebuggerStackFilterOutStrategy >> evaluate: aFilter for: aContext [
	^(aFilter shouldDisplay: aContext) 
]

{ #category : #printing }
StDebuggerStackFilterOutStrategy >> printOn: aStream [
	aStream space.
	aStream << 'out'
]
