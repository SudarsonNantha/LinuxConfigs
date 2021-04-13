cd .config/groff/
ls
cd ~
cd Videos/groff-video/
vim groff_normal.ms 
vim ~/.local/bin/compiler 
cd ~
cd .local/bin/
vim compiler 
clear
cd ~
cd Videos/groff-video/
vim videopoints.ms 
cd Videos/groff-video/
groff -Tpdf -U -tep -mspdf videopoints.ms > videopoints.pdf
lear
clear
groff -Tps -te -ms videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tps -te -ms videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tps -te -ms videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tps -te -mspdf videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tps -tepR -mspdf videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tps -ms videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tps -tepR -mspdf videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tps -tepR -mspdf videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tps -tepR -mspdf videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tps -tepR -mspdf videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tps -e -ms videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tps -e -mspdf videopoints.ms > videopoints.ps && ps2pdf videopoints.ps 
groff -Tpdf -e -mspdf videopoints.ms > videopoints.pdf
groff -Tpdf -U -e -mspdf videopoints.ms > videopoints.pdf
cd .config/groff/
pdfroff -U -tepR -mspdf --report ms_template.ms > ms_template.pdf 
pdfroff -U -tepR -mspdf --report ms_template.ms > ms_template.pdf 
pdfroff -U -tepR -mspdf --report ms_template.ms > ms_template.pdf 
pdfroff -U -tepR -mspdf --report ms_template.ms > ms_template.pdf 
pdfroff -U -tepR -mspdf --report ms_template.ms > ms_template.pdf 
pdfroff -U -tepR -mspdf  ms_template.ms > ms_template.pdf 
pdfroff -U -tepR -mspdf  ms_template.ms > ms_template.pdf 
pdfroff -tepR -mspdf  ms_template.ms > ms_template.pdf 
pdfroff -U -tepR -mspdf  ms_template.ms > ms_template.pdf 
pdfroff -U -tepR -mspdf  ms_template.ms > ms_template.pdf 
pdfroff -tepR -mspdf  ms_template.ms > ms_template.pdf 
groff -pt -Tpdf -ms -m spdf -dPDF.EXPORT=1 -z ms_template.ms 2>&1 | grep '^.ds' | groff -pt -Tpdf -ms -m spdf ms_template.ms > ms_template.pdf 
clear
vim groff.toc 
groff -tepR -mspdf ms_template.ms > ms_template.pdf 
groff -Tpdf -tepR -mspdf ms_template.ms > ms_template.pdf 
groff -Tpdf -U -tepR -mspdf ms_template.ms > ms_template.pdf 
refer -e -p ~/Documents/bibliography ms_template.ms 
refer -e -p ~/Documents/bibliography ms_template.ms > test.ms
vim test.ms 
clear
refer ms_template.ms > test.ms
vim test.ms 
ls -1
vim ~/Videos/groff-video/FiniteElements.ms 
vim ms_template.ms 
cd Test/Mazar/
ls
vim Mazar_General.m 
cp Mazar_General.m Mazar_General_backup.m
vim Mazar_General.m 
clear
cp Mazar_General.m Mazar_3D_v1.m
mv Mazar_3D_v1.m Mazar_3D_v2.m 
cp Mazar_General_backup.m Mazar_3D_v1.m
octave-cli
cd Test/Mazar/
vim Mazar_3D_v1.m 
cp Mazar_General_backup.m Mazar_3D_v1.m 
cd Test/Mazar/
octave-cli
cd .config/groff/
vim opening_macros.ms 
vim closing_macros.ms 
vim closing_macros.ms 
vim macros.ms 
vim toc.ms
rm toc.ms 
clear
cd Examples/
vim FiniteElements.ms 
cd ..
vim opening_macros.ms 
vim closing_macros.ms 
vim ms_template.ms 
clear
rm -r Examples/
ls
vim compileCommands 
rm equations.ms 
rm figures.ms 
rm tables.ms 
vim test.ms
rm test.ms
rm test.msclear 
clear
ls -1
rm opening_macros.pdf 
rm equations.pdf 
ls -1
clear
ls -1
rm closing_macros.pdf 
rm figures.pdf 
rm tables.pdf 
clear
ls -1
git status
cd ~
clear
git status
rm -r .config/LosslessCut/
rm test.pdf 
mv FrenchOral02-04.docx Study/
rm test.pdf 
git status
clear
git add --all
git status
git commit -m "Groff modifications"
cat Backup/.gitREADME 
git pus -u origin master
git push -u origin master
clear
cd .local/bin/
ls
vim executer 
cd ~
cp Videos/groff-video/drawing.ms ~/.config/groff/
cd .config/groff/
vim drawing.ms 
vim drawing.ms 
clear
vim drawing.ms 
cd .config/groff/
vim ms_template.ms 
vim .local/bin/executer 
redshift -O 500
redshift -O 3250
clear
cd .config/groff/
vim ms_template.ms 
cp opening_macros.ms opening_macros.ms.backup
vim opening_macros.ms
vim opening_macros.ms
man groff
cat .local/bin/compiler 
cat .local/bin/ffrecord 
cd Videos/ms/
ls
ffmpeg -fflags +igndts -f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY -f alsa -i default -c:v libx265 -crf 28 -preset veryfast -c:a aac capture4.mp4
cd .config/groff/
vim ms_template.ms 
cd .config/groff/
vim drawing.
vim drawing.ms 
ffmpeg -i capture4.mp4 -c copy -an 4_noaudio.mp4
clear
ffmpeg -i 4_noaudio.mp4 -i My\ recording\ 28.wav -c:v copy -c:a aac Video4.mp4
sudo reboot
redshift -O 3250
cd .config/groff/
ls
ls -1
cat compileCommands 
cat groff.toc 
rm groff.toc 
rm input.pdf 
clear
github status
git status
cd ~
git status
mv capture1.mp4 Videos/ms/
ls Videos/ms/
rm capture2.mp4 
git status
git add .config/groff/drawing.*
git status
git add --all
git status
git commit -m "Groff updates"
cat Backup/.gitREADME 
git push -u origin master
clear
cd .config/groff/
vim equations.ms 
cd ~
vim Videos/groff-video/point.sent 
vim Videos/groff-video/FiniteElements.ms 
cd .config/groff/
vim ms_template.ms 
cd ~
git status
git add --all
git commit -m "Updated figure number"
cat Backup/.gitREADME 
git push -u origin master
clear
htop
ffmpeg -i capture5.mp4 -c copy -an 5_noaudio.mp4
ffmpeg -i 5_noaudio.mp4 -i My\ recording\ 32.wav -c:v copy -c:a aac Video5.mp4
cat .local/bin/ffrecord 
cd Videos/ms/
ls capture*
ffmpeg -fflags +igndts -f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY -f alsa -i default -c:v libx265 -crf 28 -preset veryfast -c:a aac capture5.mp4
nmcli c show
nmcli connect device vpn.ec-nantes.fr
nmcli connect wifi vpn.ec-nantes.fr
nmcli con up id vpn.ec-nantes.fr
cd .config/groff/
vim ms_template.ms 
cd .config/groff/
vim opening_macros.ms
cd .config/groff/
cp ms_template.ms backup.ms 
vim backup.ms 
vim opening_macros.ms
cd ~
git status
git add --all
git commit -m "Changes to header and footer"
cat Backup/.gitREADME 
git push -u origin master
clear
cd /usr/share/groff/current/tmac/
ls
vim m.tmac 
grep -r 1c .
grep -r MC .
grep -r 1C .
vim m.tmac 
ls
vim ms.tmac 
vim mm.tmac 
vim me.tmac 
vim m.tmac 
cd Test/
groff -Tpdf -U -tepR -ms test.ms > test.pdf
groff -Tpdf -U -tepR -mspdf test.ms > test.pdf
groff -Tpdf -U -tepR -mspdf -me test.ms > test.pdf
groff -Tpdf -U -tepR -mspdf -mm test.ms > test.pdf
groff -Tpdf -U -tepR -mm test.ms > test.pdf
vim .local/bin/executer 
ffmpeg -i Zoom\ Meeting\ 2021-03-15\ 08-26-20.mp4 -c:v libx264 -crf 18 -preset veryslow -c:a copy Video1.mp4
ffmpeg -i Zoom\ Meeting\ 2021-03-15\ 08-26-20.mp4 -c:v libx264 -crf 18 -preset fast -c:a copy Video1.mp4
ffmpeg -i Zoom\ Meeting\ 2021-03-15\ 10-17-17.mp4 -c:v libx264 -crf 18 -preset fast -c:a copy Video2.mp4
ffmpeg -i Zoom\ Meeting\ 2021-03-15\ 10-41-22.mp4 -c:v libx264 -crf 18 -preset fast -c:a copy Video3.mp4
sudo fdisk -l
cd /usr/share/groff/current/font/
ls
cd devpdf/
ls
vim DESC 
cd enc/
ls
vim text.enc 
ls
cd ..
cd map/
ls
cd ..
cd ..
ls
find -iname *.afm
cd devps/
vim freeeuro.afm 
cd ..
ls 
grep -r font .
clear
grep -r fontname .r
grep -r fontname .
grep -r FontName .
cd ..
ls
cd oldfont/
ls
cd devps/
ls
vom CB
vim CB
cd ..
cd ..
cd font/
ls
cd devpdf/
ls
vim ab
vim AB
vim AR
ls
cd ..
ls
cd devpdf/
ls
vim ZD
vim HR 
vim S
vim download 
vim download 
cd ~
vim .local/bin/executer 
fc-list
fc-list > fontlist
vim fontlist 
sudo pacman -Syy
sudo pacman -S gs
sudo pacman -S ghostscript
cd /usr/share/
cd ghostscript/9.53.3/
cd Resource/
ls
cd Font/
ls
vim URWGothic-Book
ls
cd ..
cd /usr/share/ghostscript/9.54.0/
ls
cd Resource/Font/
ls
cd ~
sudo pacman -Rns groff
sudo pacman -Rdd groff
sudo pacman -S groff
cd bin/
vim eqn
xxd eqn
xxd eqn > vieweqpn
vim vieweqpn 
rm vieweqpn 
hexdump -C eqn
clear
info groff
info eqn
cd /usr/
find -iname *eqn*
man yay
cd ~
cd Packages/
ls
cd groff-git/
ls
find -iname *eqn*
grep -r over .
clear
vim eqn.cpp 
objdump -D eqn-over.o 
man eqn
man groff
cd ~
vim .local/bin/executer 
man dpic
yay -Ss dpic
yay -Syy
yay -S dpic-git
ls
yay -S dpic
clear
sudo pacman -Syy
vf Packages/
cd Packages/
yay -S dpic-git
ls
clear
vim eqn.1 
cp eqn.1 eqn.ms
vim eqn.ms 
vim eqn.cpp 
vim eqn.ms 
whereis eqn
vim /usr/bin/eqn
vim /usr/share/groff/current/
cd /usr/share/groff/current/
vim eign 
cd tmac/
ls
vim e.tmac 
vim ec.tmac 
man eqn
vim eqnrc 
killall gedit
cd Test/octave/
octave-cli
octave-cli
cd Test/
mkdir octave
cd octave/
vim test.m
vim slicerc.m
mv slicerc.m sliderc.m
vim sliderc.m 
cp test.m example.m
vim test.m 
cd Test/octave/
octave-cli
cd Test/
vim paper.ms
vim paper.ms
vim paper.ms
vim paper.ms
vim paper.ms
vim paper.ms
vim .local/bin/compiler 
vim Test/paper.ms 
cd Test/
groff -Tps -ms test.ms > test.ps && ps2pdf test.ps
vim Test/paper.ms 
cd Test/
vim test.ms 
vim test.ms 
cd ~
vim .config/groff/ms_template.ms 
vim .config/groff/ms_template.ms 
cp .config/groff/tux.pdf Test/
cd Test/
img2pdf archlinux-logo-black.png 
feh archlinux-logo-black.pdf 
zathura archlinux-logo-black.pdf 
cp archlinux-logo-black.pdf ~/.config/groff/
cd /usr/share/groff/current/
ls
cd tmac/
vim m.tmac 
vim s.tmac 
cd ~
vim .config/groff/ms_template.ms 
vim .config/groff/drawing.
vim .config/groff/drawing.ms 
vim .config/groff/ms_template.ms 
sudo pacman -S octave
cat Test/Mazar/Mazar_1D.m 
cd .config/groff/
vim opening_macros.ms
vim backup.ms 
cd ~/Test/
vim test.ms 
cd Test/
groff -s -ms -M. test.ms > test.ps
ps2pdf test.ps 
cd Test/
mkdir paper
cp paper.ms paper
cd paper/
ls
img2pdf *.png
img2pdf *.png
clear
vim paper.ms 
cd ..
mkdir ~/.config/groff/Examples/
cp -R paper/ ~/.config/groff/Examples/
cd ~/.config/groff/Examples/
ls
cd paper/
ls
vim paper.ms 
cd ~
git status
rm fontlist 
cp french.docs Study/
git status
rm french.docs 
git add -r .config/groff/Examples/
git add.config/groff/Examples/
git add .config/groff/Examples/
git status
git add --all
git status
cat Backup/.gitREADME 
git commit -m "Groff paper example"
git push -u origin master
cd .config/groff/Examples/paper/
ls
vim paper.ms 
ls /usr/share/groff/current/tmac/
vim mn-test
cp mn-test mn-test.ms
vim ms-test.ms
vim mn-test.ms
img2pdf bike.png 
man tbl
yay -Ss hdtbl
yay -Ss tbl
clear
vim /usr/share/groff/current/tmac/hdtbl.tmac 
sudo pacman -Syy
sudo pacman -Ss tldr
sudo pacman -S tldr
clear
tldr groff
pacman -Ss cheat
yay -Ss cheat
clear
tldr refer
tldr pic
tldr ffmpeg
