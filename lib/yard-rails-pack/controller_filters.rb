class ControllerFilterHandler < YardRailsPack::Base

  ### DSL methods to handle

  [
    :skip_before_filter,
    :skip_after_filter,
    :skip_around_filter,
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