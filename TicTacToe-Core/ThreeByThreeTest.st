TicTacToeTestCase subclass: ThreeByThreeTestCase [
  | board expectedWinningPatterns |

  setUp [
    board := ThreeByThree new.
    expectedWinningPatterns := #((1 2 3) (4 5 6) (7 8 9) (1 4 7) (2 5 8) (3 6 9) (1 5 9) (3 5 7)).
  ]

  testWinningPatternsSize [
    self assert: (board winningPatterns size == 8).
    board winningPatterns do: [ :pattern |
      self assert: (pattern size = 3).
    ].
  ]

  testWinningPatterns [
    self assert: expectedWinningPatterns = board winningPatterns.
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
    existingBoard := {$X . $O . $X . $O . $X . $O . $O . $O . $X}.
    board := ThreeByThree create: existingBoard.
    self assert: (board ~= nil).
    self assert: (board size = 9).
    self assert: (board list asString = 'XOXOXOOOX').
  ]

  testMovingPieceOnBoard [
    board move: 1 piece: $X.
    self assert: (board isOccupied: 1).
  ]

  testDoesNotMovePieceOnOccupiedSquare [
    board move: 1 piece: $O.
    board move: 1 piece: $X.
    self assert: ((board pieceIn: 1) = $O).
  ]

  testDrawGame [
    board move: 1 piece: $X.
    board move: 2 piece: $O.
    board move: 3 piece: $X.
    board move: 4 piece: $O.
    board move: 5 piece: $O.
    board move: 6 piece: $X.
    board move: 7 piece: $X.
    board move: 8 piece: $X.
    board move: 9 piece: $O.
    self assert: (board noWinner = board winner).
    self assert: (board isGameOver).
  ]
]
