Player subclass: Human [
  makeMove [
    ^(self ui humanPlayerMove: self piece)
  ]  
]
