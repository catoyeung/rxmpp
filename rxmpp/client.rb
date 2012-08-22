require 'socket'
require './jid'

class Client
  attr_accessor :stanzas
  @stream_header = '<?xml version="1.0"?>
                    <stream:stream 
                    to="localhost" 
                    version="1.0" 
                    xmlns:stream="http://etherx.jabber.org/streams" 
                    xmlns="jabber:client">'
  @stanzas = []
                    
  def self.stream_header
    @stream_header
  end
                    
  def initialize(jid, password)
    @jid = JID.new jid
    @password = password
  end
  
  def connect(address=[])
    if address == []
      address = [@jid.domain, 5222]
    end
    @conn = TCPSocket.new address[0], address[1]
    process
  end
  
  def process
    send_raw(Client.stream_header)
    while xml = read_xml
      stanza = build_stanza(xml)
      #authenticate
      puts xml
    end
  end
  
  def send_raw(data)
    @conn.puts data
  end
  
  def authenticate
    stream = '<auth 
                xmlns="urn:ietf:params:xml:ns:xmpp-sasl"
                mechanism="DIGEST-MD5"/>'
    @conn.puts stream
  end
  
  def close
    @conn.close
  end
  
  private
  def read_xml
    return @conn.recv(4096)
  end
  
  def build_stanza(xml)
    
  end
end