Object subclass: FakeStdIn [
  | nextLine |

  nextLine [
    ^nextLine
  ]

  nextLine: input [
    nextLine := input.
  ]
]
