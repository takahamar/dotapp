class LikesController < ApplicationController
  # before_actionに「:authenticate_user」を追加してください
  before_action :authenticate_user
  
  # createアクションを追加してください
  def create
  end
  
end