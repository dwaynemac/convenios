# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deal do
    business
    title 'a discount'
    local_user_id { User.first.id }
    local_account_id { Account.first.id }
  end
end
