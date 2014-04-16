module YardRailsPack
  class Routes

    class << self

      def process
        load!

        application_name = Rails.application.class.parent_name

        inspector = ActionDispatch::Routing::RoutesInspector.new(@routes)
        @body     = "# #{application_name} Routes\n\n```\n#{application_name}\n\n"
        @body     << inspector.format(ActionDispatch::Routing::ConsoleFormatter.new, ENV['CONTROLLER'])
        @body     << "\n```"

        save!
      end

      ##
      # Load Rails environment and routes
      #
      def load!
        load 'config/application.rb'
        Rails.application.initialize!
        @routes = Rails.application.routes.routes
        require 'action_dispatch/routing/inspector'
      end

      ##
      # Saves the routes.
      #
      def save!
        File.open('ROUTES.md', 'w') do |file|
          file.write(@body)
        end
      end

    end

  end
end
