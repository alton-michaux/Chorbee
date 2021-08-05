# frozen_string_literal: true

class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, format: { with: /^\S+@\S+\.\S+$/,
                              message: 'Invalid Email' }

  has_many :children
end
