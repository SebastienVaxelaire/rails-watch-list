class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, uniqueness: { scope: :list_id }
  validates :comment, length: { minimum: 6, too_long: '%{count} characters is the minimum allowed' }
end
