@echo off
rem Licensed to the Apache Software Foundation (ASF) under one or more
rem contributor license agreements.  See the NOTICE file distributed with
rem this work for additional information regarding copyright ownership.
rem The ASF licenses this file to You under the Apache License, Version 2.0
rem (the "License"); you may not use this file except in compliance with
rem the License.  You may obtain a copy of the License at
rem
rem     http://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

if not exist "%JAVA_HOME%\bin\java.exe" echo Please set the JAVA_HOME variable in your environment, We need java(x64)! & EXIT /B 1

set "JAVA=%JAVA_HOME%\bin\java.exe"

setlocal
set BASE_DIR=%~dp0
set BASE_DIR=%BASE_DIR:~0,-1%
for %%d in (%BASE_DIR%) do set BASE_DIR=%%~dpd
set CLASSPATH=.;%BASE_DIR%conf;%CLASSPATH%
rem ===========================================================================================
rem JVM Configuration
rem ===========================================================================================
set "JAVA_OPT=%JAVA_OPT% -server -Xms1g -Xmx1g -Xmn256m -XX:PermSize=128m -XX:MaxPermSize=128m"
set "JAVA_OPT=%JAVA_OPT% -Djava.ext.dirs="%BASE_DIR%\lib;%BASE_DIR%\apps";"%JAVA_HOME%\jre\lib\ext""
set "JAVA_OPT=%JAVA_OPT% -cp "%CLASSPATH%""
"%JAVA%" %JAVA_OPT% cn.webank.defibus.tools.command.DeFiBusAdminStartup %*