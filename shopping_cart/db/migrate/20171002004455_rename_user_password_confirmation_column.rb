class RenameUserPasswordConfirmationColumn < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :users, :confirm_password, :password_confirmation
  end
  def self.down
    rename_column :users, :password_confirmation, :confirm_password
  end
end
