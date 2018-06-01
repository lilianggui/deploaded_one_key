::echo off ::
@echo off
echo 开始执行数据库脚本...
for %%i in (database_script\all_script\*.sql) do (
echo 正在执行 %%i 请稍后...
echo set names utf8;>all.sql
echo source %%i>>all.sql
mysql -u root -p123456 --max_allowed_packet=1048576 --net_buffer_length=16384 < all.sql
echo %%i 执行完毕。
)
del all.sql
echo 所有脚本执行完毕。

if exist C:\software\src_mysql\kjse (
	echo 开始删除以前的kjse代码...
	rd /S /Q C:\software\src_mysql\kjse
)
md C:\software\src_mysql\kjse
echo 开始拷贝新的kjse代码...
xcopy kjse C:\software\src_mysql\kjse /s /e /y /q
echo 正在关闭tomcat...
call shutdown.bat
if exist C:\software\apache-tomcat-7.0.79\webapps\smgj (
	echo 开始删除以前的jar包...
	rd /S /Q C:\software\apache-tomcat-7.0.79\webapps\smgj
)
if exist C:\software\apache-tomcat-7.0.79\webapps\smgj.war (
	del C:\software\apache-tomcat-7.0.79\webapps\smgj.war
)
echo 开始拷贝新的jar包...
xcopy smgj.war C:\software\apache-tomcat-7.0.79\webapps /s /e /y /q


echo 正在启动tomcat...
call startup.bat

pause