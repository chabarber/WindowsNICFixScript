@echo off

	:LOOP
	ping 8.8.8.8
	IF ERRORLEVEL 1 goto RESTART
	IF ERRORLEVEL 0 goto LOOP
	:RESTART
	netsh interface set interface "LAN" disabled
	ping -n 3 127.0.0.1
	netsh interface set interface "LAN" enabled
	ping -n 15 127.0.0.1
	goto LOOP