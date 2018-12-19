class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contents

  devise :timeoutable, :lockable

  validate :password_complexity
  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
    errors.add :password, "パスワードの強度が不足しています。パスワードの長さは8〜70文字とし、大文字と小文字と数字と特殊文字をそれぞれ1文字以上含める必要があります。"
  end
end
