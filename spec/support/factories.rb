require 'factory_girl'
require 'hashie'
require 'securerandom'

FactoryGirl.define do
  sequence(:random_string) { SecureRandom.hex }

  factory :random_options, class: Hashie::Mash do
    option_a { generate(:random_string) }
    option_b { generate(:random_string) }
    option_c { generate(:random_string) }
  end
end
