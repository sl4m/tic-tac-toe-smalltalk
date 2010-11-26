MainTestCase subclass: HumanTestCase [
  testMakeMove [
    | move fakeStdIn console human |
    move := '4'.
    fakeStdIn := FakeStdIn new.
    console := Console new.
    console stdInput: fakeStdIn.
    console stdOutput: FakeStdOut new.
    fakeStdIn nextLine: move.
    human := Human new.
    human piece: 'X'.
    human ui: console.
    self assert: ((human makeMove) = (move asInteger)).
  ]
]
