mkdir /home/charles/folder1
mkdir /home/charles/folder2
mkdir /home/charles/folder3
head -c 5kB /dev/urandom > /home/charles/folder1/1.txt
head -c 100kB /dev/urandom > /home/charles/folder1/2.txt
head -c 10kB /dev/urandom > /home/charles/folder1/3.txt
head -c 11kB /dev/urandom > /home/charles/folder1/4.txt
head -c 120kB /dev/urandom > /home/charles/folder1/5.txt
head -c 11kB /dev/urandom > /home/charles/folder1/6.txt
head -c 114kB /dev/urandom > /home/charles/folder1/7.txt
head -c 5kB /dev/urandom > /home/charles/folder1/8.txt
head -c 100kB /dev/urandom > /home/charles/folder1/9.txt
head -c 10kB /dev/urandom > /home/charles/folder1/10.txt
head -c 11kB /dev/urandom > /home/charles/folder1/11.txt
head -c 120kB /dev/urandom > /home/charles/folder1/12.txt
head -c 11kB /dev/urandom > /home/charles/folder1/13.txt
head -c 114kB /dev/urandom > /home/charles/folder1/14.txt
head -c 5kB /dev/urandom > /home/charles/folder2/1.txt
head -c 100kB /dev/urandom > /home/charles/folder2/2.txt
head -c 10kB /dev/urandom > /home/charles/folder2/3.txt
head -c 11kB /dev/urandom > /home/charles/folder2/4.txt
head -c 120kB /dev/urandom > /home/charles/folder2/5.txt
head -c 11kB /dev/urandom > /home/charles/folder2/6.txt
head -c 131kB /dev/urandom > /home/charles/folder2/7.txt
head -c 5kB /dev/urandom > /home/charles/folder2/8.txt
head -c 100kB /dev/urandom > /home/charles/folder2/9.txt
head -c 10kB /dev/urandom > /home/charles/folder2/10.txt
head -c 11kB /dev/urandom > /home/charles/folder2/11.txt
head -c 120kB /dev/urandom > /home/charles/folder2/12.txt
head -c 11kB /dev/urandom > /home/charles/folder2/13.txt
head -c 114kB /dev/urandom > /home/charles/folder2/14.txt
head -c 5kB /dev/urandom > /home/charles/folder3/1.txt
head -c 111kB /dev/urandom > /home/charles/folder3/2.txt
head -c 3kB /dev/urandom > /home/charles/folder3/3.txt
head -c 11kB /dev/urandom > /home/charles/folder3/4.txt
head -c 120kB /dev/urandom > /home/charles/folder3/5.txt
head -c 11kB /dev/urandom > /home/charles/folder3/6.txt
head -c 333kB /dev/urandom > /home/charles/folder3/7.txt
head -c 5kB /dev/urandom > /home/charles/folder3/8.txt
head -c 100kB /dev/urandom > /home/charles/folder3/9.txt
head -c 10kB /dev/urandom > /home/charles/folder3/10.txt
head -c 11kB /dev/urandom > /home/charles/folder3/11.txt
head -c 120kB /dev/urandom > /home/charles/folder3/12.txt
head -c 11kB /dev/urandom > /home/charles/folder3/13.txt
head -c 114kB /dev/urandom > /home/charles/folder3/14.txt
echo "::::FLAG::::danny:1234TGB!::::FLAG:::::" >> /home/charles/folder2/3.txt
truncate -s 113K /home/charles/folder2/3.txt
