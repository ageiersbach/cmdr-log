FactoryGirl.define do
  factory :entry do
    system_object
    activity Activity.first
    cmdr
  end
end
