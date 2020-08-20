# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :history do
    activity nil
    user nil
    comments "MyText"
  end
end
