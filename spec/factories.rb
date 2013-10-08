FactoryGirl.define do
  factory :post do |f|
    f.title {Faker::Lorem.sentence(word_count=5)}
    f.content {Faker::Lorem.paragraph(paragraph_count=1)}
    f.parent_id 0
  end    
  factory :comment, parent: :post do |f|
    f.parent_id 1
  end  
 
end
