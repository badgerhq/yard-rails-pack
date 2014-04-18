class ControllerFilterHandler < YardRailsPack::Base

  ### DSL methods to handle

  [
    :before_filter,
    :after_filer,
    :around_filter,
  ].each do |method|
    handles method_call(method)
  end

  def process
    object = object_for_namespace
    (object[:controller_filters] ||= []) << statement.source
  end
end