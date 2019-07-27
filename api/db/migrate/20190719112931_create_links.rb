class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.integer :link_page_id
      t.string :title
      t.string :url, limit: 2048

      t.timestamps
    end

    add_foreign_key :links, :link_pages
  end
end
