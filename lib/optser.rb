require 'optser/opt_set'

##
# Module that provides helpers for dealing with options hash passed
# to initializers.
#
#   require 'optser'
#
#   class Example
#
#     def initialize(*args, &block)
#       opts = Optser.extract_options! args
#       @a = opts.get! :mandatory_option
#       @b = opts.get :my_option, 'Default Value'
#       puts args # Rest of args w/o the options hash.
#     end
#
#   end
#
#   Example.new(1, 2, 3, 4, mandatory_option: true)
#
module Optser

  ##
  # Parses the options from the arguments list, and creates a
  # brand new OptSet instance to lookup the options; but does not
  # modify the args.
  #
  def self.extract_options(args)
    return parse_options(args.last.is_a?(::Hash) ? args.last : nil)
  end

  ##
  # Extracts the options from the arguments list, and creates a
  # brand new OptSet instance to lookup the options; pops the options
  # off the args list if we have it.
  #
  def self.extract_options!(args)
    return parse_options(args.last.is_a?(::Hash) ? args.pop : nil)
  end

  ##
  # Creates a new OptSet from the given options.
  #
  def self.parse_options(options)
    return Optser::OptSet.new options
  end

end
