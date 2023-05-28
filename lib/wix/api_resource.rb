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

    def self.request_wix_object(method:, path:, body: {})
      api_url = URI.parse("#{api_base}/#{path}")
      request_class = Net::HTTP.const_get(method.capitalize)
      request = request_class.new(api_url.path)
      request['Authorization'] = "Bearer #{api_key}"
      request['wix-account-id'] = account_id
      request['wix-site-id'] = site_id
      request['Content-Type'] = "application/json"
      request['Accept'] = "application/json"
      request.body = body.to_json

      response = Net::HTTP.start(api_url.host, api_url.port, use_ssl: true) do |http|
        http.request(request)
      end

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
