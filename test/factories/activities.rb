# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    user nil
    activity_date "2016-10-12"
    type ""
    start_time "2016-10-12 01:19:06"
    end_time "2016-10-12 01:19:06"
    duration 1
    activity "MyString"
  end
end
