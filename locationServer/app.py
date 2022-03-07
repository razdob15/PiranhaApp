from datetime import datetime
import threading
from flask import Flask, request
import requests
app = Flask(__name__)

users = []


def check_users():
    threading.Timer(60*11, check_users).start()
    for user in users:
        current_time = datetime.now()
        time_difference = current_time - user["time"]
        minutes_passed = time_difference.total_seconds() / 60
        if minutes_passed > 10:
            user["isActive"] = False
            requests.post('http://10.10.244.44:3000', json=user)


@app.route('/location', methods=['POST', 'GET'])
def send_locations():
    current_location = request.json
    users.append(current_location)
    current_location["isActive"] = True
    r = requests.post('http://10.10.244.44:3000', json=current_location)
    print(r)
    return 'location was sent successfully'


check_users()