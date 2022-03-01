"
I instantiate a StPackageStackFilter filter for the StDebugger.
I require the user to provide a string corresponding to the name of the package to filter.
"
Class {
	#name : #StAddPackageFilterCommand,
	#superclass : #StAddDebuggerStackFilterCommand,
	#category : #'NewTools-DebuggerFilters-presenters'
}

{ #category : #executing }
StAddPackageFilterCommand >> newFilter [

	| chooser |
	chooser := SpChooserPresenter
		           sourceItems: RPackageOrganizer default packages
		           chosenItems: {  }
		           displayBlock: #packageName.
	chooser sourceList displayIcon: [ self iconNamed: #packageIcon ].
	chooser targetList displayIcon: [ self iconNamed: #packageIcon ].
	chooser openModal.

	^ StPackageStackFilter forPackagesNames:
		  (chooser chosenItems collect: [ :p | p name asString ])
]

{ #category : #accessing }
StAddPackageFilterCommand >> targetFilter [ 
	^'package'
]
