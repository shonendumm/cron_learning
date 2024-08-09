import time
from datetime import datetime


def task():
    time.sleep(3)
    return f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')} - Task is done"