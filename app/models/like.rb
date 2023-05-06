class Like < ApplicationRecord
	belongs_to :author , class_name: "User" , foreign_key: "user_id"
	belongs_to :post , counter_cache: true
end
