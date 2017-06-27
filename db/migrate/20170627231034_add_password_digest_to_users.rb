class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :passpowrd_digest, :string
  end
end
