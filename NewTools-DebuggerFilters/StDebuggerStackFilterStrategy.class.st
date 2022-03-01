Class {
	#name : #StDebuggerStackFilterStrategy,
	#superclass : #Object,
	#category : #'NewTools-DebuggerFilters-model'
}

{ #category : #'as yet unclassified' }
StDebuggerStackFilterStrategy >> evaluate: aFilter for: aContext [
	^(aFilter shouldDisplay: aContext) not
]

{ #category : #printing }
StDebuggerStackFilterStrategy >> printOn: aStream [
	aStream space.
	aStream << 'for'
]
