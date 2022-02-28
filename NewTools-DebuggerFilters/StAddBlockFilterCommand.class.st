"
I instantiate a StBlockStackBlock filter for the StDebugger.
I require the user to provide a string containing the source of the block.
"
Class {
	#name : #StAddBlockFilterCommand,
	#superclass : #StAddDebuggerStackFilterCommand,
	#category : #'NewTools-DebuggerFilters-presenters'
}

{ #category : #accessing }
StAddBlockFilterCommand >> name [ 
	^'Filter block'
]

{ #category : #executing }
StAddBlockFilterCommand >> newFilter [

	| source block |
	source := UIManager default
		          request: 'Provide the block source code:'
		          initialAnswer: '[:context| ]'
		          title: 'Create block stack filter'.
	block := Smalltalk compiler evaluate: source.
	^ StBlockStackFilter forBlock: block
]
