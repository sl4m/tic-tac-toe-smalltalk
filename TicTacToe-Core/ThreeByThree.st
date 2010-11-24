Board subclass: ThreeByThree [
  | winningPatterns list |

  ThreeByThree class >> new [
    ^super new initialize
  ]

  ThreeByThree class >> create: existingBoard [
    ^self new
          list: existingBoard
  ]

  initialize [
    winningPatterns := #((0 1 2) (3 4 5) (6 7 8) (0 3 6) (1 4 7) (2 5 8) (0 4 8) (2 4 6)).
    list := {' ' . ' ' . ' ' . ' ' . ' ' . ' ' . ' ' . ' ' . ' '}.
  ]

  winningPatterns [
    ^winningPatterns
  ]

  list: existingBoard [
    list := existingBoard.
  ]

  list [
    ^list
  ]

  size [
    ^list size
  ]

  rowSize [
    ^list size sqrt
  ]
]
