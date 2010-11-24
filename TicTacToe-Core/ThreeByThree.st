Board subclass: ThreeByThree [
  | winningPatterns list winner |

  ThreeByThree class >> new [
    ^super new initialize
  ]

  ThreeByThree class >> create: existingBoard [
    ^self new
          list: existingBoard
  ]

  initialize [
    winningPatterns := #((1 2 3) (4 5 6) (7 8 9) (1 4 7) (2 5 8) (3 6 9) (1 5 9) (3 5 7)).
    list := Array new: 9 withAll: ' '.
    self resetWinner.
  ]

  winningPatterns [
    ^winningPatterns
  ]

  list: existingBoard [
    list := existingBoard.
  ]

  list [
    ^list
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
    ^((1 <= square) & (square <= list size) and: [(self isOccupied: square) not])
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

  findPattern: pattern [
    ((list at: (pattern at: 1)) = $X & (list at: (pattern at: 2)) = $X & (list at: (pattern at: 3)) = $X)
      ifTrue: [winner := $X].
    ((list at: (pattern at: 1)) = $O & (list at: (pattern at: 2)) = $O & (list at: (pattern at: 3)) = $O)
      ifTrue: [winner := $O].
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
