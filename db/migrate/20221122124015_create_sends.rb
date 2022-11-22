class CreateSends < ActiveRecord::Migration[6.1]
  def change
    create_table :sends do |t|
      t.references :author, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.timestamps
    end
  end
end
