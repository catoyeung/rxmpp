require_relative 'rxmpp'

client = Client.new('cato@office.zensis.com/rxmpp', '123456')

client.connect()
client.process()