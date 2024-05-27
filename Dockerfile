FROM alpine:edge

RUN \
  # Install required packages
  echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
  apk --update --upgrade add --no-cache \
  fluxbox \
  supervisor \
  xvfb \
  x11vnc \
  novnc

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 8080

# Setup environment variables
ENV HOME=/root \
  DEBIAN_FRONTEND=noninteractive \
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US.UTF-8 \
  LC_ALL=C.UTF-8 \
  DISPLAY=:0.0 \
  DISPLAY_WIDTH=1024 \
  DISPLAY_HEIGHT=768

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]