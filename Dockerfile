ARG REPO=mcr.microsoft.com/dotnet/runtime-deps
FROM $REPO:2.1-focal

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl unzip \
    && rm -rf /var/lib/apt/lists/*

# Install .NET Core
ENV DOTNET_VERSION=3.1.18
ENV NIRVANA_ZIP_URL=https://github.com/Illumina/Nirvana/releases/download/v3.17.0/Nirvana-3.17.0-dotnet-3.1.0.zip

RUN curl -SL --output dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Runtime/$DOTNET_VERSION/dotnet-runtime-$DOTNET_VERSION-linux-x64.tar.gz \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

RUN mkdir -p /opt/nirvana \
    && curl -SL --output nirvana.zip $NIRVANA_ZIP_URL \
    && unzip -d /opt/nirvana nirvana.zip \
    && rm nirvana.zip

