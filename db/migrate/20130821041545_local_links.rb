class LocalLinks < ActiveRecord::Migration
  def change
    add_column :deals, :local_user_id, :integer
    add_column :deals, :local_account_id, :integer

    Deal.all.each do |deal|
      deal.local_user_id = User.find_or_create_by(username: deal.responsible_user).id
      deal.local_account_id = Account.find_or_create_by(name: deal.responsible_account).id
      deal.save
    end

    remove_columns :deals, :responsible_user, :responsible_account

  end
end
