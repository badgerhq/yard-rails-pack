class OberversHandler < YardRailsPack::Base

  ### DSL methods to handle

  handles method_call(:observe)

  def process
    object = object_for_namespace
    (object[:observers] ||= []) << statement.source
  end
end
