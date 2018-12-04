class CreateGifs < ActiveRecord::Migration[5.0]
  def change
    create_table :gifs do |t|
      t.string :title
      t.string :url
      t.integer :num_of_favorites
    end
  end

end #end of CreateGifs class
