@echo off
javac -d bin -classpath ..\bin src\exceptions\*.java
cd src
javac -d ..\bin -classpath ..\javacup\java-cup-11b.jar;..\bin;..\graph\jgraph.jar;..\graph\callgraph.jar;..\graph\flowchart.jar *.java
cd ..
pause
@echo on
