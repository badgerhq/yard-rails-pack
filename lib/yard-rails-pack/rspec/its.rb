class RSpec::ItHandler < YARD::Handlers::Ruby::Base
  handles method_call(:it)

  def process
    return if owner.nil?
    object = P(owner[:spec])
    return if object.is_a?(Proxy)

    (object[:specifications] ||= []) << {
      :name   => statement.parameters.first.jump(:string_content).source,
      :file   => statement.file,
      :line   => statement.line,
      :source => statement.source.chomp
    }
  end
end
