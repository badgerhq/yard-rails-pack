class CallbacksHandler < YardRailsPack::Base

  ### DSL methods to handle

  [
    :before,
    :after,

    :before_save,
    :after_save,

    :before_update,
    :after_update,

    :before_create,
    :after_create,

    :after_commit,
    :before_commit,

    :before_destroy,
    :after_destroy,

    :before_validation,
    :after_validation,

    :before_initialize,
    :after_initialize
  ].each do |method|
    handles method_call(method)
  end

  def process
    object = object_for_namespace
    (object[:callbacks] ||= []) << statement.source
  end
end
