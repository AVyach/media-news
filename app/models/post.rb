# app/models/post.rb

class Post < ApplicationRecord
    has_many :comments
    validates :title, presence: { message: 'Заголовок должен быть указан' },
              length: { minimum: 5, message: 'Заголовок должен содержать не менее 5 символов' }
end
