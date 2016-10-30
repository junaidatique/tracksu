# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :saleproduct do
    activity nil
    product nil
    rate "9.99"
    quantity 1
  end
end
