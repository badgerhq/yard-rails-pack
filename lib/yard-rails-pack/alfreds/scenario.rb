class Alfreds::ScenarioHandler < YardRailsPack::Base

  ### DSL methods to handle

  handles method_call(:scenario)

  def process
    begin
      action    = statement.last.last.source.scan(/(get|post|put|patch|head|option|delete)\s(.*)/).flatten[1].gsub(':', '')
      namespace = "#{owner[:namespace]}##{action}"
      object    = P(namespace)
      name      = statement.parameters.first.jump(:string_content).source

      return if object.is_a?(Proxy)

      data = {
        :name   => name,
        :file   => statement.file,
        :line   => statement.line,
        :source => statement.source.chomp
      }

      (object[:alfreds] ||= []) << data
    rescue => e
      p e
    end
  end

end
