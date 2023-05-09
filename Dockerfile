FROM public.ecr.aws/sam/build-nodejs18.x:latest

WORKDIR /build

COPY Makefile ./

RUN make all

RUN zip -r /build/ghostscript-layer.zip /build/bin /build/share

RUN mkdir /dist && \
 echo "cp /build/ghostscript-layer.zip /dist/ghostscript-layer.zip" > /entrypoint.sh && \
 chmod +x /entrypoint.sh

ENTRYPOINT "/entrypoint.sh"