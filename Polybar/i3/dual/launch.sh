#  ________ __     __   ___
# |   __   |  |   |  | /  /
# |  |__|  |  |   |  |/  /  Alejandro Barrachina (A.L.K.)
# |   __   |  |   |     <   
# |  |  |  |  |___|  |\  \  https:#github.com/ALK222
# |__|  |__|______|__| \__\
# Polybar launcher for dual monitors

#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar


polybar --reload bar-1 -c ~/.config/polybar/config &
polybar --reload bar-2 -c ~/.config/polybar/config &
