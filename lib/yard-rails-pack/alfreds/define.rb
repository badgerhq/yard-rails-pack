class Alfreds::DefineHandler < YardRailsPack::Base

  ### DSL methods to handle

  handles method_call(:define)

  def process
    source = statement.last.last

    parse_block(source)
  end

end
