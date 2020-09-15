class LikesController < ApplicationController
  before_action :authenticate_user!
  # :authenticate_user!...サインイン済のユーザーにのみアクセス許可を与える

  def create
    @like = current_user.likes.build(like_params)
    # build...親モデルに属する子モデルのインスタンスを新たに生成したい場合に使うメソッド。
    @post = @like.post
    if @like.save
    respond_to :js
    # いいねを押したら、リアルタイムでビューをjsで表示するようにする（respond_to）
    end
  end

  def destroy
    @like = Like.find_by(id:params[:id])
    @post = @like.post
    if @like.destroy
      respond_to :js
    end
  end

  private
  def like_params
    params.permit(:post_id)
  end
end

# permitで変更を加えられるキーを指定します。

