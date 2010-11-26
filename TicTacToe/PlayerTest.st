MainTestCase subclass: PlayerTestCase [
  testCreateHumanPlayer [
    | player |
    player := Player create: 'Human' piece: 'X'.
    self assert: (player class = Human).
    self assert: (player piece = 'X').
  ]

  testCreateNegamaxPlayer [
    | player |
    player := Player create: 'Negamax' piece: 'O'.
    self assert: (player class = Negamax).
    self assert: (player piece = 'O').
  ]

  testBoard [
    | board ui player |
    board := 'fakeBoard'.
    ui := 'fakeUi'.
    player := Player create: 'Human' piece: 'O'.
    player board: board.
    player ui: ui.
    self assert: (player board = board).
    self assert: (player ui = ui).
  ]
]
