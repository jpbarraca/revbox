FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND noninteractive

#Update system
RUN apt-get update && apt-get upgrade

#Installing base tools
RUN apt-get install -y ghidra binutils ltrace gdb-multiarch  python3-pip docker.io apktool edb-debugger jd-gui jadx wireshark qemu-user qemu-system imhex pulseview zaproxy virtualenv curl

#Installing GEF
RUN bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

#Installing qiling
ENV PIP_ROOT_USER_ACTION=ignore
RUN mkdir /opt/qiling \
    && virtualenv /opt/qiling/venv; . /opt/qiling/venv/bin/activate; pip3 install qiling \
    && echo 'alias activate_qiling=". /opt/qiling/venv/bin/activate"; echo "Qiling rootfs at /opt/qiling/rootfs"' >> ~/.bashrc

ADD ./qiling/rootfs /opt/qiling/rootfs
	
RUN echo "echo 'Qiling at /opt/qiling. Type activate_qiling to enter the environment'" >> ~/.bashrc

CMD ["/bin/bash"]
