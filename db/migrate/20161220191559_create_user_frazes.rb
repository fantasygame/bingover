class CreateUserFrazes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_frazes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :fraze, foreign_key: true
      t.boolean :checked

      t.timestamps
    end
  end
end
