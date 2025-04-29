FROM pretix/standalone:2025.4.0

USER root

RUN set -x \
    && apt-get update -qq \
    && apt-get upgrade -q -y \
    && apt-get clean -q \
    && rm -rf /var/lib/apt/lists/*

RUN PYTHONPATH=$PYTHONPATH:/pretix/src \
    pip3 install \
    prtx-faq \
    pretix-ldap \
    pretix-pages \
    pretix-passbook \
    # pretix-roomsharing \
    pretix-sepadebit \
    pretix-zugferd

USER pretixuser

RUN cd /pretix/src && make production
