module Xssh
  module Aws
    class Config
      def initialize(block)
        @cache = false
        instance_eval(&block)
      end

      def cache(mode = nil)
        return @cache if mode == nil

        @cache = mode
      end
    end
  end
end
