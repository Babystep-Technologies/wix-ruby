module Wix
  class Member < ::Wix::APIResource
    def self.list(opts: {})
      request_wix_object(
        method: :get,
        path: "members/v1/members",
      )
    end

    def self.get(member_id)
      request_wix_object(
        method: :get,
        path: "members/v1/members/#{member_id}",
      )
    end
  end
end
