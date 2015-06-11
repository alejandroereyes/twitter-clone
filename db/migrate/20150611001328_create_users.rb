class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string     :user_name
      t.integer    :message_count, default: 0
      t.timestamps null: false
    end
  end
end
