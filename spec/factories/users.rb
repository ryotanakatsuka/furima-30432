FactoryBot.define do
  factory :user do
    nickname                 {"ryo"}
    email                    {"kkk@gmail.com"}
    password                 {"n000000"}
    password_confirmation    {"n000000"}
    first_name               {"中塚"}
    last_name                {"亮太"}
    first_name_kana          {"ナカツカ"}
    last_name_kana           {"リョウタ"}
    birth_day                {"1931-09-5"}
  end
end
  
  #nickname               {Faker: :Name.initials(number: 2)}
  #email                  {Faker: :Internet.free_mail}
  #password               {Faker: :Internet.password(min_length: 6)}
  #password_confirmation  {password}