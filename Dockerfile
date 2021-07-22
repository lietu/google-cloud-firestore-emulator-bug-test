FROM python:3.9

# Install gcloud + emulator
RUN set -exu \
 && apt-get update \
 && apt-get install -y curl gnupg openjdk-11-jre-headless \
 && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
 && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
 && apt-get update -y \
 && mkdir -p /usr/share/man/man1 \
 && apt-get install google-cloud-sdk google-cloud-sdk-firestore-emulator -y \
 && apt-get clean

# Run test
ADD . /src
WORKDIR /src

RUN set -exu \
 && bash start_emulator.sh bg \
 && sleep 5 \
 && pip install google-cloud-firestore==2.1.3 \
 && bash test.sh
