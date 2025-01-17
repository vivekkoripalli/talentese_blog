class Post < ApplicationRecord
   extend FriendlyId
  friendly_id :title, use: :slugged

  scope :most_recent, -> { order(id: :desc)}
  def should_generate_new_friendly_id?
    title_changed?
  end
  def display_day_published
    "published #{created_at.strftime('%-b %-d, %Y')}"
  end
end
