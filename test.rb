require_relative 'lib/rxmpp'

client = Rxmpp::Client.new('cato@office.zensis.com/rxmpp', '123456')

client.connect()
client.process()