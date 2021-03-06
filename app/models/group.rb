# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string
#  descirption :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ActiveRecord::Base
  has_many :memberships, :class_name => 'Membership', :foreign_key => 'group_id'
  has_many :users, :through => :memberships
end
