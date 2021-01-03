class ActivesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @actives = Active.all
  end

  def show
    @active =Active.find(params[:id])
  end

  def new
    @active = Active.new
  end

  def create
    @active = Active.new(active_params)
    @active.user_id = current_user.id
    if @active.save
      redirect_to active_path(@active), notice: '投稿しました。'
    else
      render :new
    end  
  end

  def edit
    @active = Active.find(params[:id])
    if @active.user != current_user
      redirect_to actives_path, alert: '不正なアクセスです。'
    end 
  end

  def update
    @active = Active.find(params[:id])
    if @active.update(active_params)
      redirect_to active_path(@active), notice: '更新しました。'
    else
      render :new
    end  
  end

  def destroy
    active = Active.find(params[:id])
    active.destroy
    redirect_to actives_path
  end

  private 
  def active_params
    params.require(:active).permit(:title, :body, :image)
  end
end
