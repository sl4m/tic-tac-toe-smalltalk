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
    list := {' ' . ' ' . ' ' . ' ' . ' ' . ' ' . ' ' . ' ' . ' '}.
    winner := self noWinner
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

  isOccupied: square [
    ^((list at: square) ~= self emptySquare)
  ]

  winner [
    ^winner
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
  
  isGameOver [
   ^((self someoneWinner | (self anyEmptySquares not)))
  ]
]
