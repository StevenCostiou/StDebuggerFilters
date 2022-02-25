"
A filter for kernel classes
"
Class {
	#name : #StKernelClassesStackFilter,
	#superclass : #StDebuggerStackFilter,
	#instVars : [
		'kernelClasses'
	],
	#category : #'NewTools-DebuggerFilters-model'
}

{ #category : #initialization }
StKernelClassesStackFilter >> initialize [
	
	super initialize.
	kernelClasses := self kernelClassesToExclude asOrderedCollection.
	kernelClasses := kernelClasses 
		addAll: (kernelClasses collect: #class);
		yourself
	
]

{ #category : #private }
StKernelClassesStackFilter >> kernelClassesToExclude [
	^ {Boolean.
	True.
	False.
	BlockClosure.
	Context.
	Array.
	OrderedCollection.
	Set.
	IdentitySet.
	Dictionary.
	IdentityDictionary.
	Class.
	Metaclass.
	Behavior.
	SmallInteger.
	Float.
	Error.
	Exception.
	UndefinedObject.
	MessageSend}
]

{ #category : #testing }
StKernelClassesStackFilter >> shouldDisplay: aContext [
	^ (kernelClasses includes: aContext receiver class) not
]
