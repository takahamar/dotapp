class Post < ApplicationRecord
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    mount_uploader :picture, PictureUploader
    validates :title, presence: true, length: {minimum: 3, message: 'More than 3 characters needed!'}
    validates :body, presence: true
    validate  :picture_size

    private
    
        # アップロードされた画像のサイズをバリデーションする
        def picture_size
          if picture.size > 5.megabytes
            errors.add(:picture, "should be less than 5MB")
          end
        end

end
