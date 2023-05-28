module Wix
  module Blog
    class Category < ::Wix::APIResource
      def self.list(opts: {})
        request_wix_object(
          method: :get,
          path: "blog/v3/categories",
        )
      end

      def self.get(category_id)
        request_wix_object(
          method: :get,
          path: "blog/v3/categories/#{post_id}",
        )
      end

    end
  end
end
