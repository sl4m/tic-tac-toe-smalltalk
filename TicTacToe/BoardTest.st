Board subclass: FakeBoard [
  FakeBoard class >> new [
    ^super new initialize
  ]

  FakeBoard class >> create: existingBoard [
    ^super new initialize
  ]

  initialize [
    winningPatterns := #((1) (4) (7) (1) (2) (3) (1) (3)).
    list := Array new: 9 withAll: ' '.
  ]

  findPattern: pattern [
  ]
]

MainTestCase subclass: BoardTestCase [
  | board |

  setUp [
    board := FakeBoard new.
  ]

  testEmptySquare [
    self assert: board emptySquare = ' '
  ]

  testNoWinner [
    self assert: board noWinner = ' '
  ]

  testDefaultBoardSize [
    self assert: (board size = 9).
  ]

  testRowSize [
    self assert: (board rowSize = 3).
  ]

  testList [
    self assert: (board list = {' ' . ' ' . ' ' . ' ' . ' ' . ' ' . ' ' . ' ' . ' '}).
  ]

  testCreateBoard [
    | board existingBoard |
    existingBoard := {'X' . 'O' . 'X' . 'O' . 'X' . 'O' . 'O' . 'O' . 'X'}.
    board := ThreeByThree create: existingBoard.
    self assert: (board ~= nil).
    self assert: (board size = 9).
    self assert: (board listAsString = 'XOXOXOOOX').
  ]

  testMovingPieceOnBoard [
    board move: 1 piece: 'X'.
    self assert: (board isOccupied: 1).
  ]

  testDoesNotMovePieceOnOccupiedSquare [
    board move: 1 piece: 'O'.
    board move: 1 piece: 'X'.
    self assert: ((board pieceIn: 1) = 'O').
  ]

  testValidMoves [
    1 to: 9 do: [ :square |
      self assert: (board isValidMove: square).
    ]
  ]

  testInvalidMoves [
    self assert: ((board isValidMove: board size + 1) not).
    self assert: ((board isValidMove: 0) not).
  ]

  testPieceIn [
    board move: 1 piece: 'X'.
    board move: 2 piece: 'O'.
    self assert: ((board pieceIn: 1) = 'X').
    self assert: ((board pieceIn: 2) = 'O').
    self assert: ((board pieceIn: 3) = board emptySquare).
  ]

  testEmptySquares [
    self assert: (board emptySquares size = 9).
    board move: 1 piece: 'X'.
    self assert: (board emptySquares size = 8).
  ]

  testClearMove [
    board move: 1 piece: 'X'.
    board clear: 1.
    self assert: ((board isOccupied: 1) not).
    self assert: (board listAsString = '         ').
  ]

  testNumberOfMovesMade [
    board move: 1 piece: 'O'.
    board move: 2 piece: 'X'.
    board move: 3 piece: 'O'.
    self assert: (board movesMade = 3).
  ]
]
