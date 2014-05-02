require 'active_support'
require 'active_support/all'

class SchemaHandler < YardRailsPack::Base

  ### DSL methods to handle

  handles method_call(:create_table)

  def process
    name       = statement.parameters.first.jump(:string_content).source.classify
    namespace  = P(name)
    source     = statement.last.last.source
    columns    = {}

    columns['String']   = (source.scan(/^*.t.string.*"(.*)"\s/).flatten + source.scan(/^*.t.text.*"(.*)"\s/).flatten)
    columns['Integer']  = source.scan(/^*.t.integer.*"(.*)"\s/).flatten
    columns['DateTime'] = source.scan(/^*.t.datetime.*"(.*)"\s/).flatten
    columns['Float']    = source.scan(/^*.t.float.*"(.*)"\s/).flatten
    columns['Hstore']   = source.scan(/^*.t.hstore.*"(.*)"\s/).flatten
    columns['Decimal']  = source.scan(/^*.t.decimal.*"(.*)"\s/).flatten

    read, write = true, true

    columns.each do |klass, columns|
      columns.each do |column|
        begin
          add_method(namespace, klass, column)
        rescue
          begin
            name       = statement.parameters.first.jump(:string_content).source
            namespace  = P(name.gsub('_', '/').classify)

            add_method(namespace, klass, column)
          rescue => e
            p e
          end
        end
      end
    end
  end

  def add_method(namespace, klass, column)
    namespace.attributes[scope][column] ||= SymbolHash[:read => nil, :write => nil]

    { :read => column, :write => "#{column}=" }.each do |type, meth|
      next unless P("#{namespace}##{meth}").is_a?(Proxy) # already documented

      o = MethodObject.new(namespace, meth, scope)
      if type == :write
        o.parameters = [['value', nil]]
        src          = "def #{meth}(value)"
        full_src     = "#{src}\n  @#{column} = value\nend"
        doc          = "Sets the attribute #{column}\n@param value the value to set the attribute #{column} to."
      else
        src          = "def #{meth}"
        full_src     = "#{src}\n  @#{column}\nend"
      end
      o.add_tag(YARD::Tags::Tag.new(:return, nil, klass))
      o.source ||= full_src
      o.signature ||= src
      register(o)
      o.docstring = doc if o.docstring.blank?(false)

      # Regsiter the object explicitly
      namespace.attributes[scope][column][type] = o
    end
  end
end
