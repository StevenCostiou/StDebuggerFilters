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
		'activeStackFilters',
		'filterCache'
	],
	#category : #'NewTools-DebuggerFilters-model'
}

{ #category : #'api - filter' }
StDebuggerStackFilter class >> activateFilter: aStackFilter [

	self activeStackFilters add: aStackFilter.
	(self filterCache includes: aStackFilter) ifFalse: [ 
		self cacheFilter: aStackFilter ]
]

{ #category : #accessing }
StDebuggerStackFilter class >> activeStackFilters [
	^activeStackFilters ifNil:[activeStackFilters := OrderedCollection new]
]

{ #category : #accessing }
StDebuggerStackFilter class >> activeStackFilters: anObject [
	activeStackFilters := anObject
]

{ #category : #'api - filter' }
StDebuggerStackFilter class >> cacheFilter: aDebuggerStackFilter [ 
	self filterCache add: aDebuggerStackFilter
]

{ #category : #'api - filter' }
StDebuggerStackFilter class >> deactivateFilter: aStackFilter [

	self activeStackFilters
		remove: aStackFilter
		ifAbsent: [  ]
]

{ #category : #accessing }
StDebuggerStackFilter class >> filterCache [
	^filterCache ifNil:[filterCache := Set new]
]

{ #category : #accessing }
StDebuggerStackFilter class >> filterCache: anObject [
	filterCache := anObject
]

{ #category : #'api - filter' }
StDebuggerStackFilter class >> isActive: aStackFilter [

	^ activeStackFilters includes: aStackFilter
]

{ #category : #'api - filter' }
StDebuggerStackFilter class >> removeFilter: aStKernelClassesStackFilter [ 
	self deactivateFilter: aStKernelClassesStackFilter.
	self uncacheFilter: aStKernelClassesStackFilter
]

{ #category : #'api - filter' }
StDebuggerStackFilter class >> uncacheFilter: aStackFilter [ 
	self filterCache
		remove: aStackFilter
		ifAbsent: [  ]
]

{ #category : #operators }
StDebuggerStackFilter >> and: aFilter [
	  ^ StBooleanStackFilter withFilters: (OrderedCollection with: self with: aFilter) operator: #and:
]

{ #category : #operators }
StDebuggerStackFilter >> or: aFilter [
	  ^ StBooleanStackFilter withFilters: (OrderedCollection with: self with: aFilter) operator: #or:
]

{ #category : #printing }
StDebuggerStackFilter >> printOn: aStream [
	aStream << 'Filter'

]

{ #category : #testing }
StDebuggerStackFilter >> shouldDisplay: aContext [
	^self subclassResponsibility 
]
