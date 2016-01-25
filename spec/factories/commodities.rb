FactoryGirl.define do
  factory :commodity do
    sequence(:name) {|n| "Commodity #{n}" }
  end
end
