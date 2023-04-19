class Book < ApplicationRecord
  belongs_to :user

  has_one_attached :profile_image

  validates :title, presence: true
  validates :body, length: { minimum: 1, maximum: 200 }

  def get_profile_image(width,height)
    unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/no-image.jpg')
     profile_image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpg')
    end
     profile_image.variant(resize_to_limit: [width,height]).processed
  end

end
