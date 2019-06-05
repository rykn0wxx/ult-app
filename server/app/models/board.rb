# == Schema Information
#
# Table name: boards
#
#  id                :integer          not null, primary key
#  board_description :string           default(""), not null
#  board_name        :string(20)       default(""), not null
#  position          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer          not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#

class Board < ApplicationRecord
  acts_as_list
  belongs_to :user
  has_many :lists, ->{ order(position: :asc) }, dependent: :destroy

  validates :board_name, :presence => true, length: { maximum: 20 }
end
