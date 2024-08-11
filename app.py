from flask import app, Flask, request
from task import task
import json

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, World!'


@app.route('/task', methods=['POST'])
def run_task():
    data = request.get_json()

    if not data:
        return 'No data provided', 400
    
    value = data.get('key')
    if value != "runtask":
        return 'Invalid key', 401

    print('Running task...')
    result = task()
    print(result)
    return result, 200



if __name__ == '__main__':
    app.run()
