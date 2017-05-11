class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :url
      t.text :h1_tag_contents
      t.text :h2_tag_contents
      t.text :h3_tag_contents
      t.text :links

      t.timestamps
    end
  end
end
