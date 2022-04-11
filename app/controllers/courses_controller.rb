class CoursesController < ApplicationController
  before_action :authenticate_user

# 各授業ページを表示するための関数  
  def show
    #　対応する授業の情報を @course に代入
    @course = Course.find_by(id: params[:course_id])
    #　対応する授業のレビューを @reviews に代入
    @reviews=ReviewCourse.where(course_id: params[:course_id]).all.order(created_at: :desc)
    #　授業難易度の平均値
    @average_of_difficulity_sum = ReviewCourse.where(course_id: params[:course_id]).all.sum(:difficulity)
    @average_of_difficulity_num = ReviewCourse.where(course_id: params[:course_id]).count
    @average_of_difficulity_blank = ReviewCourse.where(course_id: params[:course_id], difficulity: nil).count
    @average_of_difficulity = @average_of_difficulity_sum / (@average_of_difficulity_num - @average_of_difficulity_blank).to_f
    
    # 授業の面白さの平均値
    @average_of_fun_sum = ReviewCourse.where(course_id: params[:course_id]).all.sum(:fun)
    @average_of_fun_num = ReviewCourse.where(course_id: params[:course_id]).count
    @average_of_fun_blank = ReviewCourse.where(course_id: params[:course_id], fun: nil).count
    @average_of_fun = @average_of_fun_sum/(@average_of_fun_num - @average_of_fun_blank).to_f
    

    #　単位取得率の計算
    @pass_rate_num = ReviewCourse.where(course_id: params[:course_id]).count
    @pass_rate_fail = ReviewCourse.where(course_id: params[:course_id], grade: 0).count
    @pass_rate_blank = ReviewCourse.where(course_id: params[:course_id], grade: nil).count
    @pass_rate = (@pass_rate_num - @pass_rate_fail - @pass_rate_blank)/(@pass_rate_num - @pass_rate_blank).to_f*100

    #　対応する授業に関するレビュー総数を算出して代入
    @number_of_reviews = ReviewCourse.where(course_id: params[:course_id]).count

    # 総合評価の計算
    @average_overall_sum = ReviewCourse.where(course_id: params[:course_id]).all.sum(:overall)
    @average_overall_num = ReviewCourse.where(course_id: params[:course_id]).count
    @average_overall_blank = ReviewCourse.where(course_id: params[:course_id], overall: nil).count
    @average_overall = @average_overall_sum/(@average_overall_num - @average_overall_blank).to_f

  end

  #　授業一覧ページを表示するための関数
  def index
    #　全授業の情報を取得して代入
    @courses = Course.all
  end
end
