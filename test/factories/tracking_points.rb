# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tracking_point do
    activity nil
    latitude "MyString"
    longitude "MyString"
  end
end
