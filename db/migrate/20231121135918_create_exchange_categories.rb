class CreateExchangeCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :exchange_categories do |t|
      t.references :exchange, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
