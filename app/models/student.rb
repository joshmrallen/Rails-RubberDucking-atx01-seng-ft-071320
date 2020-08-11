class Student < ApplicationRecord
    has_many :ducks
    validates :name, presence: { message: "--> Name cannot be blank." }
    validates :mod, inclusion: {in: 1..5, message: "--> Mod must be 1, 2, 3, 4, or 5." }
end

# attributes: name, mod