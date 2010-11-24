Board subclass: FakeBoard [
]

TicTacToeTestCase subclass: BoardTestCase [
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
]
