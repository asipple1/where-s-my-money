class Membership < ActiveRecord::Base
  belongs_to :group, :class_name => 'Group', :foreign_key => 'group_id'
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'

  has_many :given, :class_name => 'Expense', :foreign_key => 'giver_id'
  has_many :received, :class_name => 'Expense', :foreign_key => 'receiver_id'
end
