# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tracksu_product, :class => 'Tracksu::Product' do
    title "MyString"
    activated false
  end
end
