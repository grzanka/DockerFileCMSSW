FROM grzanka/slc6-cmssw

ADD manifest.pp /
RUN /bin/bash --login -c "puppet apply -d --modulepath=/modules /manifest.pp"
USER cmsbuild
WORKDIR /home/cmsbuild

ENV SCRAM_ARCH=slc6_amd64_gcc530

RUN source /opt/cms/cmsset_default.sh && \
    scram project CMSSW CMSSW_8_0_8

CMD /bin/bash
