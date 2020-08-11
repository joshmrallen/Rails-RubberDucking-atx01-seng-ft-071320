class Duck < ApplicationRecord
    belongs_to :student
    validates :name, :description, presence: { message: "--> Name and Description cannot be blank." }

    def student_attributes=(student)
        self.student = Duck.find_or_create_by(name: student[:name], mod: student[:mod])
        self.student.update(student)
    end
end

#attributes: name, description, student_id 