"
I instantiate a StSelectorStackFilter filter for the StDebugger.
I require the user to provide a string corresponding to the selector to filter.
"
Class {
	#name : #StAddSelectorFilterCommand,
	#superclass : #StAddDebuggerStackFilterCommand,
	#category : #'NewTools-DebuggerFilters-presenters'
}

{ #category : #executing }
StAddSelectorFilterCommand >> newFilter [

	| selector |
	selector := UIManager default
		            request: 'Provide the selector to filter:'
		            initialAnswer: 'selector'
		            title: 'Create selector stack filter'.

	^ StSelectorStackFilter forSelector: selector asSymbol
]

{ #category : #accessing }
StAddSelectorFilterCommand >> targetFilter [ 
	^'selector'
]
