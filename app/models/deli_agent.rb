class DeliAgent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :agent_address
  with_options presence: true do
    validates :nickname, :birth_date, :first_name, :last_name
    validates :gender_id, numericality: { only_integer: true }
    validates :first_name_kana,:last_name_kana, format: { with: /\A[\p{katakana} ー－]+\z/, message: 'はカタカナで入力して下さい。' }
    #性別のIDが指定された範囲内にあることを検証
    validates :gender_id, inclusion: { in: 1..5, message: 'は不正な値です。' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は不正な値です。' }
  end

end
