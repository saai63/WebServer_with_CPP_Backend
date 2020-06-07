#!/bin/bash
cp lib/lib* test/SystemTime_ext.so
cd flask
source venv/bin/activate
export FLASK_APP=webserver.py
flask run
deactivate
cd ..
