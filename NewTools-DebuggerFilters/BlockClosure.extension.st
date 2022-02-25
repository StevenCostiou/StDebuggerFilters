Extension { #name : #BlockClosure }

{ #category : #'*NewTools-DebuggerFilters-Extension' }
BlockClosure >> asFilter [
 	^ StBlockStackFilter forBlock: self. 
]
