spip="wg-kr.heimayun.me"
spport="23333"
s=$(echo $(($(cat /usr/local/x-ui/bin/config.json | grep -o "port.*" | grep -n "23333" | cut -c 1)-1)))
id=$(cat /usr/local/x-ui/bin/config.json | grep -o '"id".*' | sed -n "$s"p | cut -d '"' -f4)
fakeid=$(echo $RANDOM | md5sum | cut -c 1-22)
md5="3d99ff138e1f41e931e58617e7d128e2"
spkey=$(echo -n "if5ax/?fakeid=$fakeid&spid=81117&pid=81117&spip=$spip&spport=$spport$md5" | md5sum | cut -d " " -f1)
url=$(curl -s -X GET -H "Host:dir.wo186.tv:809" -H "User-Agent:Mozilla/5.0 (Linux; Android 11; M2012K11AC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36" "http://dir.wo186.tv:809/if5ax/?fakeid=$fakeid&spid=81117&pid=81117&spip=$spip&spport=$spport&spkey=$spkey" | grep -o "url.*" | cut -d '"' -f3 | sed 's/\\//g')
host=$(echo $url | cut -d "/" -f3 | cut -d ":" -f1)
port=$(echo $host | cut -d ":" -f2)
path=$(echo $url | grep -o "/if5ax.*")
enpath=$(echo $path | sed 's/=/\\u003d/g' | sed 's/&/\\u0026/g')
config=$(echo -n "{\"add\":\"$host\",\"aid\":\"0\",\"host\":\"$host\",\"id\":\"$id\",\"net\":\"ws\",\"path\":\"$enpath\",\"port\":\"809\",\"ps\":\"联通809免流\",\"scy\":\"auto\",\"sni\":\"\",\"tls\":\"\",\"type\":\"\",\"v\":\"2\"}" | base64 -w 0)
echo -n "vmess://$config" | base64 -w 0 > /www/wwwroot/wg-kr.heimayun.me/809
fi
fi
