#!/usr/bin/python
from os.path import dirname
from urllib.request import Request, urlopen
from base64 import b64encode
import sys

key = "3lHn_dVjmmU_PqoGiQblVCyvtiXbWCQB"
input = sys.argv[1]
output = sys.argv[1] + "-tiny.png"

request = Request("https://api.tinypng.com/shrink", open(input, "rb").read())

cafile = None
# Uncomment below if you have trouble validating our SSL certificate.
# Download cacert.pem from: http://curl.haxx.se/ca/cacert.pem
# cafile = dirname(__file__) + "/cacert.pem"

auth = b64encode(bytes("api:" + key, "ascii")).decode("ascii")
request.add_header("Authorization", "Basic %s" % auth)

response = urlopen(request, cafile = cafile)
if response.status == 201:
  # Compression was successful, retrieve output from Location header.
  result = urlopen(response.getheader("Location"), cafile = cafile).read()
  open(output, "wb").write(result)
else:
  # Something went wrong! You can parse the JSON body for details.
  print("Compression failed")

