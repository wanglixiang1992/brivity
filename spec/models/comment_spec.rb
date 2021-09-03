# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  post_id    :bigint           not null
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Table structure' do
    it { is_expected.to have_db_column(:body).of_type(:text) }
  end

  describe 'Model relations' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:author) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:body) }
  end
end
