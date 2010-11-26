MainTestCase subclass: ConsoleTestCase [
  | console fakeStdIn fakeStdOut |
  setUp [
    fakeStdIn := FakeStdIn new.
    fakeStdOut := FakeStdOut new.
    console := Console new.
    console stdInput: fakeStdIn.
    console stdOutput: fakeStdOut.
  ]

  testInputFromUser [
    | testString |
    testString := 'hello world'.
    fakeStdIn nextLine: testString.
    self assert: (console userInput = testString).
  ]

  testPlayerTypeInputFromUser [
    | human |
    human := 'h'.
    fakeStdIn nextLine: human.
    self assert: ((console playerType: 'X') = human).
    self assert: (fakeStdOut message = 'Choose player type for X (enter ''h'' for human or ''u'' for unbeatable cpu) ')
  ]

  testHumanPlayerMove [
    | move |
    move := '4'.
    fakeStdIn nextLine: move.
    self assert: ((console humanPlayerMove: 'X') = move asInteger).
    self assert: (fakeStdOut message = 'Enter your move (1-9), player X: ').
  ]

  testDisplayBoardLayout [
    | list board bar space vSpace expectedBoardLayout |
    list := Array new: 9 withAll: 'O'.
    board := ThreeByThree create: list.
    console displayBoard: board list.
    bar := '---+---+---'.
    space := ' '.
    vSpace := ' | '.
    expectedBoardLayout := space, (list at: 1) asString, vSpace, (list at: 2) asString, vSpace, (list at: 3) asString, bar,
                           space, (list at: 5) asString, vSpace, (list at: 5) asString, vSpace, (list at: 6) asString, bar,
                           space, (list at: 7) asString, vSpace, (list at: 8) asString, vSpace, (list at: 9) asString.
    self assert: (fakeStdOut message = expectedBoardLayout).
  ]

  testNegamaxMoveMessage [
    console displayNegamaxMoveMessage: 'O'.
    self assert: (fakeStdOut message = 'Player ''O'' is making a move').
  ]

  testDisplayWinner [
    console displayWinner: 'X'.
    self assert: (fakeStdOut message = 'The winner is X!!!').
  ]

  testDisplayTryAgain [
    console displayTryAgain.
    self assert: (fakeStdOut message = 'Do you want to play again? (''y'' or ''n'') ').
  ]

  testDisplayDrawMessage [
    console displayDrawMessage.
    self assert: (fakeStdOut message = 'The game is a draw.').
  ]

  testDisplayExitMessage [
    console displayExitMessage.
    self assert: (fakeStdOut message = 'Thanks for playing!').
  ]

  testIsPlayingAgainOnNo [
    fakeStdIn nextLine: 'n'.
    self assert: ((console isPlayingAgain) not).
  ]

  testIsPlayingAgainOnYes [
    fakeStdIn nextLine: 'y'.
    self assert: (console isPlayingAgain).
  ]
]
