# frozen_string_literal: true

class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true
  validates :email, format: { with: /\A\S+@\S+[.]\S+\z/,
                              message: 'Invalid Email' }

  has_many :children
  has_many :chores, through: :children, source: :chores
  has_many :appointments, through: :chores
end
