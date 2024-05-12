class Project < ApplicationRecord
    enum :status, { ToDo: 0, InProgress: 1, Completed: 2 }

    belongs_to :client
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true, uniqueness: true
    validates :status, presence: true, uniqueness: true
    validates :client_id, presence: true,uniqueness: true
end
