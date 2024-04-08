class CreateAgentAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :agent_addresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :pref_id,    null: false
      t.string     :city
      t.string     :house_number
      t.string     :building_name
      t.float      :latitude
      t.float      :longitude
      t.references :deli_agent, null: false, foreign_key: true
      t.timestamps
    end
  end
end
