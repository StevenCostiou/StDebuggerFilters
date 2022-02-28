Class {
	#name : #StAddDebuggerStackFilterCommand,
	#superclass : #SpToolCommand,
	#category : #'NewTools-DebuggerFilters-presenters'
}

{ #category : #executing }
StAddDebuggerStackFilterCommand >> execute [
	self context newDebuggerStackFilter: self newFilter
]

{ #category : #accessing }
StAddDebuggerStackFilterCommand >> name [ 
	^self subclassResponsibility 
]

{ #category : #executing }
StAddDebuggerStackFilterCommand >> newFilter [
	self subclassResponsibility 
]
