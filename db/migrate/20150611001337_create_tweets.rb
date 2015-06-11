class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string     :user_name
      t.string     :message
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
