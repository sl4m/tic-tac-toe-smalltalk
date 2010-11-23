Board subclass: FakeBoard [
]

TicTacToeTestCase subclass: BoardTestCase [
  testNoWinner [
    | board |
    board := FakeBoard new.
    self assert: board noWinner = ' '
  ]
]
