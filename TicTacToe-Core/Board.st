Object subclass: Board [
  emptySquare [
    ^' '
  ]

  noWinner [
    ^self emptySquare
  ]

  winningPatterns [
    self subclassResponsibility
  ]

  list [
    self subclassResponsibility
  ]

  size [
    self subclassResponsibility
  ]

  rowSize [
    self subclassResponsibility
  ]
]
