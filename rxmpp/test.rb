require './client'

x = Client.new('cato@localhost/rxmpp', '123456')

x.connect()
x.read()
#x.authenticate()
x.close()
