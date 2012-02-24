Object subclass: FakeStdOut [
  | message |

  message [
    ^message
  ]

  cr []

  show: newMessage [
    (message isNil)
      ifTrue: [message := ''].
    message := message, newMessage.
  ]
]
