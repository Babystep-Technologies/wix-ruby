module Wix
  module Blog
    class Post < ::Wix::APIResource
      def self.list(opts: {})
        request_wix_object(
          method: :get,
          path: "blog/v3/posts",
        )
      end

      def self.get(post_id)
        request_wix_object(
          method: :get,
          path: "blog/v3/posts/#{post_id}",
        )
      end
    end
  end
end
