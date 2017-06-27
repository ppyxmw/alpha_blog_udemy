class RemovePasspowrdDigestFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :passpowrd_digest, :string
  end
end
