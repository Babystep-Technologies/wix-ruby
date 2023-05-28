require ::File.expand_path("./test_helper", __dir__)

module Wix
  class WixTest < Test::Unit::TestCase
    should "configurable" do
      Wix.api_key = "abc"
      Wix.site_id = "site_123"
      Wix.account_id = "account_123"

      assert_equal "abc", Wix.api_key
      assert_equal "site_123", Wix.site_id
      assert_equal "account_123", Wix.account_id
    end
  end
end
