Object subclass: Board [
  | winningPatterns list winner |

  findPattern [
    self subclassResponsibility
  ]

  emptySquare [
    ^' '
  ]

  noWinner [
    ^self emptySquare
  ]

  winningPatterns [
    ^winningPatterns
  ]

  list [
    ^list
  ]

  list: existingBoard [
    list := existingBoard.
  ]

  listAsString [
    | board |
    board := ''.
    list do: [ :each |
      board := board, each asString.
    ].
    ^board
  ]

  pieceIn: square [
    ^list at: square
  ]

  size [
    ^list size
  ]

  rowSize [
    ^list size sqrt
  ]

  move: square piece: mark [
    (self isOccupied: square)
      ifFalse: [
        list at: square put: mark.
        self findWinner.
      ].
  ]

  clear: square [
    list at: square put: self emptySquare.
    self resetWinner.
  ]

  isOccupied: square [
    ^((list at: square) ~= self emptySquare)
  ]

  isValidMove: square [
    ^((square between: 1 and: list size) and: [(self isOccupied: square) not])
  ]

  winner [
    ^winner
  ]

  resetWinner [
    winner := self noWinner.
  ]

  findWinner [
    self winningPatterns do: [ :pattern |
      self findPattern: pattern.
    ]
  ]

  someoneWinner [
    self findWinner.
    ^(winner ~= self noWinner)
  ]

  anyEmptySquares [
    ^((list indexOf: self emptySquare) ~= 0)
  ]

  emptySquaresCount [
    ^(list count: [ :each | each = self emptySquare ])
  ]

  movesMade [
    ^(self size - self emptySquaresCount)
  ]

  emptySquares [
    | squares counter |
    squares := Array new: self emptySquaresCount withAll: ' '.
    counter := 1.
    1 to: self size do: [ :square |
      ((list at: square) = self emptySquare)
        ifTrue: [
          squares at: counter put: square.
          counter := counter + 1.
        ].
    ].
    ^squares
  ]
  
  isGameOver [
    ^((self someoneWinner | (self anyEmptySquares not)))
  ]
]
