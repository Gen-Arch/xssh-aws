require 'aws-sdk-ec2'
require 'yaml'

module Xssh
  module Aws
    class EC2
      def initialize
        @ec2        = ::Aws::EC2::Resource.new
      end

      def instances(cache: false)
        @instances ||= @ec2.instances
      end

    end
  end
end
