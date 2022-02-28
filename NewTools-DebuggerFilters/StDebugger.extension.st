Extension { #name : #StDebugger }

{ #category : #'*NewTools-DebuggerFilters' }
StDebugger >> addPackageFilterFromStackSelection [

	| contextSelection selectedContextPackageName filter |
	contextSelection := self selectedContext.
	selectedContextPackageName := contextSelection method package name asString.
	filter := StPackageStackFilter forPackagesNames: (OrderedCollection with: selectedContextPackageName).
	StDebuggerStackFilter activateFilter: filter.
	self updateExtensions
]

{ #category : #'*NewTools-DebuggerFilters' }
StDebugger class >> filterPackageStackCommandWith: aPresenter forRootGroup: aCmCommandsGroup [
	<extensionCommands>
	| command stackGroup | 
	command := StAddPackageFilterFromStackCommand forSpecContext: aPresenter.
	command iconName: #smallAdd.	
	
	stackGroup := self stackCommandsGroupsIn: aCmCommandsGroup.
	stackGroup register: command
]

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
