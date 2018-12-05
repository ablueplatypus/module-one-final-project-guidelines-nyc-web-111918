class CreateGifs < ActiveRecord::Migration[5.0]
  def change
    create_table :gifs do |t|
      t.string :title
      t.string :url
    end
  end

end #end of CreateGifs class
