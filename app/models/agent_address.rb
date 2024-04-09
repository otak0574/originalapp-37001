class AgentAddress < ApplicationRecord
  belongs_to :deli_agent

  with_options presence: true do
    validates :pref_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :deli_agent_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :pref_id, numericality: {other_than: 0, message: "can't be blank"}

  geocoded_by :full_agent_address   # full_street_addressメソッドが住所を返すように設定
  after_validation :geocode          # バリデーション後にジオコーディングを実行

  def full_agent_address
    pref_name = Pref.find(self.pref_id).name
    # 住所を結合して返すメソッド（例）
    "#{pref_name} #{self.city}".strip
  end

end
