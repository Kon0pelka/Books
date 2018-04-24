class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :interim_tables
  has_many :comments
  has_many :books, through: :interim_tables

  def set_admin
    update_attribute(:admin,    true)
  end

  def del_admin
    update_attribute(:admin,    false)
  end
end
