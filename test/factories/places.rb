# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    company nil
    name "MyString"
    type ""
    latitude "MyString"
    longitude "MyString"
    external_id 1
  end
end
