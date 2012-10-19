class ChangeAdminAuthToBool < ActiveRecord::Migration

  def up
#    add_column(table_name, column_name, type, options = {})
#    remove_column(table_name, *column_names)
    remove_column(:users, :admin_auth)
    add_column(:users, :admin_auth, :bool)
  end

  def down
    remove_column(:users, :admin_auth)
    add_column(:users, :admin_auth, :string)
  end
end
