# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy, inverse_of: :author, foreign_key: :author_id
  has_many :comments, dependent: :destroy, inverse_of: :author, foreign_key: :author_id

  validates :email,
            uniqueness: {
              case_sensitive: false
            },
            presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  def parsed_fullname
    name.presence || email
  end

  def name
    [first_name, last_name].reject(&:blank?).join(' ')
  end
end
