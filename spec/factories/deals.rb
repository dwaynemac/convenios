# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deal do
    business
    title 'a discount'
    responsible_user 'dwayne'
  end
end
