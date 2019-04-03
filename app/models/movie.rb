class Movie < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :description, presence: true
  validates :file, movie_format: true

  def increment_visualization
    self.visualization+=1
    self.save
  end
end
