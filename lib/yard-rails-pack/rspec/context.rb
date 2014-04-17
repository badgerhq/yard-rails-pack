class Rspec::ContextHandler < YARD::Handlers::Ruby::Base

  ### DSL methods to handle

  handles method_call(:context)

  def process
    return if owner.nil?

    source          = statement.last.last
    name            = statement.parameters.first.jump(:string_content).source
    owner[:context] = [name]

    parse_block(source, :owner => owner)
  end

end
