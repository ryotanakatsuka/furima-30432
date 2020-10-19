FactoryBot.define do
  factory :item do
    name                   {"aaa"}
    text                   {"aaa"}
    condition_id           {"2"}
    shipping_charges_id    {"2"}
    delivery_source_id     {"2"}
    delivery_date_id       {"2"}
    price                  {"333"}
    genre_id               {"2"}
    user
  end
end
