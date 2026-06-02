import os
import socket
from flask import Flask, jsonify
from prometheus_client import Counter, Histogram, generate_latest, CONTENT_TYPE_LATEST
import time
import random


app = Flask(__name__)

# Prometheus metrics
REQUEST_COUNT = Counter(
    'app_requests_total',
    'Total request count',
    ['method', 'endpoint', 'status']
)

REQUEST_LATENCY = Histogram(
    'app_request_latency_seconds',
    'Request latency in seconds',
    ['endpoint']
)

VERSION = os.getenv('APP_VERSION', 'dev')
HOSTNAME = socket.gethostname()


@app.route('/')
def index():
    start = time.time()
    response = jsonify({
        'message': 'Hello from my kubelab-app',
        'version': VERSION,
        'hostname': HOSTNAME
    })
    REQUEST_COUNT.labels(method='GET', endpoint='/', status=200).inc()
    REQUEST_LATENCY.labels(endpoint='/').observe(time.time() - start)
    return response


@app.route('/health')
def health():
    return jsonify({'status': 'healthy'}), 200


@app.route('/metrics')
def metrics():
    return generate_latest(), 200, {'Content-Type': CONTENT_TYPE_LATEST}


QUOTES = [
    {"quote": "The obstacle is the way.", "author": "Marcus Aurelius"},
    {"quote": "He who has a why to live can bear almost any how.", "author": "Friedrich Nietzsche"},
    {"quote": "The man who moves a mountain begins by carrying away small stones.", "author": "Confucius"},
    {"quote": "We suffer more in imagination than in reality.", "author": "Seneca"},
    {"quote": "First say to yourself what you would be, then do what you have to do.", "author": "Epictetus"},
    {"quote": "In the middle of difficulty lies opportunity.", "author": "Albert Einstein"},
    {"quote": "It is not the mountain we conquer, but ourselves.", "author": "Edmund Hillary"},
    {"quote": "The only true wisdom is in knowing you know nothing.", "author": "Socrates"},
    {"quote": "Do not go where the path may lead, go instead where there is no path and leave a trail.", "author": "Ralph Waldo Emerson"},
    {"quote": "You have power over your mind, not outside events. Realize this and you will find strength.", "author": "Marcus Aurelius"},
    {"quote": "The unexamined life is not worth living.", "author": "Socrates"},
    {"quote": "What we know is a drop, what we don't know is an ocean.", "author": "Isaac Newton"},
    {"quote": "Fall seven times, stand up eight.", "author": "Japanese Proverb"},
    {"quote": "The quieter you become, the more you are able to hear.", "author": "Rumi"},
    {"quote": "A ship in harbor is safe, but that is not what ships are for.", "author": "John A. Shedd"},
]


@app.route('/quote')
def quote():
    start = time.time()
    selected = random.choice(QUOTES)
    REQUEST_COUNT.labels(method='GET', endpoint='/quote', status=200).inc()
    REQUEST_LATENCY.labels(endpoint='/quote').observe(time.time() - start)
    return jsonify({
        'quote': selected['quote'],
        'author': selected['author']
    }), 200


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
