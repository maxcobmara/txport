class ChangeContractsIssuedByTypeToInteger < ActiveRecord::Migration
  def up
    remove_column :contracts, :issued_by
    add_column    :contracts, :issued_by, :integer
  end
  def down
    remove_column :contracts, :issued_by
    add_column    :contracts, :issued_by, :date
  end
end
