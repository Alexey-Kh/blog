FactoryGirl.define do
  factory :article do
    sequence(:title) { |i| "valid #{i}" }
    content "valid"

    factory :invalid_article do
      title ''
    end
  end

end
