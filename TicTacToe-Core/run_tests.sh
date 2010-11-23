echo "\nBuilding TicTacToe-Core package...\n"
gst-package -t ~/.st package.xml
echo "\nRunning TicTacToe-Core tests...\n"
gst-sunit -p TicTacToe-Core
