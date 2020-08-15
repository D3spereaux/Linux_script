#!/bin/bash

if [ -f "speedtest-cli" ]; then
			echo
		else
		#Download speedtest script
			wget https://raw.githubusercontent.com/D3spereaux/Linux_script/master/Scripting/speedtest-cli
		#Permission to execute
			chmod +x speedtest-cli
		fi

#Remove old file
rm speedtest_info.txt
clear; echo
date | tee -a speedtest_info.txt

#Testing with list Server in Vietnam.
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 6106  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 26853 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 2515  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 18250 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 8158  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 3381  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 8491  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 9668  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 22708 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 16749 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 27601 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 13373 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 30149 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 6102  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 16873 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 10040 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 19294 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 19060 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 27630 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 6085  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 9903  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 2552  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 6342  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 9174  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 8156  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 5774  | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 10308 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 16416 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 33443 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 34705 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt
echo "---------------------------------------------------------" | tee -a speedtest_info.txt
./speedtest-cli --server 34909 | egrep 'Hosted|Download|Upload'  | tee -a speedtest_info.txt

#List Server using for Speedtest (VIETNAM)
#2515)  FPT Telecom (Ho Chi Minh City, Vietnam)
#18250) CMC Telecom (Ho Chi Minh, Vietnam)
#8158)  VTC DIGICOM (Ho Chi Minh City, Vietnam)
#3381)  NetNam (Ho Chi Minh City, Vietnam
#8491)  SCTV Co.Ltd (Ho Chi Minh City, Vietnam)
#9668)  Supernet (Ho Chi Minh City, Vietnam)
#22708) DCNET (Ho Chi Minh City, Vietnam)
#16749) Vietnamobile (Ho Chi Minh, VN)
#27601) Viettel Network (Dong Nai, Vietnam)
#13373) SPT4 (Can Tho, Vietnam)
#30149) Cloudzone (Danang, Vietnam)
#6102)  VNPT-NET (Da Nang, Vietnam)
#16873) Vietnamobile (Da Nang, VN)
#10040) Viettel Network (Da Nang, Vietnam)
#19294) PowerNet (Da Nang, Vietnam)
#19060) GIAM PING VIETPN.COM (Da Nang, Vietnam)
#27630) Viettel Network (Hue, Vietnam)
#6085)  VNPT-NET (Hanoi, Vietnam)
#9903)  Viettel Network (Hanoi, Vietnam)
#2552)  FPT Telecom (Hanoi, Vietnam)
#6342)  CMC Telecom (Hanoi, Vietnam)
#9174)  MOBIFONE (Hanoi, Vietnam)
#8156)  VTC DIGICOM (Hanoi, Vietnam)
#5774)  NetNam Corp (Hanoi, Vietnam)
#10308) Supernet-hanoi (Hanoi, Vietnam)
#16416) Vietnamobile (Hanoi, Viet Nam)
#33443) BKNS.VN (Hanoi, Vietnam)
#34705) ZHOST CMC (Ha Noi, Vietnam)
#34909) VTVCab (Hanoi, Vietnam)
