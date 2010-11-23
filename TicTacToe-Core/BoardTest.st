TicTacToeTestCase subclass: BoardTestCase [
  | board expectedWinningPatterns |

  setUp [
    board := Board new.
    expectedWinningPatterns := #((0 1 2) (3 4 5) (6 7 8) (0 3 6) (1 4 7) (2 5 8) (0 4 8) (2 4 6)).
  ]

  testWinningPatternsSize [
    self assert: (board winningPatterns size == 8).
    board winningPatterns do: [ :pattern |
      self assert: (pattern size = 3)
    ].
  ]

  testWinningPatterns [
    self assert: expectedWinningPatterns = board winningPatterns.
  ]

  testDefaultBoardSize [
    "self assert: (board size = 9)"
  ]
]
