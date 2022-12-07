FactoryBot.define do
  factory :installation do
    name { Faker::Lorem.sentence }
    repo { Faker::Internet.url('github.com') }
    website { Faker::Internet.url }
    contact_name { Faker::Name.name_with_middle }
    conact_email { Faker::Internet.email }
    location { Faker::Address.full_address }
    organization_type { Installation.organization_types.keys.sample }
    status { Installation.installation_statuses.keys.sample }
    notes { Faker::Lorem.paragraph }
  end
end
