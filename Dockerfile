FROM ubuntu:14.04
WORKDIR /workdir
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386 libxext6:i386 libx11-6:i386 libgl1-mesa-glx:i386 libxi6:i386 libxmu6:i386
COPY linuxq3ademo-1.11-6.x86.gz.sh .
ENV _POSIX2_VERSION=199209
RUN ./linuxq3ademo-1.11-6.x86.gz.sh -target demo
RUN mv demo/demoq3 demo/bin/x86/glibc-2.1/
RUN ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 demo/libGL.so
RUN mkdir -p /root/.q3a/demoq3/
COPY q3config.cfg /root/.q3a/demoq3/
CMD cd demo && ./bin/x86/glibc-2.1/q3demo
