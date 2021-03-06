import os
import sys
import time
import redis
from flask import Flask,redirect, render_template, template_rendered


app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)


def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)


# @app.route('/')
# def hello():
#     count = get_hit_count()
#     return 'Hello from World! I have been seen {} times.\n'.format(count)


@app.route('/')
def homepage():
    return render_template('index.html')

@app.route('/about')
def about_page():
    return render_template('about.html')

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)