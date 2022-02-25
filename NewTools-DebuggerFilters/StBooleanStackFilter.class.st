"
A filter for booleans
"
Class {
	#name : #StBooleanStackFilter,
	#superclass : #StDebuggerStackFilter,
	#instVars : [
		'filters',
		'booleanOperator'
	],
	#category : #'NewTools-DebuggerFilters-model'
}

{ #category : #'instance creation' }
StBooleanStackFilter class >> withFilters: someFilters operator: booleanOperator [
	^self new 
		filters: someFilters; 
		booleanOperator: booleanOperator
]

{ #category : #accessing }
StBooleanStackFilter >> booleanOperator [
	^booleanOperator
]

{ #category : #accessing }
StBooleanStackFilter >> booleanOperator: aSymbol [
	booleanOperator:= aSymbol
]

{ #category : #accessing }
StBooleanStackFilter >> filters [
	^filters
]

{ #category : #accessing }
StBooleanStackFilter >> filters: theFilters [
	filters:= theFilters
]

{ #category : #testing }
StBooleanStackFilter >> shouldDisplay: aContext [
	^ (self filters first shouldDisplay: aContext) perform: booleanOperator with: [self filters last shouldDisplay: aContext]  
]
