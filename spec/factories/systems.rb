FactoryGirl.define do
  factory :system do
    sequence(:name) {|x| "system #{x}" }
    x                93.90625
    y               -94.15625
    z               -15.09375
  end

end
