class CoursesController < ApplicationController
  before_action :authenticate_user

# 各授業ページを表示するための関数  
  def show
    #　対応する授業の情報を @course に代入
    @course = Course.find_by(id: params[:course_id])
    #　対応する授業のレビューを @reviews に代入
    @reviews=ReviewCourse.where(course_id: params[:course_id]).all.order(created_at: :desc)
    #　授業難易度、面白さ　の平均値を算出して各々代入
    @average_of_difficulity = ReviewCourse.where(course_id: params[:course_id]).all.sum(:difficulity)/(ReviewCourse.where(course_id: params[:course_id]).count-ReviewCourse.where(course_id: params[:course_id], difficulity: nil).count).to_f
    @average_of_fun = ReviewCourse.where(course_id: params[:course_id]).all.sum(:fun)/(ReviewCourse.where(course_id: params[:course_id]).count-ReviewCourse.where(course_id: params[:course_id], fun: nil).count).to_f
    #　平均値を算出する際に、分母が0だった場合の例外処理
    if ReviewCourse.where(course_id: params[:course_id]).count != 0
      @pass_rate = (ReviewCourse.where(course_id: params[:course_id]).count-ReviewCourse.where(course_id: params[:course_id], grade: 0).count)/ReviewCourse.where(course_id: params[:course_id]).count.to_f*100
    else
      @pass_rate = -1
    end
    #　対応する授業に関するレビュー総数を算出して代入
    @number_of_reviews = ReviewCourse.where(course_id: params[:course_id]).count
  end

  #　授業一覧ページを表示するための関数
  def index
    #　全授業の情報を取得して代入
    @courses = Course.all
  end
end
