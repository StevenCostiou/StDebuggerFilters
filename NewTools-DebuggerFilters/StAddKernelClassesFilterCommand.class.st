"
I instantiate a StKernelClassesStackBlock filter for the StDebugger.
"
Class {
	#name : #StAddKernelClassesFilterCommand,
	#superclass : #StAddDebuggerStackFilterCommand,
	#category : #'NewTools-DebuggerFilters-presenters'
}

{ #category : #accessing }
StAddKernelClassesFilterCommand >> name [ 
	^'Filter kernal classes'
]

{ #category : #executing }
StAddKernelClassesFilterCommand >> newFilter [
	^StKernelClassesStackFilter new
]
