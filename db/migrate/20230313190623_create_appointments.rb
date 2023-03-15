class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      # t.string :date
      # t.string :time
      t.datetime :datetime

      t.timestamps
    end
  end
end
