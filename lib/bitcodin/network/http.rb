module Bitcodin

  class ResponseCodes

    GET    = 200
    POST   = 201
    DELETE = 204
    PATCH  = 200

  end

  class HTTP

    attr_accessor :apiKey, :headers

    def initialize(apiKey, headers)
      @apiKey  = apiKey
      @headers = headers
    end

    def sendRequest(method, url, values = nil)
      case method
        when 'get'
          callResourceGet(url)
        when 'patch'
          callResourcePatch(url)
        when 'post'
          callResourcePost(url, values)
        when 'delete'
          callResourceDelete(url)
      end
    end

    def callResourceGet(url)
      # puts 'Get'
      # puts url
      begin
        response = unsafe_get url, @headers
        return response
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
        return nil
      end
    end

    def callResourcePatch(url)
      # puts 'Patch'
      # puts url
      begin
        response = unsafe_patch url, @headers
        return response
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
        return nil
      end
    end

    def callResourcePost(url, value)
      # puts 'Post'
      # puts url
      # puts value
      begin
        response = unsafe_post url, value, @headers
        return response
      rescue Exception => e
        puts e.message
        puts e.inspect
        e.backtrace
        return nil
      end
    end

    def callResourceDelete(url)
      # puts 'Delete'
      # puts url
      begin
        response = unsafe_delete url, @headers
        return response
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
        return nil
      end
    end

    def unsafe_get(url, &block)
    	puts "calling unsafe get"
    	RestClient::Request.execute(method: :get, url: url, headers: @headers, verify_ssl: false, &block)
    end

    def unsafe_patch(url, &block)
    	puts "calling unsafe patch"
    	RestClient::Request.execute(method: :patch, url: url, headers: @headers, verify_ssl: false, &block)
    end

    def unsafe_delete(url, &block)
    	puts "calling unsafe delete"
    	RestClient::Request.execute(method: :delete, url: url, headers: @headers, verify_ssl: false, &block)
    end

    def unsafe_post(url, value)
    	puts "calling unsafe post"
    	RestClient::Request.execute(method: :post, url: url, headers: @headers, verify_ssl: false, payload: value, &block)
    end

  end
end
