module Wix
  class Member < ::Wix::APIResource
    SUPPORTED_FIELDSETS = %w(PUBLIC FULL EXTENDED).freeze

    # @opts params
    # paging_limit: number of items to load
    # paging_offset: number of items to skip in the current order
    # fieldsets: supported values - PUBLIC, FULL, EXTENDED, default to PUBLIC
    def self.list(opts: {})
      query_string = String.new
      if opts.has_key?(:paging_limit)
        query_string << "paging.limit=#{opts.fetch(:paging_limit)}&"
      end

      if opts.has_key?(:paging_offset)
        query_string << "paging.offset=#{opts.fetch(:paging_offset)}&"
      end

      if opts.has_key?(:fieldsets)
        query_string << SUPPORTED_FIELDSETS.find_all{|field| opts.fetch(:fieldsets).include?(field) }
          .map{|field| "fieldsets=#{field}"}
          .join("&")
      end

      request_wix_object(
        method: :get,
        path: "members/v1/members",
        query: query_string,
      )
    end

    def self.get(member_id, fieldsets=[])
      query_string = SUPPORTED_FIELDSETS.find_all{|field| fieldsets.include?(field) }
      .map{|field| "fieldsets=#{field}"}
      .join("&")

      request_wix_object(
        method: :get,
        path: "members/v1/members/#{member_id}",
        query: query_string,
      )
    end
  end
end