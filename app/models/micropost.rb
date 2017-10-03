class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size

  def self.get_rand_microposts(getFeedLength)
    count = Micropost.count() - getFeedLength
    raise Errors::InvalidFeedLengthError if count < 0
    randIndex = Random.rand(0..count)
    Micropost.where("id between #{randIndex} and #{randIndex + getFeedLength}")
  end

  private

  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
