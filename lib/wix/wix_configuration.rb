module Wix
  class WixConfiguration
    attr_accessor :account_id
    attr_accessor :api_key
    attr_accessor :site_id

    attr_reader :api_base
    attr_reader :verify_ssl_certs

    def self.setup
      new.tap do |instance|
        yield(instance) if block_given?
      end
    end

    def initialize
      @verify_ssl_certs = true
      @api_base = "https://www.wixapis.com"
    end
  end
end
