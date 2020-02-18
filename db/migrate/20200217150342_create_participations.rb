class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.string :stripe_customer_id
      t.references :user, index: :true
      t.references :event, index: :true

      t.timestamps
    end
  end
end
