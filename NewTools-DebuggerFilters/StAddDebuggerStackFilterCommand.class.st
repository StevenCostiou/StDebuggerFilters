Class {
	#name : #StAddDebuggerStackFilterCommand,
	#superclass : #SpToolCommand,
	#instVars : [
		'filterOut',
		'name'
	],
	#category : #'NewTools-DebuggerFilters-presenters'
}

{ #category : #'as yet unclassified' }
StAddDebuggerStackFilterCommand class >> filterForSpecContext: presenter [
	|filterCmd|
	filterCmd := self forSpecContext: presenter.
	filterCmd decoratedCommand name: filterCmd decoratedCommand decoratedCommand targetFilter.
	filterCmd decoratedCommand iconName: #smallAdd.
	^filterCmd
]

{ #category : #'as yet unclassified' }
StAddDebuggerStackFilterCommand class >> filterOutForSpecContext: presenter [
	|filterCmd|
	filterCmd := self forSpecContext: presenter.
	filterCmd decoratedCommand decoratedCommand setFilterOut.
	filterCmd decoratedCommand name: filterCmd decoratedCommand decoratedCommand targetFilter.
	filterCmd decoratedCommand iconName: #smallAdd.
	^filterCmd
]

{ #category : #executing }
StAddDebuggerStackFilterCommand >> execute [
	|filter|
	filter := self newFilter.
	self filterOut ifTrue:[filter filterOut] ifFalse:[filter filterIn].
	self context newDebuggerStackFilter: filter
]

{ #category : #accessing }
StAddDebuggerStackFilterCommand >> filterOut [
	 ^filterOut ifNil:[filterOut := false]
]

{ #category : #accessing }
StAddDebuggerStackFilterCommand >> name [ 
	|str|
	str := WriteStream on: String new.
	str << 'Filter'.
	str space.
	str << (self filterOut ifTrue:['out'] ifFalse:['for']).
	str space.
	str << basicName.
	^str contents
]

{ #category : #executing }
StAddDebuggerStackFilterCommand >> newFilter [
	self subclassResponsibility 
]

{ #category : #accessing }
StAddDebuggerStackFilterCommand >> setFilterOut [
	filterOut := true
]

{ #category : #accessing }
StAddDebuggerStackFilterCommand >> targetFilter [
	 ^self subclassResponsibility 
]
