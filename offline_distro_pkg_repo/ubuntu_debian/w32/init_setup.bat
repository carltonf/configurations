rem user configurations
set PATH=G:\11-16\offline_ubuntu;%PATH%
rem the direct parent of folders dist and folders.
set MIRROR=http://archive.ubuntu.com/ubuntu
set ARCH=amd64

rem ===========================================
mkdir dists\oneiric
cd dists\oneiric
wget %MIRROR%/dists/oneiric/Release
wget %MIRROR%/dists/oneiric/Release.gpg
wget %MIRROR%/dists/oneiric/Contents-%ARCH%.gz
wget %MIRROR%/dists/oneiric/Contents-i386.gz

mkdir main\binary-%ARCH%
cd main\binary-%ARCH%
wget %MIRROR%/dists/oneiric/main/binary-%ARCH%/Packages.bz2
wget %MIRROR%/dists/oneiric/main/binary-%ARCH%/Packages.gz
wget %MIRROR%/dists/oneiric/main/binary-%ARCH%/Release
cd ..\..\

mkdir multiverse\binary-%ARCH%
cd multiverse\binary-%ARCH%
wget %MIRROR%/dists/oneiric/multiverse/binary-%ARCH%/Packages.bz2
wget %MIRROR%/dists/oneiric/multiverse/binary-%ARCH%/Packages.gz
wget %MIRROR%/dists/oneiric/multiverse/binary-%ARCH%/Release
cd ..\..\

mkdir restricted\binary-%ARCH%
cd restricted\binary-%ARCH%
wget %MIRROR%/dists/oneiric/restricted/binary-%ARCH%/Packages.bz2
wget %MIRROR%/dists/oneiric/restricted/binary-%ARCH%/Packages.gz
wget %MIRROR%/dists/oneiric/restricted/binary-%ARCH%/Release
cd ..\..\

mkdir universe\binary-%ARCH%
cd universe\binary-%ARCH%
wget %MIRROR%/dists/oneiric/universe/binary-%ARCH%/Packages.bz2
wget %MIRROR%/dists/oneiric/universe/binary-%ARCH%/Packages.gz
wget %MIRROR%/dists/oneiric/universe/binary-%ARCH%/Release
cd ..\..\

cd ..\..\

rem =========================================================
rem we always need i386 for amd64
mkdir main\binary-i386
cd main\binary-i386
wget %MIRROR%/dists/oneiric/main/binary-i386/Packages.bz2
wget %MIRROR%/dists/oneiric/main/binary-i386/Packages.gz
wget %MIRROR%/dists/oneiric/main/binary-i386/Release
cd ..\..\

mkdir multiverse\binary-i386
cd multiverse\binary-i386
wget %MIRROR%/dists/oneiric/multiverse/binary-i386/Packages.bz2
wget %MIRROR%/dists/oneiric/multiverse/binary-i386/Packages.gz
wget %MIRROR%/dists/oneiric/multiverse/binary-i386/Release
cd ..\..\

mkdir restricted\binary-i386
cd restricted\binary-i386
wget %MIRROR%/dists/oneiric/restricted/binary-i386/Packages.bz2
wget %MIRROR%/dists/oneiric/restricted/binary-i386/Packages.gz
wget %MIRROR%/dists/oneiric/restricted/binary-i386/Release
cd ..\..\

mkdir universe\binary-i386
cd universe\binary-i386
wget %MIRROR%/dists/oneiric/universe/binary-i386/Packages.bz2
wget %MIRROR%/dists/oneiric/universe/binary-i386/Packages.gz
wget %MIRROR%/dists/oneiric/universe/binary-i386/Release
cd ..\..\

cd ..\..\