Optser
======

Handle options from a set of arguments.

Installation
============

Add this line to your application's Gemfile:

    gem 'optser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install optser

Usage
=====

    require 'optser'

    class MyClass

      def initialize(*args)
        opts = Optser.extract_options! args

        # Optional, with nil as default
        @a = opts.get :option_a

        # Optional, with default value
        @b = opts.get :option_b, 'DEFAULT'

        # Option's default value is the value returned by the block
        @c = opts.get(:option_c) {
          Hash.new
        }

        # Mandatory option, which will raise an error if not present.
        @d = opts.get! :option_d
      end
    end

    # Will be successful
    my_object = MyClass.new option_d: 3
    puts my_object
    => #<MyClass:0x007fe09c322d80 @a=nil, @b="DEFAULT", @c={}, @d=3>


Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
