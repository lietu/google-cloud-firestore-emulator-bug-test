#!/usr/bin/env bash
if [[ "$1" == "bg" ]]; then
  gcloud beta emulators firestore start --host-port=127.0.0.1:8686 &
else
  gcloud beta emulators firestore start --host-port=127.0.0.1:8686
fi

