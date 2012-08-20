@echo off
set trunkDir=D:\work\10.12.2.60\sanguo\code\server\trunk\
set outputDir=D:\work\10.12.2.60\sanguo\code\server\trunk\output

cd  %outputDir%\
del *.jar



cd %trunkDir%\core
echo "��������core���롣����"
tortoiseproc /command:update /path:"." /closeonend:2
echo "����core..."
cmd /C mvn -U clean compile package deploy
copy .\target\core-1.0-SNAPSHOT.jar %outputDir%

cd %trunkDir%\game_db
echo "��������db���롣����"
tortoiseproc /command:update /path:"." /closeonend:2
echo "����db..."
cmd /C mvn -U clean compile package deploy
copy .\target\game_db-1.0-SNAPSHOT.jar %outputDir% 

cd %trunkDir%\log_server 
cmd /C mvn -U clean compile package  deploy
copy .\target\log_server-1.0-SNAPSHOT.jar %outputDir% 

cd %trunkDir%\game_server
echo "��������game_server���롣����"
tortoiseproc /command:update /path:"." /closeonend:2
echo "����game_server..."
cmd /C mvn -U clean compile package deploy
copy .\target\game_server-1.0-SNAPSHOT.jar %outputDir%

cmd /C mvn -U dependency:copy-dependencies -DoutputDirectory=%outputDir%


pause