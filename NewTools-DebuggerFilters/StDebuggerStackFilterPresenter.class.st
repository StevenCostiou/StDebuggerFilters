"
I present and control filters for the stack of the StDebugger.
I am designed to be used as an extension of the StDebugger.
"
Class {
	#name : #StDebuggerStackFilterPresenter,
	#superclass : #StPresenter,
	#traits : 'TStDebuggerExtension',
	#classTraits : 'TStDebuggerExtension classTrait',
	#instVars : [
		'filterTable'
	],
	#category : #'NewTools-DebuggerFilters-presenters'
}

{ #category : #'as yet unclassified' }
StDebuggerStackFilterPresenter class >> buildAddFilterCommand: presenter [

	| cmd |
	cmd := StAddDebuggerStackFilterCommand forSpecContext: presenter.
	cmd iconName: #smallAdd.
	^ cmd
]

{ #category : #'as yet unclassified' }
StDebuggerStackFilterPresenter class >> buildAddFilterCommand: cmdClass in: presenter [

	| cmd |
	cmd := cmdClass forSpecContext: presenter.
	cmd iconName: #smallAdd.
	^ cmd
]

{ #category : #'as yet unclassified' }
StDebuggerStackFilterPresenter class >> buildRemoveFilterCommand: presenter [

	| cmd |
	cmd := StRemoveDebuggerStackFilterCommand forSpecContext: presenter.
	cmd iconName: #smallDelete.	
	^ cmd
]

{ #category : #'as yet unclassified' }
StDebuggerStackFilterPresenter class >> debuggerStackFilterCommandsIn: presenter forRootGroup: aCmCommandsGroup [

	<extensionCommands>
	StAddDebuggerStackFilterCommand subclasses do: [ :c | 
		aCmCommandsGroup register:
			(self buildAddFilterCommand: c in: presenter) ].

	aCmCommandsGroup register: (self buildRemoveFilterCommand: presenter)
]

{ #category : #'debugger extension' }
StDebuggerStackFilterPresenter class >> defaultDisplayOrder [

	^ -1
]

{ #category : #layout }
StDebuggerStackFilterPresenter class >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: #filterTable expand: true fill: true;
		  yourself
]

{ #category : #'debugger extension' }
StDebuggerStackFilterPresenter >> debuggerExtensionToolName [
	^'Stack filtering'
]

{ #category : #initialization }
StDebuggerStackFilterPresenter >> initializePresenters [

	super initializePresenters.
	filterTable := self newTable.
	filterTable addColumn: ((SpCheckBoxTableColumn
			  title: ' '
			  evaluated: [ :filter | StDebuggerStackFilter isActive: filter ])
			 onActivation: [ :filter | 
				 StDebuggerStackFilter activateFilter: filter.
				 self updatePresenter ];
			 onDeactivation: [ :filter | 
				 StDebuggerStackFilter deactivateFilter: filter.
				 self updatePresenter ];
			 width: 20;
			 yourself).
	filterTable addColumn:
		(SpStringTableColumn title: 'Filter' evaluated: #printString).
	filterTable items:
		StDebuggerStackFilter filterCache asOrderedCollection.
	filterTable contextMenu: self rootCommandsGroup asMenuPresenter
]

{ #category : #actions }
StDebuggerStackFilterPresenter >> newDebuggerStackFilter: newFilter [
	StDebuggerStackFilter activateFilter: newFilter.
	filterTable items add: newFilter.
	self updateFilters
]

{ #category : #actions }
StDebuggerStackFilterPresenter >> removeSelectedDebuggerStackFilter [

	StDebuggerStackFilter removeFilter:
		filterTable selection selectedItem.
	self updatePresenter
]

{ #category : #updating }
StDebuggerStackFilterPresenter >> updateFilters [
	
	self update
]

{ #category : #updating }
StDebuggerStackFilterPresenter >> updatePresenter [

	| stack |
	filterTable items:
		StDebuggerStackFilter filterCache asOrderedCollection.
	stack := self currentDebugger session stack.
	StDebuggerStackFilter activeStackFilters do: [ :filter | 
		stack := stack select: [ :context | filter shouldDisplay: context ] ].
	self currentDebugger updateStack: stack
]
