class CreateContact < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :user, index: true
      t.string :first_name, null: false
      t.string :last_name
      t.string :email
      t.jsonb :phone_numbers, null: false, default: '{}'
      t.string :address
      t.string :company
      t.string :job_title
      t.date :dob
      t.boolean :archived, null: false, default: false

      t.timestamps null: false
    end

    add_index :contacts, :phone_numbers, using: :gin
    add_index :contacts, :first_name
    add_index :contacts, :last_name
  end
end
