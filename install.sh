my_path=$(cd `dirname $0`;pwd)
resources_path=$my_path/resources
lib_path=$my_path/lib
mongodb_path=$lib_path/mongodb

function check_lib(){
  if [ ! -d "$lib_path" ];then
    echo "create $lib_path"
    mkdir $lib_path
  fi

  if [ -d "$mongodb_path" ];then
    echo "clear old mongodb_path :$mongodb_path"
    rm -rf $mongodb_path
  fi
}


function unpackageMongodb(){
  list=`cd $resources_path;ls`
  
  for i in $list;do
    index=`expr match "$i" mongodb`
    if [ $index -gt 0 ]&&[ -f $resources_path/$i ] ;then
      # check lib
      check_lib
      # next run
      folder_name=`echo ${i%.*}`
      cd $resources_path
      tar -zxvf $i
      mv $folder_name $mongodb_path
      rm -rf $folder_name
      break
    fi
  done

}

unpackageMongodb $resources_path