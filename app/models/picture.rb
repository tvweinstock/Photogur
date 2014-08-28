class Picture < ActiveRecord::Base
  scope :most_recent_five, -> {newest_first.limit(5)}
  scope :newest_first, -> {order(created_at: :desc)}
  scope :created_before, -> (time) {where("created_at < ?", time)}
  # def self.most_recent
  #   order(created_at: :desc).limit(5)
  # end
  # def self.created_before(time)
  #   where("created_at < ?", time)
  # end
  def self.created_before(time)
    where("created_at < ?", time)
  end

  def self.created_after(time)
    where("created_at > ?", time)
  end
end
