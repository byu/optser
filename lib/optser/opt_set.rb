require 'hashie'

module Optser

  class OptSet
    attr_reader :options

    def initialize(options)
      @options = Hashie::Mash.new options
    end

    ##
    # Lookup an option from our options set.
    #
    # Examples:
    #
    #   # Optional parameter whose default value is nil.
    #   do_extra = opt_set.get :do_extra
    #
    #   # Optional params that defaults to [1,2,3]
    #   start_array = opt_set.get :start_array, [1,2,3]
    #
    # Returns default value when:
    # * Key is non-existent in Options Hash.
    # * OR when the value of the key in the Options Hash is nil.
    #
    # Returns nil when:
    # * Default is nil and the Options Hash lookup returns a nil.
    #   Options Hash returns a nil because of either a
    #   non-existent key or a nil value in said hash for said key.
    #
    def get(key, default=nil, &block)
      value = options[key]
      value = default if value.nil?
      value = block.call if value.nil? && block
      return value
    end

    ##
    # Use this the option is mandatory.
    #
    # There are cases where an option may have a default value for a feature,
    # but the caller may just want to disable said feature. To do so,
    # users of this module should allow for the caller to pass in 'false'
    # as an option value instead of nil to disable said feature. The
    # implementer will have to do a boolean check of the returned option value
    # and disable accordingly.
    #
    # Examples:
    #
    #   # Has a default logger, but we can disable logging by passing false.
    #   # If caller had passed in nil for :logger, it would have
    #   # defaulted to ::Log4r['my_logger'].
    #   logger = opt_set.get! :logger, ::Log4r['my_logger']
    #
    #   # Here we force the end user to pass in a Non-nil option as a
    #   # mandatory parameter.
    #   max_threads = opt_set.get! :max_threads
    #
    # Raises error when `get` returns a nil.
    #
    def get!(key, default=nil, &block)
      value = get key, default, &block
      raise "Nil value found for option: #{key}, #{default}" if value.nil?
      return value
    end

  end

end
