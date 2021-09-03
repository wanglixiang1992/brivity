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
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', inverse_of: :posts
  has_many :comments, dependent: :destroy

  validates :title, presence: true

  default_scope { order(created_at: :desc) }
end
