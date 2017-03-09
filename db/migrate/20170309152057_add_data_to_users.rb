class AddDataToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :string, default: 'Not defined'
    add_column :users, :age, :integer
  end
end
