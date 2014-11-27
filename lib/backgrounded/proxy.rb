module Backgrounded
  attr_reader :delegate, :options
  class Proxy
    def initialize(delegate, options={})
      @delegate = delegate
      @options = options || {}
    end

    def method_missing(method_name, *args)
      Backgrounded.handler.request(@delegate, method_name, args, @options)
      nil
    end
  end
end
