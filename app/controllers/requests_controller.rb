class RequestsController < ApplicationController
  before_action :authenticate_user

  #　ご要望を入力するページを表示するための関数
  def new
    #　これがないと動かないので @request を用意
    @request = Request.new
  end

  #　入力された内容をrequestsデータベースに格納する関数
  def create
    #　対応する行を新規作成し、入力された内容をカラムに代入
    @request = Request.new(
      user_name: params[:user_name],
      email: params[:email],
      content: params[:content]
    )
    #　バリデーションとうに引っかからずに保存された場合の処理
    if @request.save
      #トップページにリダイレクト
      redirect_to("/")
      #一時的なメッセージを表示
      flash[:notice]="送信が完了しました"
    else
      #保存に失敗したら入力を継続させるために入力ページに戻す
      render("requests/new")
    end
  end
end
