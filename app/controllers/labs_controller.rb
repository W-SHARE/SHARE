class LabsController < ApplicationController
  before_action :authenticate_user

  #　各研究室のページを表示するための関数
  def show
    #　対応する研究室の情報を代入
    @lab = Lab.find_by(id: params[:lab_id])
    #　対応する研究室のレビュー情報を代入
    @reviews=ReviewLab.where(lab_id: params[:lab_id]).all.order(created_at: :desc)
    #　難しさ、面白さのの平均値を代入
    @average_of_difficulity = ReviewLab.where(lab_id: params[:lab_id]).all.sum(:difficulity)/(ReviewLab.where(lab_id: params[:lab_id]).count-ReviewLab.where(lab_id: params[:lab_id], difficulity: nil).count).to_f
    @average_of_fun = ReviewLab.where(lab_id: params[:lab_id]).all.sum(:fun)/(ReviewLab.where(lab_id: params[:lab_id]).count-ReviewLab.where(lab_id: params[:lab_id],fun: nil).count).to_f
    #　レビュー総数を代入
    @number_of_reviews = ReviewLab.where(lab_id: params[:lab_id]).count
  end

#　研究室一覧ページを表示するための関数
  def index
    #　全研究室の情報を取得
    @labs = Lab.all
  end
  
end