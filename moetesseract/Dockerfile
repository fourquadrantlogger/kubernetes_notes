FROM timeloveboy/tesseract
MAINTAINER timeloveboy(734991033@qq.com)
RUN wget http://golangtc.com/static/go/1.8/go1.8.linux-amd64.tar.gz  --progress=bar:force 2>&1
RUN tar xzvf go1.8.linux-amd64.tar.gz
RUN mv go  /opt/go
RUN mkdir -p /GOPATH
RUN echo "export GOROOT=/opt/go" >>/etc/profile
RUN echo "export GOPATH=/GOPATH" >>/etc/profile
RUN echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/go" >>/etc/profile
ENV GOROOT /opt/go
ENV GOPATH /GOPATH
ENV TMP $GOPATH/src/github.com/timeloveboy/moetesseract/tmp
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/go/bin
RUN apt-get install -y git


RUN go get -u -v -t github.com/timeloveboy/moetesseract

# build moetesseract binary and copy it to /usr/bin
RUN cd $GOPATH/src/github.com/timeloveboy/moetesseract && go build -v -o moetesseract
WORKDIR $GOPATH/src/github.com/timeloveboy/moetesseract
VOLUME $TMP $GOPATH/src/github.com/timeloveboy/moetesseract/tmp
EXPOSE 8092
RUN ls -l
CMD ./moetesseract