TicTacToeTestCase subclass: NegamaxTestCase [
  | board player console fakeStdIn fakeStdOut |

  setUp [
    board := ThreeByThree new.
    fakeStdIn := FakeStdIn new.
    fakeStdOut := FakeStdOut new.
    console := Console new.
    console stdInput: fakeStdIn.
    console stdOutput: fakeStdOut.
    player := Negamax new.
    player piece: 'O'.
    player ui: console.
    player board: board.
  ]

  testAnswersOpponent [
    self assert: ((player opponent: 'O') = 'X').
    self assert: ((player opponent: 'X') = 'O').
  ]

  testEvaluatedScoreForWinnerMaxFromMinPOV [
    board move: 1 piece: 'O'.
    board move: 2 piece: 'O'.
    board move: 3 piece: 'O'.

    self assert: ((player evaluatedScore: board piece: 'O' depth: 3) = 1).
  ]

  testEvaluatedScoreForWinnerMaxInDepthTwoFromMinPOV [
    board move: 1 piece: 'O'.
    board move: 2 piece: 'O'.
    board move: 3 piece: 'O'.

    self assert: ((player evaluatedScore: board piece: 'O' depth: 2) = 2).
  ]

  testEvaluatedScoreForWinnerMinFromMinPOV [
    board move: 1 piece: 'X'.
    board move: 2 piece: 'X'.
    board move: 3 piece: 'X'.

    self assert: ((player evaluatedScore: board piece: 'O' depth: 3) = -1).
  ]

  testEvaluatedScoreForWinnerMinInDepthTwoFromMinPOV [
    board move: 1 piece: 'X'.
    board move: 2 piece: 'X'.
    board move: 3 piece: 'X'.

    self assert: ((player evaluatedScore: board piece: 'O' depth: 2) = -2).
  ]

  testEvaluatedScoreForWinnerMaxFromMaxPOV [
    board move: 1 piece: 'O'.
    board move: 2 piece: 'O'.
    board move: 3 piece: 'O'.
    
    self assert: ((player evaluatedScore: board piece: 'X' depth: 3) = -1).
  ]

  testEvaluatedScoreForWinnerMaxInDepthTwoFromMaxPOV [
    board move: 1 piece: 'O'.
    board move: 2 piece: 'O'.
    board move: 3 piece: 'O'.
    
    self assert: ((player evaluatedScore: board piece: 'X' depth: 2) = -2).
  ]

  testEvaluatedScoreForWinnerMinFromMaxPOV [
    board move: 1 piece: 'X'.
    board move: 2 piece: 'X'.
    board move: 3 piece: 'X'.

    self assert: ((player evaluatedScore: board piece: 'X' depth: 3) = 1).
  ]

  testEvaluatedScoreForWinnerMinInDepthTwoFromMaxPOV [
    board move: 1 piece: 'X'.
    board move: 2 piece: 'X'.
    board move: 3 piece: 'X'.
    
    self assert: ((player evaluatedScore: board piece: 'X' depth: 2) = 2).
  ]

  testEvaluatedScoreForDrawGame [
    board move: 1 piece: 'X'.
    board move: 2 piece: 'X'.
    board move: 3 piece: 'O'.
    board move: 4 piece: 'O'.
    board move: 5 piece: 'X'.
    board move: 6 piece: 'X'.
    board move: 7 piece: 'X'.
    board move: 8 piece: 'O'.
    board move: 9 piece: 'O'.

    self assert: ((player evaluatedScore: board piece: 'O' depth: 5) = 0).
    self assert: ((player evaluatedScore: board piece: 'X' depth: 5) = 0).
  ]

  testHighestScore [
    | scores |
    scores := {1 . 2 . 3 . 4 . 5 . 6 . 7 . 8 . 9}.
    player scores: scores.
    self assert: (player highestScore = 9).
  ]

  testHighestScoreCount [
    | scores |
    scores := {2 . 1 . 0 . 1 . 2 . 1 . 2 . 0 . 1}.
    player scores: scores.
    self assert: (player highestScoreCount = 3).
  ]

  testBestMoves [
    | scores |
    scores := {2 . 1 . 0 . 1 . 2 . 1 . 2 . 0 . 1}.    
    player scores: scores.
    self assert: (player bestMoves = #(1 5 7)).
  ]

  testBestRandomMove [
    | scores |
    scores := {0 . 2 . 1}.
    player scores: scores.
    self assert: (player bestRandomMove = 2).
    scores := {2 . 1 . 2 . 0 . 1 . 2}.
    player scores: scores.
    self assert: (#(1 3 6) includes: (player bestRandomMove)).
  ]

  testMaxMakesWinningMoveScenario1 [
    board move: 1 piece: 'O'.
    board move: 2 piece: 'X'.
    board move: 3 piece: 'O'.
    board move: 4 piece: 'X'.

    player makeMove.
    self assert: (#(5 9) = player bestMoves).
  ]

  testMaxMakesWinningMoveScenario2 [
    board move: 1 piece: 'X'.
    board move: 2 piece: 'O'.
    board move: 4 piece: 'X'.
    board move: 5 piece: 'X'.
    board move: 7 piece: 'O'.
    board move: 8 piece: 'O'.

    self assert: (player makeMove = 9).
  ]

  testMaxMakesWinningMoveScenario3 [
    board move: 1 piece: 'O'.
    board move: 2 piece: 'X'.
    board move: 3 piece: 'O'.
    board move: 4 piece: 'X'.
    board move: 6 piece: 'X'.
    board move: 8 piece: 'O'.

    self assert: (player makeMove = 5).
  ]

  testMaxMakesWinningMoveScenario4 [
    board move: 1 piece: 'O'.
    board move: 2 piece: 'X'.
    board move: 3 piece: 'O'.
    board move: 4 piece: 'X'.
    board move: 5 piece: 'O'.
    board move: 6 piece: 'X'.
    board move: 7 piece: 'X'.

    self assert: (player makeMove = 9).
  ]

  testMaxMakesWinningMoveScenario5 [
    board move: 1 piece: 'X'.
    board move: 2 piece: 'O'.
    board move: 3 piece: 'X'.
    board move: 5 piece: 'O'.
    board move: 9 piece: 'X'.

    self assert: (player makeMove = 8).
  ]

  testMaxMakesBlockingMoveScenario1 [
    board move: 1 piece: 'O'.
    board move: 4 piece: 'X'.
    board move: 5 piece: 'X'.

    self assert: (player makeMove = 6).
  ]

  testMaxMakesBlockingMoveScenario2 [
    board move: 1 piece: 'O'.
    board move: 5 piece: 'X'.
    board move: 9 piece: 'X'.

    player makeMove.
    self assert: (#(3 7) = player bestMoves).
  ]
]
