FROM pretix/standalone:2023.6

USER root

RUN set -x \
    && apt-get update -qq \
    && apt-get upgrade -q -y \
    && apt-get clean -q \
    && rm -rf /var/lib/apt/lists/*

RUN PYTHONPATH=$PYTHONPATH:/pretix/src \
    pip3 install \
        pretix-ldap \
        pretix-sepadebit
USER pretixuser

RUN cd /pretix/src && make production
