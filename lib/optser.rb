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
  # Extracts the options from the arguments list, and creates a
  # brand new OptSet instance to lookup the options.
  #
  def self.extract_options!(args)
    return Optser::OptSet.new(args.last.is_a?(::Hash) ? args.pop : nil)
  end

end
