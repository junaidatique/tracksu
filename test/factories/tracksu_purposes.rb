# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tracksu_purpose, :class => 'Tracksu::Purpose' do
    title "MyString"
    activated false
  end
end
