FROM appimagecrafters/docker-base
RUN yum install -y gettext xz automake autoconf libtool zlib-devel


COPY --from=appimagecrafters/docker-glib /usr/local /usr/local
COPY --from=appimagecrafters/docker-libpng /usr/local /usr/local
COPY --from=appimagecrafters/docker-pixman /usr/local /usr/local
COPY --from=appimagecrafters/docker-freetype /usr/local /usr/local

ADD install-cairo.sh /
ARG CAIRO_VERSION=1.17.2
RUN /install-cairo.sh