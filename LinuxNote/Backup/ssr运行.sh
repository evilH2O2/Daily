#!/bin/bash
# ubuntu抽风时，ssr进程不关闭，懒得手动关进程了,顺带学一下shell


prot=1080
cxname="SSR"

b=`lsof -i:${prot} | grep LISTEN`


function run(){
    echo "运行${cxname}"
	python /home/h2o2/Tools/shadowsocksr/shadowsocks/local.py -c /home/h2o2/Tools/shadowsocksr/config.json
}

if [ -z "${b}" ]; then
    echo -e "端口未被占用\n"
    run
else
    p=`echo ${b:0:18} | grep -P '\d{2,5}' -o`
    echo -e "\n${prot} 端口被占用：PID= ${p} ,建议先查看占用程序 PID 是否正确"
    while ( true ); do
        echo -en "\n是否杀死这个占用进程或查看占用进程或退出本程序[y/n/c/e]:"
        read age
        
        if [ -z ${age} ]; then
            echo "未选择"
        elif [ ${age} == 'y' ]; then
            echo "Y"
            kill -9 ${p}
            echo -e "\n${p} 进程已杀死"
            echo -en "\n是否运行${cxname} [y/n]"
            read vl
	    if [[ ${vl} && ${vl} == 'y' ]]; then
	    	run
	    else
	        exit 0
	    fi
        elif [ ${age} == 'n' ]; then
            echo "N"
            break
        elif [ ${age} == 'e' ]; then
            echo -e "\n已退出"
            exit 0
        elif [ ${age} == 'c' ]; then
            netstat -apn | grep ${prot} | grep LISTEN
        else
            echo "选择错误"
        fi
    done      
fi
