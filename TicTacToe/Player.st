Object subclass: Player [
  | piece board ui |

  Player class >> create: type piece: mark [
    | player |
    (type = 'Human')
      ifTrue: [
        player := Human new.
        player piece: mark.
      ].
    (type = 'Negamax')
      ifTrue: [
        player := Negamax new.
        player piece: mark
      ].
    ^player
  ]

  piece [
    ^piece
  ]

  piece: mark [
    piece := mark.
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

  ui: newUI [
    ui := newUI.
  ]

  makeMove [
    self subclassResponsibility
  ]
]
