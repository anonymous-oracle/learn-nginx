from flask import Flask
import socket

app = Flask(__name__)

def get_host_ip():
    try:
        # Connect to an external server to get the local IP address
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip_address = s.getsockname()[0]
        s.close()
    except Exception:
        ip_address = ''
    return ip_address

@app.route('/')
def hello_nginx():
    return f"<h1 style='text-align: center;'>Nginx load balanced to {get_host_ip()}</h1>"


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80)
