from flask import Flask
from flask import request
from flask import render_template
app = Flask(__name__)

@app.route('/flask_server')
def flask_server():
   from Backend import sysinfo
   return (sysinfo())
