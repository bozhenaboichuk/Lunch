# frozen_string_literal: true

class RemovePasswordDigestFromUsers < ActiveRecord::Migration[7.0]
  def up
    remove_column :users, :password_digest
  end

  def down
    add_column :users, :password_digest, :string
  end
end
