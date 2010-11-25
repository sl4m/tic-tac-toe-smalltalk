TicTacToeTestCase subclass: GameTestCase [
  | board human negamax game console fakeStdIn fakeStdOut |
  setUp [
    fakeStdIn := FakeStdIn new.
    fakeStdOut := FakeStdOut new.
    console := Console new.
    console stdInput: fakeStdIn.
    console stdOutput: fakeStdOut.
    board := ThreeByThree new.
    human := Player create: 'Human' piece: 'X'.
    negamax := Player create: 'Negamax' piece: 'O'.
    game := Game create: board ui: console playerX: human playerO: negamax
  ]

  testPlayersInGame [
    self assert: (game playerX = human).
    self assert: (game playerO = negamax).
  ]

  testBoardInGame [
    self assert: (game board = board).
  ]

  testUiInGame [
    self assert: (game ui = console).
  ]

  testPlayersHoldBoard [
    self assert: (game playerX board = board).
    self assert: (game playerO board = board).
  ]

  testPlayersHoldUi [
    self assert: (game playerX ui = console).
    self assert: (game playerO ui = console).
  ]

  testMoveForHumanPlayer [
    |  move |
    move := '1'.
    fakeStdIn nextLine: move.
    self assert: ((game moveFrom: human) = 1).
  ]

  testMoveForNegamaxPlayer [
    | move |
    board move: 1 piece: 'X'.
    move := game moveFrom: negamax.
    self assert: (negamax bestMoves includes: move).
  ]

  testMoveForNegamaxPlayer2 [
    | move |
    board move: 1 piece: 'O'.
    board move: 4 piece: 'X'.
    board move: 5 piece: 'X'.

    self assert: ((game moveFrom: negamax) = 6).
  ]

  testCurrentPlayer [
    self assert: ((game currentPlayer) = human).
    fakeStdIn nextLine: '4'.
    game makeMove: human.
    self assert: ((game currentPlayer) = negamax).
  ]
]
