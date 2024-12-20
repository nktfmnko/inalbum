class User < ApplicationRecord
    has_many :posts
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: { message: "Пароли не совпадают" }, length: {minimum: 8, message: "Пароль должен содержать не менее 8 символов"}, 
        format: { with: /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,70}$\z/, message: "Пароль должен содержать хотя бы одну строчную букву, одну заглавную букву и одну цифру" }
    validates :password_confirmation, presence: true
end