GENERATE SSL KEYS

openssl req -x509 -nodes -newkey rsa:2048 -keyout example.key -out example.cert -days 365

openssl req -x509 -nodes -newkey rsa:2048 -keyout example.key -out example.cert -days 365

rsa:2048 - width of the key
-days 365 - expiry of the key

USE THE chmod COMMAND TO GIVE ACCESS TO .pem FILES
chmod 644 *.pem