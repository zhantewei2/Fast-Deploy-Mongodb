my_path=$(cd `dirname $0`;pwd)
conf_path=$my_path/conf

data_path=$my_path/data

port=9806
maxConns=20000
bind_ip=0.0.0.0
dbpath=$data_path/db
logpath=$data_path/log/mongod.log
pidfilepath=$data_path/log/mongod.pid

real_conf_path=$my_path/lib/conf
real_conf_file=$real_conf_path/mongod.conf
file_content=""

base_config(){
  file_content="
fork=true
pidfilepath=$pidfilepath
dbpath=$dbpath
logpath=$logpath
port=$port
logappend=true
bind_ip=$bind_ip
maxConns=$maxConns
  "
}

create_dir(){
  dir_path=$@
  if [ ! -e "$dir_path" ];then
    mkdir $dir_path
  fi
}

for line in `cat $conf_path/mongodb-overlay.conf`; do
  annotation=`expr match "$line" "#"`
  if [ $annotation -eq 0 ];then
    eval "$line"
  fi 
done

create_dir $data_path
create_dir $dbpath
create_dir $data_path/log

create_dir $my_path/lib
create_dir $real_conf_path

base_config

cat>$real_conf_file<<EOF
$file_content
EOF