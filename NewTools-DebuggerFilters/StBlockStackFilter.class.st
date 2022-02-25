"
A filter for blocks
"
Class {
	#name : #StBlockStackFilter,
	#superclass : #StDebuggerStackFilter,
	#instVars : [
		'block'
	],
	#category : #'NewTools-DebuggerFilters-model'
}

{ #category : #'instance creation' }
StBlockStackFilter class >> forBlock: aBlockClosure [
	^ self new block: aBlockClosure
]

{ #category : #accessing }
StBlockStackFilter >> block [
	 ^block
]

{ #category : #accessing }
StBlockStackFilter >> block: aBlockClosure [
	block:= aBlockClosure
]

{ #category : #testing }
StBlockStackFilter >> shouldDisplay: aContext [
	 ^self block value: aContext
]
