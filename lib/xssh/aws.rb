require 'xssh/aws/ec2'
require 'xssh/aws/config'

module Xssh

  def self.aws(**opts)
    ::Aws.config.update(opts)
  end

  module Aws
    class << self
      def ec2
        @ec2 ||= EC2.new
      end

      def configure(&block)
        @config = Config.new(block)
      end

      def instance_souces(query='.*', **opts)
        instances = ec2.instances

        instances.map do |i|
          name = i.tags.find{|h| h.key == 'Name' }.value || i.instance_id
          next unless name =~ /#{query}/
          next unless i.state.name == "running"

          addr_type = opts[:address_type] || :public
          type      = opts[:type] || :linux

          {
            type:         type,
            name:         name,
            host_name:    i.send("#{addr_type}_ip_address".to_sym),
            instance_id:  i.instance_id,
            aws:          i
          }
        end
      end
    end
  end
end
