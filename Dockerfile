FROM pytorch/pytorch:2.4.1-cuda11.8-cudnn9-runtime

ARG INJECT_MF_CERT
COPY mf.crt /usr/local/share/ca-certificates/mf.crt

RUN ( test $INJECT_MF_CERT -eq 1 && update-ca-certificates ) || echo "MF certificate not injected"

ENV MY_APT='apt -o "Acquire::https::Verify-Peer=false" -o "Acquire::AllowInsecureRepositories=true" -o "Acquire::AllowDowngradeToInsecureRepositories=true" -o "Acquire::https::Verify-Host=false"'

RUN $MY_APT update && $MY_APT install -y curl gcc g++ nano sudo libgeos-dev libeccodes-dev libeccodes-tools git vim libtiff5 openssh-server

ARG REQUESTS_CA_BUNDLE
ARG CURL_CA_BUNDLE
ARG USERNAME
ARG GROUPNAME
ARG USER_UID
ARG USER_GUID
ARG HOME_DIR
ARG NODE_EXTRA_CA_CERTS

RUN set -eux && groupadd --gid $USER_GUID $GROUPNAME \
    # https://stackoverflow.com/questions/73208471/docker-build-issue-stuck-at-exporting-layers
    && mkdir -p $HOME_DIR && useradd -l --uid $USER_UID --gid $USER_GUID -s /bin/bash --home-dir $HOME_DIR --create-home $USERNAME \
    && chown $USERNAME:$GROUPNAME $HOME_DIR \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && echo "$USERNAME:$USERNAME" | chpasswd

WORKDIR $HOME_DIR

RUN pip install --upgrade pip
COPY requirements.txt /root/requirements.txt
RUN set -eux && pip install -r /root/requirements.txt