require 'xssh/aws'

Xssh::Aws.configure do
  cache true
end

pp Xssh::Aws.instance_souces(address_type: :private)
pp Xssh::Aws.instance_souces(address_type: :private)
pp Xssh::Aws.instance_souces(address_type: :private)
