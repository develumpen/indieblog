class CreateEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :entries do |t|
      t.datetime :published_at, null: false
      t.text :content

      t.timestamps
    end
  end
end
