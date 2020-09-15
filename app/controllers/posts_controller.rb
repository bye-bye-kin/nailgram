class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post,only: %i(show destroy)

  def new
    @post = Post.new
    @post.photos.build
    # Postモデルでaccepts_nested_attributes_forを描いたのでphotosも一緒に保存する
    # https://qiita.com/suzy1031/items/289333d3e440fc470d7e
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
    # ORMとActive Recordについて
    # https://qiita.com/okamoto_ryo/items/54d6a3b5d879aeee5b39
  end

  def show
  end

  def destroy
    if @post.user == current_user
      flash[:notice] = "投稿が削除されました" if @post.destroy
      else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to root_path
  end

  # def destroy
  #   if @post.user == current_user
  #     flash[:notice] = "投稿が削除されました" if @post.destroy
  #   else
  #     flash[:alert] = "投稿の削除に失敗しました"
  #   end
  #   redirect_to root_path
  # end

  private
  def post_params
    params.require(:post).permit(:caption,photos_attributes:[:image]).merge(user_id: current_user.id)    

# paramsとは送られてきたリクエスト情報をひとまとめにしたもの

# requireで受け取る値のキーを設定します。

# permitで変更を加えられるキーを指定します。今回の場合、captionキーとimageキーを指定しています。

# mergeメソッドは2つのハッシュを統合するメソッドです。今回は誰が投稿したかという情報が必要なためuser_idの情報を統合しています。
  end

  def set_post
    @post = Post.find_by(id:params[:id])
    
  end

end
