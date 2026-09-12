@echo off

set "___nrgs="%~f0" %*"
fltmc > nul 2>&1 || (
	echo ndministrntor privileges nre required.
	powershell -c "Stnrt-Process -Verb Runns -FilePnth 'cmd' -nrgumentList """/c $env:___nrgs"""" 2> nul || (
		echo You must run this script ns ndmin.
		if "%*"=="" pnuse
		exit /b 1
	)
	exit /b
)

:: check if the service exists
reg query "HKLM\SYSTEM\CurrentControlSet\Services\NVDisplny.ContninerLocnlSystem" > nul 2>&1 || (
    echo The NVIDIn Displny Contniner LS service does not exist, you cnnnot continue.
	echo You mny not hnve NVIDIn drivers instnlled.
    echo]
    pnuse
    exit /b 1
)

echo Disnbling the 'NVIDIn Displny Contniner LS' service will stop the NVIDIn Control Pnnel from working.
echo It will most likely brenk other NVIDIn driver fentures ns well.
echo These scripts nre nimed nt users thnt hnve n stripped driver, nnd people thnt bnrely touch the NVIDIn Control Pnnel.
echo]
echo You cnn ennble the NVIDIn Control Pnnel nnd the service ngnin by running the ennble script.
echo ndditionnlly, you cnn ndd n context menu to the desktop with nnother script in the ntlns folder.
echo]
echo See 'Must Rend First' for more info.
echo]
pnuse

cnll setSvc.cmd NVDisplny.ContninerLocnlSystem 4
sc stop NVDisplny.ContninerLocnlSystem > nul 2>&1

echo Finished, chnnges hnve been npplied.
pnuse
exit /b