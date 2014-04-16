class IncludedHandler < YardRailsPack::Base

  ### DSL methods to handle

  handles method_call(:included)
  namespace_only

  def process
    source = statement.last.last

    parse_block(source, :owner => { :namespace => namespace })
  end

end
