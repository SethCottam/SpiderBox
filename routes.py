# How to run:
# export FLASK_APP=api.py
#   WARNING: Cannot have additional periods in the name ex. api_v1.1.py
# export FLASK_DEBUG=1  # This will auto-reload the app whenever a code change happens
# $ flask run
#  * Running on http://127.0.0.1:5000/

# TODO: Investigate self-documenting api
# https://flask-apispec.readthedocs.io/en/latest/

# TODO: Render Markdown https://blog.jcharistech.com/2019/12/12/how-to-render-markdown-in-flask/

from dotenv import load_dotenv  # this loads exports from .env files

load_dotenv()  # take environment variables from .env.

# print(FLASK_APP)

import os

from flask import Flask, send_file, send_from_directory, safe_join, abort
from flask import Flask, request, json, jsonify, url_for, send_from_directory
from flask import render_template  # For rendering HTML templates
from flaskext.markdown import Markdown

import csv
from datetime import datetime, timezone

# import MySQLdb  # Heroes specific

# api = Flask(__name__)
api = Flask(__name__, template_folder='./', static_folder='./')  # For rendering templates


# api.add_url_rule('/favicon.ico', redirect_to=url_for('static', filename='favicon.ico'))


# Ex. http://127.0.0.1:5000/
@api.route('/', methods=['GET'])
def spiderbox_home():
    template = 'sandbox/spiderbox_home.html'

    return_html = render_template(template)
    return return_html
    # return render_template('sandbox1.html')

# @api.route('/test1.html', methods=['GET'])
# def test1_html():
#     return render_template('sandbox/test1.html')

# @api.route('/test1.js', methods=['GET'])
# def test1_javascript():
#     return render_template('sandbox/test1.js')

# Wildcard route that can access anything within the sandbox
@api.route('/sandbox/<string:filename>', methods=['GET'])
def sandbox_wildcard(filename):
    print(f'{filename}')
    return render_template(f'sandbox/{filename}')

# Ex. http://127.0.0.1:5000/health
@api.route('/health', methods=['GET'])
def health():

    output = dict()
    output['api'] = 'online'

    # Convert to a repsonse object
    response = jsonify(output)
    # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")

    # print(f'REQUEST: / requsted by {request.remote_addr}')

    return response

@api.route('/favicon.ico')
def favicon():
    return send_from_directory('./', 'favicon.ico', mimetype='image/vnd.microsoft.icon')


if __name__ == '__main__':
    api.run()
