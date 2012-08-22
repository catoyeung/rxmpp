class JID
  attr_reader :node, :domain, :resource
  
  def initialize(jid)
    @fulljid = jid
    @node, @domain, @resource = jid.split(/[\@\/]/)
  end
end