class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :user, :passpowrd_digest, :string
  end
end
