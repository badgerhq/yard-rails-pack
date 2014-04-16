class AssocationsHandler < YardRailsPack::Base
  [
    :belongs_to,
    :has_many,
  ].each do |method|
    handles method_call(method)
  end

  def process
    object = object_for_namespace
    (object[:assocations] ||= []) << statement.source
  end
end
