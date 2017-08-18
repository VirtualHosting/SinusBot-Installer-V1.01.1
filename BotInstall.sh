echo "./BotInstall.sh (BotUser)"
exit 0


BOTUSER = $1


clear
greenMessage "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
kekMessage""
kekMessage  "               Unlimited Sinusbots"
kekMessage  "                   Script by"
redMessage  "                  Virtual@Hosting"
kekMessage  "              _____________________"
kekMessage ""
redMessage  "                 ts3-Virtual.de"
kekMessage""
greenMessage "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sleep 2
kekMessage  "               User anlegen"
sleep 2
adduser --disabled-login --force-badname $1
kekMessage  "               User einloggen"
sleep 1
sleep 2
sleep 2
blueMessage  "               Updaten"
apt-get update
greenessage  "               Upgraden"
apt-get upgrade
clear
greenMessage  "               Benötigte Software herunterladen"
apt-get install x11vnc xinit xvfb libxcursor1 python libav-tools ca-certificates bzip2 curl libglib2.0-0 sudo nano screen -y
rm -rf /tmp/.X11-unix/X40 /tmp/.sinusbot.lock
redMessage  "               Sinusbot downloaden"
sudo -u $1 -H sh -c ' cd && curl -O https://www.sinusbot.com/pre/sinusbot-0.9.12.3-36fce3c.tar.bz2'
redMessage  "               Youtube-DL downloaden"
sudo -u $1 -H sh -c ' cd && wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl'
sudo -u $1 -H sh -c ' cd && chmod a+x /usr/local/bin/youtube-dl'
greenMessage  "             Teamspeak Herunterladen"
sudo -u $1 -H sh -c ' cd && wget http://dl.4players.de/ts/releases/3.0.19.4/TeamSpeak3-Client-linux_amd64-3.0.19.4.run'
sudo -u $1 -H sh -c ' cd && tar xfvx sinusbot-beta.tar.bz2'
sudo -u $1 -H sh -c ' cd && chmod 755 TeamSpeak3-Client-linux_amd64-3.0.19.4.run '
sudo -u $1 -H sh -c ' cd && clear '
echo "Type ENTER, Q, Y"
sleep 2
sudo -u $1 -H sh -c ' cd && ./TeamSpeak3-Client-linux_amd64-3.0.19.4.run'

sudo -u $1 -H sh -c ' cd && cp plugin/libsoundbot_plugin.so TeamSpeak3-Client-linux_amd64/plugins/'
sudo -u $1 -H sh -c ' cd && mv config.ini.dist config.ini'
clear
echo "Type Port and Path"
sleep 2
sudo -u $1 -H sh -c ' cd && nano config.ini'
clear
sleep 2
reenMessage  "               Finish"
sleep 1
sudo -u $1 -H sh -c 'script /dev/null && cd && screen -AmdS BOT ./sinusbot -pwreset="foobar"'
sudo -u $1 -H sh -c 'screen -r'
echo "Bot start now with screen 'Bot' "
echo "You can stop the Bot with 'STRG & C' and start with 'screen -S BOTNAME ./sinusbot'"