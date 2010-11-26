Player subclass: Negamax [
  | scores |

  scores [
    ^scores
  ]

  scores: newScores [
    scores := newScores.
  ]

  opponent: piece [
    (piece = 'O')
      ifTrue: [^'X'].
    (piece = 'X')
      ifTrue: [^'O'].
  ]

  evaluatedScore: board piece: mark depth: level [
    | opponent |
    opponent := self opponent: mark.
    (board winner = mark)
      ifTrue: [
        (level = 2)
          ifTrue: [^2]
          ifFalse: [^1].
      ].
    (board winner = opponent)
      ifTrue: [
        (level = 2)
          ifTrue: [^-2]
          ifFalse: [^-1].
      ].
    ^0
  ]

  resetScores [
    scores := Array new: (self board size) withAll: -999.
  ]

  makeMove [
    | newBoard |
    self ui displayNegamaxMoveMessage: self piece.
    self resetScores.
    newBoard := self board list shallowCopy.
    self negamax: (ThreeByThree create: newBoard) piece: self piece depth: 1.
    ^self bestRandomMove.
  ]

  negamax: board piece: mark depth: level [
    (board isGameOver)
      ifTrue: [^self evaluatedScore: board piece: mark depth: level]
      ifFalse: [
        | bestScore opp emptySquares |
        bestScore := -999.
        opp := self opponent: mark.
        emptySquares := board emptySquares.
        emptySquares do: [ :square |
          | score |
          board move: square piece: mark.
          score := (self negamax: board piece: opp depth: level + 1) negated.
          board clear: square.
          (level = 1)
            ifTrue: [self scores at: square put: score].
          (score > bestScore)
            ifTrue: [bestScore := score].
        ].
        ^bestScore
      ].
  ]

  bestRandomMove [
    | bestMoves randomIndex |
    bestMoves := self bestMoves.
    randomIndex := (((bestMoves size - 1) * (Random new next)) + 1) asInteger.
    ^bestMoves at: randomIndex
  ]

  bestMoves [
    | max indexes counter |
    max := self highestScore.
    indexes := Array new: (self highestScoreCount).
    counter := 1.

    1 to: self scores size do: [ :index | 
      ((self scores at: index) = max)
      ifTrue: [
        indexes at: counter put: index.
        counter := counter + 1.
      ].
    ].
    ^indexes
  ]

  highestScoreCount [
    | max |
    max := self highestScore.
    ^(self scores count: [ :each | each = max])
  ]

  highestScore [
    ^(self scores inject: 0 into: [:m :e | m max: e ])
  ]
]
