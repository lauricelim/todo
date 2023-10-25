class User < ApplicationRecord
  has_many :todo_tasks, dependent: :destroy

  accepts_nested_attributes_for :todo_tasks
end