#!/usr/bin/env sh
export FIRESTORE_EMULATOR_HOST=127.0.0.1:8686

echo
echo TESTING ASYNC CLIENT
echo
python asyncmain.py

echo
echo TESTING SYNC CLIENT
echo
python main.py
