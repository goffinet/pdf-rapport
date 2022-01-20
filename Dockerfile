FROM pandoc/latex:2.16.2

LABEL org.opencontainers.image.source https://github.com/goffinet/pandoc-latex

RUN tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet \
    tlmgr update \
    && tlmgr install csquotes mdframed needspace sourcesanspro ly1 mweights \
    sourcecodepro titling pagecolor epstopdf zref footnotebackref subfig float \
    && apk add --update ghostscript

# Install Node and mermaid-filter

ENV CHROME_BIN="/usr/bin/chromium-browser" \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"

RUN apk add --update udev ttf-freefont chromium npm \
    freetype \
    freetype-dev \
    msttcorefonts-installer \
    fontconfig \
    font-noto \
    terminus-font \
    ttf-opensans \
    font-misc-misc \
    font-croscore \
    && update-ms-fonts \
    && fc-cache -f \
    && rm -rf /var/cache/* \
    && npm install -g mermaid-filter@1.4.5 --unsafe-perm=true

RUN fc-list : family | cut -f1 -d"," | sort | uniq
