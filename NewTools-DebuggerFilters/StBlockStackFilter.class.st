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

{ #category : #printing }
StBlockStackFilter >> printOn: aStream [

	super printOn: aStream.
	aStream space.
	aStream << 'block:'.
	aStream space.
	aStream << block method ast sourceCode
]

{ #category : #testing }
StBlockStackFilter >> shouldDisplay: aContext [
	 ^self block value: aContext
]
