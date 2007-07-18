import xmlrpclib

server = xmlrpclib.Server("http://pythonchallenge.com/pc/phonebook.php")
print server.system.listMethods()
print server.phone("Bert")
