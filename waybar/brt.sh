while : 
do
	printf '%s 🖵\n' `brightnessctl i | grep 'Current' | sed -n -e 's/^.*(//p' | sed 's/)//'`
	sleep 1
done
