# == Schema Information
#
# Table name: lists
#
#  id               :integer          not null, primary key
#  list_description :string           default(""), not null
#  list_name        :string(20)       default(""), not null
#  position         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  board_id         :integer          not null
#
# Indexes
#
#  index_lists_on_board_id  (board_id)
#

class List < ApplicationRecord
  acts_as_list scope: :board
  belongs_to :board
  has_many :cards, ->{ order(position: :asc) }, dependent: :destroy
  validates :list_name, :presence => true, length: { maximum: 20 }
end
