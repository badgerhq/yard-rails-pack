class ValidationsHandler < YardRailsPack::Base

  ### DSL methods to handle

  [
    :validate,
    :validates,
    :validates_presence_of,
    :validates_uniqueness_of,
    :validates_associated,
    :validates_format_of
  ].each do |method|
    handles method_call(method)
  end

  def process
    object = object_for_namespace
    (object[:validations] ||= []) << statement.source
  end
end
