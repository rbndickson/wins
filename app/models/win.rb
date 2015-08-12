class Win < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :creator, presence: true
  validates :body, presence: true

  scope :today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }
end
