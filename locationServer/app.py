from datetime import datetime
import threading
from flask import Flask, request
import requests

app = Flask(__name__)
users = {}


def check_users():
    threading.Timer(60 * 11, check_users).start()
    for user in users.values():
        current_time = datetime.now()
        time_difference = current_time - datetime.fromisoformat(user['time'])
        minutes_passed = time_difference.total_seconds() / 60
        if minutes_passed > 10:
            user["isActive"] = False
            requests.post('http://10.10.244.44:3000/mashtaps', json=user)


@app.route('/location', methods=['POST'])
def send_locations():
    current_location = request.json
    users[current_location["userId"]] = current_location
    users[current_location["userId"]]['isActive'] = True
    print(current_location)
    r = requests.post('http://10.10.244.44:3000/mashtaps', json=users[current_location["userId"]])
    print(r)
    return 'location was sent successfully'


if __name__ == "__main__":
    check_users()
