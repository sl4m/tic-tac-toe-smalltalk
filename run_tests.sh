echo "\nBuilding TicTacToe package...\n"
gst-package -t ~/.st TicTacToe/package.xml
echo "\nRunning TicTacToe tests...\n"
gst-sunit -p TicTacToe
