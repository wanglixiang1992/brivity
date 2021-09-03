# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  content    :text
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :post do
    association :author
    title { Faker::Lorem.sentence(word_count: 10) }
    content { Faker::Lorem.sentence(word_count: 30) }
  end
end
