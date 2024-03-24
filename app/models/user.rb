class User < ApplicationRecord
  validates :login, length: { minimum: 5, message: 'Логин должен быть не менее 5 символов' }, uniqueness: { message: 'Такой логин уже используется' }
  validates :password, length: { minimum: 5, message: 'Пароль должен быть не менее 5 символов' }
end
