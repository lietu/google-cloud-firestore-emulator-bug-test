# Google Cloud Firestore testcase

Test case of Python [google-cloud-firestore](https://github.com/googleapis/python-firestore) emulator issues.

https://github.com/googleapis/python-firestore/issues/359


## Windows

This is easier if you use [Chocolatey](https://chocolatey.org/install)

You can then prepare your environment with Python + Google Cloud SDK:

```
choco install -y python gcloudsdk

rem Delete Windows's gotcha python.exe or otherwise get rid of it in your PATH
del %LOCALAPPDATA%\Microsoft\WindowsApps\python.exe

rem Update PATH and set up firestore emulator
set PATH=%PATH%;c:\python39\;c:\python39\Scripts;c:\Program Files (x86)\Google\Cloud SDK\google-cloud-sdk\bin
gcloud components install cloud-firestore-emulator
```

In one terminal run
```
start_emulator
```

And in another
```
virtualenv venv
venv\scripts\activate
pip install google-cloud-firestore
test
```

## *nix

In one terminal run
```bash
./start_emulator.sh
```

And in another
```bash
virtualenv venv
. venv/bin/activate
pip install google-cloud-firestore
./test.sh
```

## Docker

Easiest way to run this in a reproducible Docker virtual environment:

```
docker build . --no-cache --progress=plain
```

## Poetry

If you've already got [Poetry](https://python-poetry.org/docs/#osx--linux--bashonwindows-install-instructions) installed you can do:

```bash
poetry install
poetry run (test.bat|./test.sh)
```

Don't forget to start the emulator in another terminal first.
