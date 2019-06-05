# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  is_active  :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_members_on_group_id  (group_id)
#  index_members_on_user_id   (user_id)
#

class Member < ApplicationRecord
  belongs_to :group
  belongs_to :user
end
