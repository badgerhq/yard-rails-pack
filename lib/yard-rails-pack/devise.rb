class DeviseHandler < YardRailsPack::Base

  ### DSL methods to handle

  handles method_call(:devise)

  def process
    object = object_for_namespace
    (object[:devise] ||= []) << statement.source
  end
end
