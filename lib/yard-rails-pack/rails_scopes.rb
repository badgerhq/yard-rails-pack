class RailsScopesHandler < YardRailsPack::Base

  ### DSL methods to handle

  handles method_call(:scope)

  def process
    object = object_for_namespace
    (object[:scopes] ||= []) << statement.source
  end
end
