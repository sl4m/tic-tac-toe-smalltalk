Object subclass: Console [
  | stdInput stdOutput lastDisplayedMessage |

  Console class >> new [
    ^super new initialize
  ]

  initialize [
    stdInput := stdin.
    stdOutput := Transcript.
  ]

  stdInput [
    ^stdInput
  ]

  stdInput: in [
    stdInput := in.
  ]

  stdOutput [
    ^stdOutput
  ]

  stdOutput: output [
    stdOutput := output.
  ]

  userInput [
    ^stdInput nextLine.
  ]

  playerType: piece [
    stdOutput cr;
              show: 'Choose player type for ', piece asString, ' (enter ''h'' for human or ''u'' for unbeatable cpu) '.
    ^self userInput
  ]

  humanPlayerMove: piece [
    stdOutput cr;
              show: 'Enter your move, player ', piece asString, ': '.
    ^(self userInput asInteger)
  ]

  isPlayingAgain [
    [true]
      whileTrue: [
        | input |
        input := self userInput.
        (input = 'y')
          ifTrue: [^true].
        (input = 'n')
          ifTrue: [^false].
        self displayTryAgain.
      ].
  ]

  displayBoard: list [
    | bar space vSpace |
    bar := '---+---+---'. 
    space := ' '.
    vSpace := ' | '.
    stdOutput cr;
              show: space, (list at: 1) asString, vSpace, (list at: 2) asString, vSpace, (list at: 3) asString;
              cr;
              show: bar;
              cr;
              show: space, (list at: 4) asString, vSpace, (list at: 5) asString, vSpace, (list at: 6) asString;
              cr;
              show: bar;
              cr; 
              show: space, (list at: 7) asString, vSpace, (list at: 8) asString, vSpace, (list at: 9) asString;
              cr.
  ]

  displayNegamaxMoveMessage: piece [
    stdOutput cr;
              show: 'Player ''', piece asString, ''' is making a move';
              cr.
  ]

  displayWinner: piece [
    stdOutput cr;
              show: 'The winner is ', piece asString, '!!!'.
  ]

  displayDrawMessage [
    stdOutput cr;
              show: 'The game is a draw.'.
  ]

  displayTryAgain [
    stdOutput cr; cr;
              show: 'Do you want to play again? (''y'' or ''n'') '.
  ]

  displayExitMessage [
    stdOutput cr;
              show: 'Thanks for playing!';
              cr.
  ]
]
