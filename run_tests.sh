echo "\nBuilding TicTacToe package...\n"
gst-package TicTacToe/package.xml
echo "\nRunning TicTacToe tests...\n"
gst-sunit -p TicTacToe
