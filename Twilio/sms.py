from flask import Flask, request

from twilio.rest import Client

app = Flask(__name__)

# put the account credentials here, not written for security purposes
ACCOUNT_SID = ''
AUTH_TOKEN = ''

client = Client(ACCOUNT_SID, AUTH_TOKEN)

@app.route('/sms', methods=['POST'])
# Runs each time request is send from iPhone device
def send_sms():
    message = client.messages.create(
        to=request.form['To'],
        from_='+14245437015',
        body=request.form['Body'],
    )

    return message.sid

if __name__ == '__main__':
        app.run()
