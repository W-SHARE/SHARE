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
        overall: params[:overall],
        free_review: params[:free_review]
      )
      #保存された時の処理
      if @review.save
        @course = Course.find_by(id: params[:course_id]) 
        @course.average_difficulity = ReviewCourse.where(course_id: params[:course_id]).all.sum(:difficulity)/(ReviewCourse.where(course_id: params[:course_id]).count-ReviewCourse.where(course_id: params[:course_id], difficulity: nil).count).to_f
        @course.average_fun = ReviewCourse.where(course_id: params[:course_id]).all.sum(:fun)/(ReviewCourse.where(course_id: params[:course_id]).count-ReviewCourse.where(course_id: params[:course_id], fun: nil).count).to_f
        @course.pass_rate = (ReviewCourse.where(course_id: params[:course_id]).count-ReviewCourse.where(course_id: params[:course_id], grade: 0).count)/ReviewCourse.where(course_id: params[:course_id]).count.to_f*100
        #　対応する授業に関するレビュー総数を算出して代入
        @course.number_of_reviews = ReviewCourse.where(course_id: params[:course_id]).count
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
