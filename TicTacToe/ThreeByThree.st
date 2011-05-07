Board subclass: ThreeByThree [
  ThreeByThree class >> new [
    ^super new initialize
  ]

  ThreeByThree class >> create: existingBoard [
    ^self new
          list: existingBoard;
          yourself
  ]

  initialize [
    super initialize.
    winningPatterns := #((1 2 3) (4 5 6) (7 8 9) (1 4 7) (2 5 8) (3 6 9) (1 5 9) (3 5 7)).
    list := Array new: 9 withAll: ' '.
  ]

  findPattern: pattern [
    ((list at: (pattern at: 1)) = 'X' & (list at: (pattern at: 2)) = 'X' & (list at: (pattern at: 3)) = 'X')
      ifTrue: [winner := 'X'].
    ((list at: (pattern at: 1)) = 'O' & (list at: (pattern at: 2)) = 'O' & (list at: (pattern at: 3)) = 'O')
      ifTrue: [winner := 'O'].
  ]
]
