Boot to LiveCD to Ubuntu

Open Gparted

Find /dev/sda* (250Mb) (Example: sda5)

sudo su; cd /tmp; mkdir boot temp; mount /dev/sda5 /tmp/boot; cd /boot;

cp state.tgz /tmp /temp; cd ..; cd /temp; tar xvf state.tgz; tar xvf local.tgz; rm *.tgz; cd etc

vi/nano shadow (find root:*:xxxxxx:x:xxxxx:x:::) and remove * in root:*:)

:wq (vi) / Ctrl+X and Y and Enter to save (nano)

cd ..

tar cvf local.tgz etc

tar cvf state.tgz local.tgz

cp state.tgz /tmp/boot

umount /tmp/

boot

Reboot and login root with no password.
