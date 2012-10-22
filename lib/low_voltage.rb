require 'low_voltage/version'
require 'low_voltage/configuration'

module LowVoltage
  autoload :PostFinder, 'low_voltage/post_finder'
  autoload :Post, 'low_voltage/post'

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  require 'low_voltage/engine' if defined?(Rails)
end
