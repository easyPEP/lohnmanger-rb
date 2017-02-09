module Lohnmanger

  # Default configuration options for {Client}
  module Default

    class << self

      # Configuration options
      # @return [Hash]
      def options
        Hash[Lohnmanger::Configurable.keys.map{|key| [key, send(key)]} ]
      end

      def api_endpoint
        ENV['LOHNMANAGER_API_ENDPOINT'] || "http://api.lohnmanager.malta.obfr-dev.de/LohnManagerService.svc/json"
      end

      # Default access token from ENV
      # @return [String]
      def apiKey
        ENV['LOHNMANAGER_API_KEY'] || ''
      end

      def companyNo
      	ENV['LOHNMANAGER_COMPANY_NO'] || ''
      end

    end
  end
end
