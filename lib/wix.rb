require "forwardable"
require 'net/http'
require 'json'

# Version
require "wix/version"

# API operations


# API resource support classes
require "wix/api_resource"
require "wix/wix_configuration"

# Named API Resources
require "wix/resources"

module Wix
  @config = Wix::WixConfiguration.setup

  class << self
    extend Forwardable

    attr_reader :config

    def_delegators :@config, :api_base, :api_base=
    def_delegators :@config, :account_id, :account_id=
    def_delegators :@config, :api_key, :api_key=
    def_delegators :@config, :site_id, :site_id=
    def_delegators :@config, :verify_ssl_certs, :verify_ssl_certs=

  end
end
