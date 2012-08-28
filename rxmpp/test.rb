require_relative 'client'

client = Client.new('cato@office.zensis.com/rxmpp', '123456')

if client.connect()
  client.process()
end