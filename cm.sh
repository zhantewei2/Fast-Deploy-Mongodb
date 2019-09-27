my_path=$(cd `dirname $0`;pwd)
conf_file=$my_path/lib/conf/mongod.conf
mongod_bin=$my_path/lib/mongodb/bin/mongod

if [ "$1" == "start" ];then
  echo "start"
  cat $conf_file

  $mongod_bin -f $conf_file

elif [ "$1" == "stop" ];then
  pid=`ps -ef |grep $mongod_bin\ -f\ $conf_file|grep -v grep|awk '{print $2}'`
  if [ $pid ];then 
    echo "stop" $pid
    kill $pid
    echo "stop successfull"
  else
    echo "not running"
  fi
fi