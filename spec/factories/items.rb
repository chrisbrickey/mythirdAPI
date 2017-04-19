#wrapping faker methods in a block ensures that faker generates dynamic data every time the factory is invoked
FactoryGirl.define do
  factory :item do
    name { Faker::StarWars.character }
    done false
    todo_id nil
  end
end
