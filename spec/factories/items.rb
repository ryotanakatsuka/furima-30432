FactoryBot.define do
  factory :item do
    image                  {"test_image.png"}
    name                   {"aaa"}
    text                   {"aaa"}
    condition_id           {2}
    shipping_charges_id    {2}
    delivery_source_id     {2}
    delivery_date_id       {2}
    price                  {333}
    genre_id               {2}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
