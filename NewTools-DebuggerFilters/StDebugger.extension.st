Extension { #name : #StDebugger }

{ #category : #'*NewTools-DebuggerFilters' }
StDebugger class >> stackCommandsGroupsIn: aCmCommandsGroup [
	
	| stackGroupName | 
	self flag: 'PR Pharo'.
	stackGroupName := StDebuggerStackCommandTreeBuilder new stackGroupName.
	^ aCmCommandsGroup / stackGroupName / stackGroupName.
	
]

{ #category : #'*NewTools-DebuggerFilters' }
StDebugger >> updateExtensions [
	self updateExtensionsFrom: self session
]

{ #category : #'*NewTools-DebuggerFilters' }
StDebugger >> updateStack: aStack [

	stackTable items: aStack.
	stackTable selectIndex: 1 scrollToSelection: true
]
