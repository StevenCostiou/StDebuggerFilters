"
I present and control filters for the stack of the StDebugger.
I am designed to be used as an extension of the StDebugger.
"
Class {
	#name : #StDebuggerStackFilterPresenter,
	#superclass : #StPresenter,
	#instVars : [
		'filterTable'
	],
	#category : #'NewTools-DebuggerFilters-presenters'
}

{ #category : #layout }
StDebuggerStackFilterPresenter class >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: #filterTable expand: true fill: true;
		  yourself
]

{ #category : #initialization }
StDebuggerStackFilterPresenter >> initializePresenters [

	super initializePresenters.
	filterTable := self newTable.
	filterTable addColumn: ((SpCheckBoxTableColumn
			  title: ' '
			  evaluated: [ :filter | StDebuggerStackFilter isActive: filter ])
			 onActivation: [ :filter | 
				 StDebuggerStackFilter activateFilter: filter ];
			 onDeactivation: [ :filter | 
				 StDebuggerStackFilter deactivateFilter: filter ];
			 width: 20;
			 yourself).
	filterTable addColumn:
		(SpStringTableColumn title: 'Filter' evaluated: #printString).
	filterTable items: StDebuggerStackFilter activeStackFilters 
]
