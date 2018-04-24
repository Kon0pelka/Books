class Book < ApplicationRecord
    has_many :interim_tables
    has_many :users, through: :interim_tables
    belongs_to :autor
    has_many :comments
    mount_uploader :picture, ImageUploader
end
