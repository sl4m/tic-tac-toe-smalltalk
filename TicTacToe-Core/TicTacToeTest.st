TestCase subclass: TicTacToeTestCase [
  thisArray: firstArray equalsTo: secondArray [
    | passFlag |
    firstArray isArray
      ifFalse: [^ false].
    secondArray isArray
      ifFalse: [^ false].
    firstArray size = secondArray size
      ifFalse: [^ false].

    passFlag := true.
    1 to: firstArray size do: [ :index |
      (firstArray at: index) = (secondArray at: index)
        ifFalse: [passFlag := false].
    ].
    ^passFlag
  ]
]
