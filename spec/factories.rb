FactoryGirl.define do
  factory :post do |f|
    f.title {Faker::Lorem.sentence(word_count=5)}
    f.content {Faker::Lorem.paragraph(paragraph_count=1)}
    f.parent_id nil
  end




  
end
