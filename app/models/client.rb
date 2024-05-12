class Client < ApplicationRecord
    has_many :projects, dependent: :destroy
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :phone, presence: true, uniqueness: true
end
