::echo off ::
@echo off
echo ��ʼִ�����ݿ�ű�...
for %%i in (database_script\all_script\*.sql) do (
echo ����ִ�� %%i ���Ժ�...
echo set names utf8;>all.sql
echo source %%i>>all.sql
mysql -u root -p123456 --max_allowed_packet=1048576 --net_buffer_length=16384 < all.sql
echo %%i ִ����ϡ�
)
del all.sql
echo ���нű�ִ����ϡ�

if exist C:\software\src_mysql\kjse (
	echo ��ʼɾ����ǰ��kjse����...
	rd /S /Q C:\software\src_mysql\kjse
)
md C:\software\src_mysql\kjse
echo ��ʼ�����µ�kjse����...
xcopy kjse C:\software\src_mysql\kjse /s /e /y /q
echo ���ڹر�tomcat...
call shutdown.bat
if exist C:\software\apache-tomcat-7.0.79\webapps\smgj (
	echo ��ʼɾ����ǰ��jar��...
	rd /S /Q C:\software\apache-tomcat-7.0.79\webapps\smgj
)
if exist C:\software\apache-tomcat-7.0.79\webapps\smgj.war (
	del C:\software\apache-tomcat-7.0.79\webapps\smgj.war
)
echo ��ʼ�����µ�jar��...
xcopy smgj.war C:\software\apache-tomcat-7.0.79\webapps /s /e /y /q


echo ��������tomcat...
call startup.bat

pause