module YardRailsPack
  class Base < YARD::Handlers::Ruby::Base

    def object_for_namespace
      if owner[:namespace]
        P(owner[:namespace])
      else
        P(namespace)
      end
    end

  end
end
