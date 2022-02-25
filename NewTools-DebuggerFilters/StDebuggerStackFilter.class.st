"
A filter on the current stack for debugging
"
Class {
	#name : #StDebuggerStackFilter,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#category : #'NewTools-DebuggerFilters-model'
}

{ #category : #operators }
StDebuggerStackFilter >> and: aFilter [
	  ^ StBooleanStackFilter withFilters: (OrderedCollection with: self with: aFilter) operator: #and:
]

{ #category : #operators }
StDebuggerStackFilter >> or: aFilter [
	  ^ StBooleanStackFilter withFilters: (OrderedCollection with: self with: aFilter) operator: #or:
]

{ #category : #testing }
StDebuggerStackFilter >> shouldDisplay: aContext [
	^self subclassResponsibility 
]
