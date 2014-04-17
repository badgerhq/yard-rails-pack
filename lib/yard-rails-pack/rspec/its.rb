class Rspec::ItHandler < YARD::Handlers::Ruby::Base

  ### DSL methods to handle

  handles method_call(:it)

  def process
    return if owner.nil?
    object = P(owner[:spec])
    return if object.is_a?(Proxy)

    context = owner[:context]
    name    = (context || []) << statement.parameters.first.jump(:string_content).source

    (object[:specifications] ||= []) << {
      :name   => name.join(' '),
      :file   => statement.file,
      :line   => statement.line,
      :source => statement.source.chomp
    }
  end

end
