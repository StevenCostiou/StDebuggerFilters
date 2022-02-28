"
A filter for selectors
"
Class {
	#name : #StSelectorStackFilter,
	#superclass : #StDebuggerStackFilter,
	#instVars : [
		'selectors'
	],
	#category : #'NewTools-DebuggerFilters-model'
}

{ #category : #'instance creation' }
StSelectorStackFilter class >> forSelector: aSelector [
	|filter|
	
	filter:= self new.
	filter selectors add: aSelector.
	^ filter
]

{ #category : #'instance creation' }
StSelectorStackFilter class >> forSelectors: someSelectors [
	 |filter|
	
	 filter:= self new.
	 filter selectors addAll: someSelectors.
	^ filter
]

{ #category : #initialization }
StSelectorStackFilter >> initialize [
	super initialize.
	self selectors: OrderedCollection new.
]

{ #category : #printing }
StSelectorStackFilter >> printOn: aStream [
	super printOn: aStream.
	aStream space.
	aStream << 'selector: #'.
	aStream << selectors first asSymbol
]

{ #category : #accessing }
StSelectorStackFilter >> selectors [
 	^selectors
]

{ #category : #accessing }
StSelectorStackFilter >> selectors: someSelectors [
	selectors := someSelectors
]

{ #category : #testing }
StSelectorStackFilter >> shouldDisplay: aContext [
	 ^ (self selectors  
		includes: aContext method selector) not.
]
