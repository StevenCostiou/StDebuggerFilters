"
I instantiate a StKernelClassesStackBlock filter for the StDebugger.
"
Class {
	#name : #StAddKernelClassesFilterCommand,
	#superclass : #StAddDebuggerStackFilterCommand,
	#category : #'NewTools-DebuggerFilters-presenters'
}

{ #category : #executing }
StAddKernelClassesFilterCommand >> newFilter [
	^StKernelClassesStackFilter new
]

{ #category : #accessing }
StAddKernelClassesFilterCommand >> targetFilter [ 
	^'kernel classes'
]
