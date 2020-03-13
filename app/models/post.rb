class Post < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    mount_uploader :picture, PictureUploader
    validates :title, presence: true, length: {minimum: 3, message: 'More than 3 characters needed!'}
    validates :body, presence: true
    validate  :picture_size
    has_many :iine_users, through: :likes, source: :user
    
    # マイクロポストをいいねする
    def iine(user)
      likes.create(user_id: user.id)
    end

    # マイクロポストのいいねを解除する（ネーミングセンスに対するクレームは受け付けません）
    def uniine(user)
      likes.find_by(user_id: user.id).destroy
    end
    
    # 現在のユーザーがいいねしてたらtrueを返す
    def iine?(user)
      iine_users.include?(user)
    end

    private
    
        # アップロードされた画像のサイズをバリデーションする
        def picture_size
          if picture.size > 5.megabytes
            errors.add(:picture, "should be less than 5MB")
          end
        end

end
