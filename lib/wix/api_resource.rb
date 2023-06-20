module Wix
  class APIResource
    def self.api_key
      ::Wix.api_key
    end

    def self.api_base
      ::Wix.api_base
    end

    def self.account_id
      ::Wix.account_id
    end

    def self.site_id
      ::Wix.site_id
    end

    def self.request_wix_object(method:, path:, query: "", body: {})
      url = query.empty? ? URI("#{api_base}/#{path}") : URI("#{api_base}/#{path}?#{query}")

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      request = Net::HTTP::Get.new(url)
      request['Authorization'] = "Bearer #{api_key}"
      request["wix-account-id"] = account_id
      request["wix-site-id"] = site_id

      response = https.request(request)
      response_body = JSON.parse(response.body)

      if response.is_a?(Net::HTTPSuccess)
        response_body
      else
        puts "Request failed with code: #{response.code}, message: #{response.message}"
      end
    end

    def self.list(*args)
      raise "not implemented"
    end

    def self.get(*args)
      raise "not implemented"
    end
  end
end
