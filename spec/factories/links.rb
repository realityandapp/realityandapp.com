# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    name "MyString"
    url "MyString"
    is_follow false
  end
end
