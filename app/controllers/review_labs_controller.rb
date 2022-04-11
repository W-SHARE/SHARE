class ReviewLabsController < ApplicationController
  before_action :authenticate_user

  #研究室のレビューを入力するページを表示するための関数
  def new
    #エラーメッセージを表示するために定義
    @review = ReviewLab.new
    #研究室名を表示させるために定義
    @lab = Lab.find_by(id: params[:lab_id])
  end

  #データベースに値を保存するための関数
  def create
    #行を新規作成し、各値をカラムに保存
    @review = ReviewLab.new(
      user_name: params[:user_name],
      lab_id: params[:lab_id],
      difficulity: params[:difficulity],
      fun: params[:fun],
      core_time_start: params[:core_time_start],
      core_time_end: params[:core_time_end],
      free_review: params[:free_review]
    )

    #保存できた場合の処理
    if @review.save
      #研究室詳細ページにリダイレクト
      redirect_to("/labs/#{params[:lab_id]}")
      #一時的なメッセージを表示
      flash[:notice] = "評価が投稿されました"
    #保存できなかったときの処理
    else
      #入力するページに戻す
      @lab = Course.find_by(id: params[:lab_id])
      render("review_labs/new")
    end
  end
end
