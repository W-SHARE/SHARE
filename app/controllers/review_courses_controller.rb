class ReviewCoursesController < ApplicationController
  before_action :authenticate_user

  #対応授業をレビューする画面を表示するための関数
    def new
      #エラーメッセージを表示させるために取得
        @review = ReviewCourse.new
        #授業名を表示させるために授業の情報を取得
        @course = Course.find_by(id: params[:course_id])
    end
    
    #データベースに保存するための関数
    def create
      #行を新規作成し、入力値をカラムに代入
      @review = ReviewCourse.new(
        user_name: params[:user_name],
        course_id: params[:course_id],
        difficulity: params[:difficulity],
        fun: params[:fun],
        grade: params[:grade],
        attendance: params[:attendance],
      free_review: params[:free_review]
      )
    
      #保存された時の処理
      if @review.save
        #授業詳細ページにリダイレクト
        redirect_to("/courses/#{params[:course_id]}")
        #一時的なメッセージを表示
        flash[:notice] = "評価が投稿されました"

        #保存できなかった時の処理
      else
        #入力ページに戻す
        @course = Course.find_by(id: params[:course_id])
        render("review_courses/new")
      end
    end  
end
