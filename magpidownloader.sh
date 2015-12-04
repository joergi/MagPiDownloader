

mkdir issues

issues=40
i=11

while [ $i -le $issues ]
do
	wget https://www.raspberrypi.org/magpi-issues/MagPi$i.pdf -P issues/
	i=$(( i+1 ))
done


