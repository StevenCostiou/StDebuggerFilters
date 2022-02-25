"
SUnit test for debugger filters
"
Class {
	#name : #StDebutterStackFilterTest,
	#superclass : #TestCase,
	#instVars : [
		'context',
		'process',
		'session',
		'nilContext',
		'otherProcess',
		'otherSession',
		'activeFilters'
	],
	#category : #'NewTools-DebuggerFilters-Tests'
}

{ #category : #running }
StDebutterStackFilterTest >> setUp [
	super setUp.
	context := [ (Set with: 1 with: 2) collect: [ :e | e * 2 ]] asContext.
	process := Process 
		forContext: context 
		priority: Processor userInterruptPriority.
	session := process newDebugSessionNamed: 'test session' startedAt: context.
	nilContext := [ self isNil ] asContext.
	otherProcess := Process 
		forContext: nilContext 
		priority: Processor userInterruptPriority.
	otherSession := otherProcess newDebugSessionNamed: 'other session' startedAt: nilContext.
	otherSession stepInto.
	activeFilters := StDebuggerStackFilter activeStackFilters copy.
	StDebuggerStackFilter activeStackFilters removeAll
]

{ #category : #tests }
StDebutterStackFilterTest >> testActivateFilter [
	|kernelFilter|
	
	kernelFilter := StKernelClassesStackFilter new.
	StDebuggerStackFilter activateFilter: kernelFilter.
	
	self assert: (StDebuggerStackFilter isActive: kernelFilter)
	
]

{ #category : #tests }
StDebutterStackFilterTest >> testBlockFilter [
	| fromBlockFilter |
	
	fromBlockFilter := [ :ctx | ctx isNotNil ] asFilter.
	self assert: (fromBlockFilter shouldDisplay: context)
]

{ #category : #tests }
StDebutterStackFilterTest >> testBooleanFilter [
	| kernelFilter doItFilter filters booleanFilter |
	
	kernelFilter := StKernelClassesStackFilter new.
	doItFilter := StSelectorStackFilter forSelector: #doIt.
	filters := OrderedCollection with: kernelFilter with: doItFilter.
	booleanFilter := StBooleanStackFilter withFilters: filters operator: #or:.
	self assert: (booleanFilter shouldDisplay: context)
]

{ #category : #tests }
StDebutterStackFilterTest >> testDeactivateFilter [
	|kernelFilter|
	
	kernelFilter := StKernelClassesStackFilter new.
	StDebuggerStackFilter activeStackFilters add: kernelFilter.
	
	StDebuggerStackFilter deactivateFilter: kernelFilter.
	self deny: (StDebuggerStackFilter isActive: kernelFilter)
	
]

{ #category : #tests }
StDebutterStackFilterTest >> testIsActive [
	|fromBlockFilter kernelFilter|
	
	fromBlockFilter := [ :ctx | ctx isNotNil ] asFilter.
	kernelFilter := StKernelClassesStackFilter new.
	StDebuggerStackFilter activeStackFilters add: kernelFilter.
	
	self assert: (StDebuggerStackFilter isActive: kernelFilter).
	self deny: (StDebuggerStackFilter isActive: fromBlockFilter).
]

{ #category : #tests }
StDebutterStackFilterTest >> testKernelClassesFilter [
	| kernelClassesFilter setContext |
	
	setContext := session stepInto stepInto stack first.
	kernelClassesFilter := StKernelClassesStackFilter new.
	self assert: (kernelClassesFilter shouldDisplay: context).
	self assert: (kernelClassesFilter shouldDisplay: nilContext).
	self deny: (kernelClassesFilter shouldDisplay: setContext)
]

{ #category : #tests }
StDebutterStackFilterTest >> testSelectorFilter [
	| doItFilter nilMessagesFilter |
	
	doItFilter := StSelectorStackFilter forSelector: #doIt.
	self assert: (doItFilter shouldDisplay: context).
	self assert: (doItFilter shouldDisplay: nilContext).
	nilMessagesFilter := StSelectorStackFilter forSelectors: (OrderedCollection with: #isNil with: #ifNil:).
	self assert: (nilMessagesFilter shouldDisplay: context)	"self deny: (nilMessagesFilter shouldDisplay: otherSession context)"
]
