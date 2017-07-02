FROM timeloveboy/tesseract
MAINTAINER timeloveboy(734991033@qq.com)

ADD installgo.sh installgo.sh
RUN sh installgo.sh
ENV GOROOT /opt/go
ENV GOPATH /GOPATH
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/go/bin
WORKDIR $GOPATH/src/github.com/timeloveboy/moetesseract
ENV TMP $GOPATH/src/github.com/timeloveboy/moetesseract/tmp
RUN git clone http://github.com/timeloveboy/moetesseract $GOPATH/src/github.com/timeloveboy/moetesseract &&\
    go get  github.com/timeloveboy/moetesseract && \
    go build -o moetesseract && \
    ls -l
VOLUME $TMP $GOPATH/src/github.com/timeloveboy/moetesseract/tmp
EXPOSE 8092
CMD ./moetesseract