class NestedAttributesHandler < YardRailsPack::Base

  ### DSL methods to handle

  handles method_call(:accepts_nested_attributes_for)

  def process
    object = object_for_namespace

    name               = statement.parameters.first.jump(:string_content).source
    new_method_name    = "#{name}_attributes=(attributes={})".gsub(':', '')
    new_method         = YARD::CodeObjects::MethodObject.new(namespace, new_method_name, :instance)

    new_method.add_tag(YARD::Tags::Tag.new(:return, "attributes hash", 'Hash'))
    new_method.add_tag(YARD::Tags::Tag.new(:param, "attributes hash", 'Hash', 'attributes'))
    register(new_method)

    (object[:nested_attributes] ||= []) << statement.source
  end

end
