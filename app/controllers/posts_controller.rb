class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_params)  #post_paramsというメソッドを引数として呼び出している
    if 
      @post.photos.present?
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def index
    @posts = Post.limit(10).includes(:photos,:user).order('created_at DESC')    
  end

  private
  def post_params
    params.require(:post).permit(:caption,photos_attributes:[:image]).merge(user_id: current_user.id)    

# paramsとは送られてきたリクエスト情報をひとまとめにしたもの

# requireで受け取る値のキーを設定します。

# permitで変更を加えられるキーを指定します。今回の場合、captionキーとimageキーを指定しています。

# mergeメソッドは2つのハッシュを統合するメソッドです。今回は誰が投稿したかという情報が必要なためuser_idの情報を統合しています。
  end


end
