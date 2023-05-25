require ::File.expand_path("../test_helper", __dir__)

module Wix
  class WixConfigurationTest < Test::Unit::TestCase
    context ".setup" do
      should "initialize a new configuration with defaults" do
        config = Wix::WixConfiguration.setup

        assert_equal true, config.verify_ssl_certs
        assert_equal "https://www.wixapis.com", config.api_base
      end
    end
  end
end
