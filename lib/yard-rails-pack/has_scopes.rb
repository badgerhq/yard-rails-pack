class HasScopeHandler < YardRailsPack::Base

  ### DSL methods to handle

  [
    :has_scope
  ].each do |method|
    handles method_call(method)
  end

  def process
    object = object_for_namespace
    (object[:has_scopes] ||= []) << statement.source
  end
end