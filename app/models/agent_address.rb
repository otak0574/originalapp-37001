class AgentAddress < ApplicationRecord
  belongs_to :deli_agent

  with_options presence: true do
    validates :pref_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :deli_agent_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :pref_id, numericality: {other_than: 0, message: "can't be blank"}

end
