class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Group.all
    @months = months
  end

  def show
    arr = Entity.all.order(created_at: :desc)
    @transactions = []
    group = Group.find(params[:id]).name
    arr.each do |entity|
      @transactions << entity if entity.groups.include?(group)
    end
    @months = months
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path
    else
      render :new, notice: 'please try again'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def months
    @months = {
      1 => 'Jan', 2 => 'Feb', 3 => 'Mar', 4 => 'Apr', 5 => 'May', 6 => 'Jun',
      7 => 'Jul', 8 => 'Aug', 9 => 'Sep', 10 => 'Oct', 11 => 'Nov', 12 => 'Dec'
    }
  end
end
