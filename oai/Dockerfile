FROM samiemostafavi/sshd-dind-sdr:latest AS dind-sdr-base

# docker build . -t samiemostafavi/sshd-dind-oai

WORKDIR /root

RUN wget -O /root/oai-cn5g.zip https://gitlab.eurecom.fr/oai/openairinterface5g/-/archive/develop/openairinterface5g-develop.zip?path=doc/tutorial_resources/oai-cn5g
RUN unzip /root/oai-cn5g.zip
RUN mv /root/openairinterface5g-develop-doc-tutorial_resources-oai-cn5g/doc/tutorial_resources/oai-cn5g /root/oai-cn5g
RUN rm -r /root/openairinterface5g-develop-doc-tutorial_resources-oai-cn5g /root/oai-cn5g.zip
RUN curl -o /root/oai-cn5g/conf/users.conf https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/users.conf
RUN curl -o /root/oai-cn5g/database/oai_db.sql https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/oai_db.sql

WORKDIR /root
RUN git clone https://gitlab.eurecom.fr/oai/openairinterface5g.git /root/openairinterface5g
WORKDIR /root/openairinterface5g
RUN git checkout 2024.w18
RUN curl -o /root/openairinterface5g/radio/USRP/usrp_lib.cpp https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/usrp_lib.cpp
RUN curl -o /root/openairinterface5g/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band78.fr1.106PRB.usrpb210.conf https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/gnb.sa.band78.fr1.106PRB.usrpb210.conf
RUN curl -o /root/openairinterface5g/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band41.fr1.106PRB.usrpb210.conf https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/gnb.sa.band41.fr1.106PRB.usrpb210.conf
RUN curl -o /root/openairinterface5g/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band48.fr1.106PRB.usrpb210.conf https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/gnb.sa.band48.fr1.106PRB.usrpb210.conf
RUN curl -o /root/openairinterface5g/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band77.fr1.106PRB.usrpb210.conf https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/gnb.sa.band77.fr1.106PRB.usrpb210.conf
RUN curl -o /root/openairinterface5g/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band79.fr1.106PRB.usrpb210.conf https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/gnb.sa.band79.fr1.106PRB.usrpb210.conf
WORKDIR /root/openairinterface5g/cmake_targets
RUN ./build_oai -I
RUN ./build_oai -w USRP --ninja --gNB --nrUE -C

WORKDIR /root
RUN git clone https://gitlab.eurecom.fr/samiemostafavi/openairinterface5g-edaf.git /root/openairinterface5g-edaf
WORKDIR /root/openairinterface5g-edaf
RUN git checkout edaf-develop
RUN curl -o /root/openairinterface5g-edaf/radio/USRP/usrp_lib.cpp https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/usrp_lib.cpp
RUN curl -o /root/openairinterface5g-edaf/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band78.fr1.106PRB.usrpb210.conf https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/gnb.sa.band78.fr1.106PRB.usrpb210.conf
RUN curl -o /root/openairinterface5g-edaf/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band77.fr1.106PRB.usrpb210.conf https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/gnb.sa.band77.fr1.106PRB.usrpb210.conf
RUN curl -o /root/openairinterface5g-edaf/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band79.fr1.106PRB.usrpb210.conf https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/gnb.sa.band79.fr1.106PRB.usrpb210.conf
RUN curl -o /root/openairinterface5g-edaf/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band41.fr1.106PRB.usrpb210.conf https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/gnb.sa.band41.fr1.106PRB.usrpb210.conf
RUN curl -o /root/openairinterface5g-edaf/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band48.fr1.106PRB.usrpb210.conf https://raw.githubusercontent.com/KTH-EXPECA/examples/main/openairinterface/gnb.sa.band48.fr1.106PRB.usrpb210.conf
WORKDIR /root/openairinterface5g-edaf/cmake_targets
RUN ./build_oai -I
RUN ./build_oai -w USRP --ninja --gNB --nrUE -C --enable-edaf

