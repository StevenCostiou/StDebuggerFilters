"
A filter on the current stack for debugging
"
Class {
	#name : #StDebuggerStackFilter,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#classInstVars : [
		'isActive',
		'activeStackFilters'
	],
	#category : #'NewTools-DebuggerFilters-model'
}

{ #category : #'api - filter' }
StDebuggerStackFilter class >> activateFilter: aStackFilter [

	self activeStackFilters add: aStackFilter
]

{ #category : #accessing }
StDebuggerStackFilter class >> activeStackFilters [
	^activeStackFilters ifNil:[activeStackFilters := Set new]
]

{ #category : #'api - filter' }
StDebuggerStackFilter class >> deactivateFilter: aStackFilter [

	self activeStackFilters
		remove: aStackFilter
		ifAbsent: [  ]
]

{ #category : #'api - filter' }
StDebuggerStackFilter class >> isActive: aStackFilter [

	^ activeStackFilters includes: aStackFilter
]

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
