class Alfreds::ControllerHandler < YardRailsPack::Base

  ### DSL methods to handle

  handles method_call(:controller)

  def process
    source = statement.last.last
    name   = statement.parameters.first.jump(:string_content).source

    parse_block(source, :owner => { :namespace => name })
  end

end
