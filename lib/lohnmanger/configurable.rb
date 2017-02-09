module Lohnmanger
  module Configurable

    #attr_accessor :apiKey, :companyNo, :api_endpoint
    attr_writer :apiKey, :companyNo, :api_endpoint

    class << self
      def keys
        @keys ||= [:apiKey, :companyNo, :api_endpoint]
      end
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    # Reset configuration options to default values
    def reset!
      Lohnmanger::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Lohnmanger::Default.options[key])
      end      
      self
    end
    alias setup reset!

    private

    def options
      Hash[Lohnmanger::Configurable.keys.map{|key|  [key, instance_variable_get(:"@#{key}")] }]
    end

  end
end
