from flask import app, Flask
from task import task


app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, World!'


@app.route('/task')
def run_task():
    print('Running task')
    result = task()
    print(result)
    return result



if __name__ == '__main__':
    app.run()
