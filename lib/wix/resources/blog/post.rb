module Wix
  module Blog
    class Post < ::Wix::APIResource
      def self.list(opts: {})
        request_wix_object(
          method: :get,
          path: "blog/v3/posts",
        )
      end

      SUPPORTED_FIELDSETS = %w(
        UNKNOWN COUNTERS URL CONTENT_TEXT METRICS SEO CONTENT INTERNAL_ID CONTACT_ID RICH_CONTENT
      ).freeze
      def self.get(post_id, fieldsets=[])
        query_string = SUPPORTED_FIELDSETS.find_all{|field| fieldsets.include?(field) }
          .map{|field| "fieldsets=#{field}"}
          .join("&")

        puts "query_string: #{query_string}"

        request_wix_object(
          method: :get,
          path: "blog/v3/posts/#{post_id}",
          query: query_string,
        )
      end
    end
  end
end
