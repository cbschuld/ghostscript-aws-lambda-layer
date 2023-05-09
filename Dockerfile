FROM public.ecr.aws/sam/build-nodejs18.x:latest

WORKDIR /build

COPY Makefile ./

RUN yum update -y
RUN yum groupinstall -y "Development Tools"

RUN make all

WORKDIR /build

# archive with symbolic links
RUN zip -ry ghostscript-layer.zip bin share

RUN mkdir /dist && \
 echo "cp /build/ghostscript-layer.zip /dist/ghostscript-layer.zip" > /entrypoint.sh && \
 chmod +x /entrypoint.sh

ENTRYPOINT "/entrypoint.sh"