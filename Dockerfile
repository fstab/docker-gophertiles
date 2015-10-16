FROM fstab/go
MAINTAINER Fabian Stäber, fabian@fstab.de

ENV LAST_UPDATE=2015-10-17

USER root
RUN apt-get install -y make
USER go

RUN go get golang.org/x/net/http2
RUN go get camlistore.org/pkg/googlestorage; exit 0
RUN sed -i s,"future/mime/multipart","mime/multipart",g /home/go/src/camlistore.org/pkg/httputil/multipart.go

WORKDIR /home/go/src/golang.org/x/net/http2/h2demo/
RUN sed -i 's;"https_addr", "localhost:4430";"https_addr", "0.0.0.0:4430";g' h2demo.go
RUN sed -i 's;"http_addr", "";"http_addr", "0.0.0.0:8080";g' h2demo.go
RUN sed -i 's;"http_host", "";"http_host", "192.168.99.100:8080";g' h2demo.go
RUN sed -i 's;"https_host", "";"https_host", "192.168.99.100:4430";g' h2demo.go

RUN make

EXPOSE 4430 8080

CMD ./h2demo.linux
