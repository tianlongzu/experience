# btcd logging QA

## 1.日志系统
###日志分类

* stdout 输出到stdout+file中。
* file 输出到file中=
* db 暂时仅供elk使用，存储到file中

###初始化日志 stdout+file
#### code
Init("path", "loglevel", age)

* path log存储的路径.
* loglevel 日志级别。[debug, info, warn, error, fatal],级别一次提升。打印的日志级别必须>=设置的loglevel才能输出。例子:设置了loglevel=warn.之后调用的打印接口日志级别必须时error和fatal才能输出。
* age 日志保存时间，默认为1年

###初始化日志 db
#### code
InitElk(path)

* path db存储的路径

###打印日志
#### code
stdout -> CPrint(level, msg, data)

* level 日志级别。[DEBUG, INFO, WARN, ERROR, FATAL]. level>=ERROR会生存函数调用关系。level>=FATAL时，打印日志后，进程强制exit
* msg 当前日志标示。
* data 当前日志内容.内容为{k-v}结构

file -> CPrint(level, msg, data)

* 参数和CPrint一致

#### format in stdout and file
tid+time+level+file+func+line

* tid 线程id.区别并行日志
* time 时间

#### format in db
* time+level+msg+data

###写DB
#### code
* ElkPut(msg, data)

