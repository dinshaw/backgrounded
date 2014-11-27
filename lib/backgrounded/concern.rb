require File.join(File.dirname(__FILE__), 'proxy')

module Backgrounded
  module Concern
    extend ActiveSupport::Concern

    module ClassMethods
      # @see Backgrounded::Concern#backgrounded
      def backgrounded(options={})
        Backgrounded::Proxy.new self, options
      end
    end

    # @param options (optional) options to pass into the backgrounded handler
    def backgrounded(options={})
      Backgrounded::Proxy.new self, options
    end
  end
end
