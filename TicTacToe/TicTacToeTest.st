MainTestCase subclass: TicTacToeTestCase [
  | ttt |

  setUp [
    ttt := TicTacToe create.
  ]

  testUi [
    self assert: (ttt ui class = Console new class).
  ]
]
