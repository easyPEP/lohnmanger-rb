require_relative "lohnmanger/version"
require_relative "lohnmanger/client"
require_relative 'lohnmanger/default'

module Lohnmanger
  class << self
    include Lohnmanger::Configurable

    # API client based on configured options {Configurable}
    #
    # @return [Lohnmanger::Client] API wrapper
    def client
      @client = Lohnmanger::Client.new(options) unless defined?(@client) && @client.same_options?(options)
      @client
    end

  end
end

Lohnmanger.setup