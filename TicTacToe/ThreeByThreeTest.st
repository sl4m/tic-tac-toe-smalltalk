MainTestCase subclass: ThreeByThreeTestCase [
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

  testDrawGame [
    board move: 1 piece: 'X'.
    board move: 2 piece: 'O'.
    board move: 3 piece: 'X'.
    board move: 4 piece: 'O'.
    board move: 5 piece: 'O'.
    board move: 6 piece: 'X'.
    board move: 7 piece: 'X'.
    board move: 8 piece: 'X'.
    board move: 9 piece: 'O'.
    self assert: (board winner = board noWinner).
    self assert: (board isGameOver).
  ]

  testWinningGame [
    board move: 1 piece: 'X'.
    board move: 2 piece: 'X'.
    board move: 3 piece: 'X'.
    self assert: (board winner = 'X').
    self assert: (board isGameOver).
  ]

  testFindPatternForO [
    board move: 1 piece: 'O'.
    board move: 2 piece: 'O'.
    board move: 3 piece: 'O'.
    board findPattern: #(1 2 3).
    self assert: ((board winner) = 'O').
  ]

  testFindPatternForX [
    board move: 1 piece: 'X'.
    board move: 5 piece: 'X'.
    board move: 9 piece: 'X'.
    board findPattern: #(1 5 9).
    self assert: ((board winner) = 'X').
  ]

  testFindPatternForEmptyBoard [
    board findPattern: #(1 2 3).
    self assert: ((board winner) = board noWinner).
    board findPattern: #(4 5 6).
    self assert: ((board winner) = board noWinner).
    board findPattern: #(7 8 9).
    self assert: ((board winner) = board noWinner).
    board findPattern: #(1 5 9).
    self assert: ((board winner) = board noWinner).
    board findPattern: #(3 5 7).
    self assert: ((board winner) = board noWinner).
  ]
]
