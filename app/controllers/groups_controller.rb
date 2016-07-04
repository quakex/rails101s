class GroupsController < ApplicationController

  before_action :authenticate_user!, only:[:new, :edit, :create, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
  end

  def new
    @group = Group.new
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end

  def create
    @group = current_user.groups.find(params[:id])

    if @group.save
      redirect_to groups_path
      flash[:notice] = "新增讨论版成功！"
    else
      render :new
    end
  end

  def update
    @group = current_user.groups.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path, notice:"修改讨论版成功"
    else
      render :edit
    end
  end

  def destroy
    @group = current_user.groups.find(params[:id])

    @group.destroy
    redirect_to groups_path, alert:"讨论版已经删除"
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end