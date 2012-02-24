Object subclass: Game [
  | board ui playerX playerO |

  Game class >> create: newBoard ui: newUi playerX: newPlayerX playerO: newPlayerO [
    ^self new
          board: newBoard;
          ui: newUi;
          playerX: newPlayerX board: newBoard ui: newUi;
          playerO: newPlayerO board: newBoard ui: newUi;
          yourself
  ]

  board [
    ^board
  ]

  board: newBoard [
    board := newBoard.
  ]

  ui [
    ^ui
  ]

  ui: newUi [
    ui := newUi.
  ]

  playerX [
    ^playerX
  ]

  playerX: newPlayerX board: newBoard ui: newUi [
    playerX := newPlayerX.
    playerX board: newBoard;
            ui: newUi.
  ]

  playerO [
    ^playerO
  ]

  playerO: newPlayerO board: newBoard ui: newUi [
    playerO := newPlayerO.
    playerO board: newBoard;
            ui: newUi.
  ]

  moveFrom: player [
    | move |
    [true]
      whileTrue: [
        move := player makeMove.
        (board isValidMove: move)
          ifTrue: [^move].
      ].
  ]

  makeMove: player [
    (self board isGameOver)
      ifFalse: [
        | playerMove |
        playerMove := self moveFrom: player.
        self board move: playerMove piece: player piece.
        self ui displayBoard: self board list.
      ].
  ]

  currentPlayer [
    (self board movesMade \\ 2 = 0)
      ifTrue: [^self playerX]
      ifFalse: [^self playerO].
  ]

  play [
    self ui displayBoard: self board list.
    [self board isGameOver]
      whileFalse: [
        self makeMove: self currentPlayer.
      ].
    self endOfPlay.
  ]

  endOfPlay [
    self displayEndMessage.
    self ui displayTryAgain.
  ]

  displayEndMessage [
    | winner |
    winner := board winner.
    (winner = board noWinner)
      ifTrue: [self ui displayDrawMessage]
      ifFalse: [self ui displayWinner: winner].
  ]
]
