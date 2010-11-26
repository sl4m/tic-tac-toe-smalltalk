Object subclass: TicTacToe [
  | ui playerX playerO |

  TicTacToe class >> create [
    ^self new
          ui: Console new
  ]

  ui: newUi [
    ui := newUi.
  ]

  ui [
    ^ui
  ]

  playerX [
    ^playerX
  ]

  playerO [
    ^playerO
  ]

  createPlayers [
    playerX := self createPlayer: 'X'.
    playerO := self createPlayer: 'O'.
  ]

  createPlayer: mark [
    | playerType |

    [true]
      whileTrue: [
        playerType := self ui playerType: mark.
        (playerType = 'h')
          ifTrue: [^(Player create: 'Human' piece: mark)].
        (playerType = 'u')
          ifTrue: [^(Player create: 'Negamax' piece: mark)].
      ].
  ]

  startEventLoop [
    | game playAgain |
    playAgain := true.
    [playAgain]
      whileTrue: [
        self createPlayers.
        game := Game create: ThreeByThree new ui: ui playerX: playerX playerO: playerO.
        game play.
        playAgain := ui isPlayingAgain.
      ].
    self ui displayExitMessage.
  ]
]
