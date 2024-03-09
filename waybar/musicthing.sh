while true; do
	if [ `mocp -i | grep State | sed "s/State: //"` = "PLAY" ];then
		printf "<small>%s</small>" "`mocp -i | grep File | sed 's/File: \/home\/user\/Music\///' | sed 's/.ogg//'`" 
	fi
	printf " 🎵\n"
	sleep 1s
done
