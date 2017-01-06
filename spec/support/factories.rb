FactoryGirl.define do
  factory :item do
    name
    description "Blah blah"
    image_url "www.google.com"
  end
  sequence :name do |n|
    "Item #{n}"
  end
end
