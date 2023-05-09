FROM public.ecr.aws/sam/build-nodejs18.x:latest

WORKDIR /build

COPY Makefile ./

RUN make all

# RUN mkdir /dist && \
#  echo "cp /build/dist/sharp-layer.zip /dist/sharp-layer.zip" > /entrypoint.sh && \
#  chmod +x /entrypoint.sh

RUN ls -la /build
RUN ls -la /build/ghostscript-10.01.1

# ENTRYPOINT "/entrypoint.sh"