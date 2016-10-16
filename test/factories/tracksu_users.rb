# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tracksu_user, :class => 'Tracksu::User' do
    name "MyString"
    email "MyString"
    activated false
  end
end
