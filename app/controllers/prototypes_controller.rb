class PrototypesController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]
  before_action :move_to_index, only: [:edit, :update]
  
  
  def was_attached?
    self.prototype.attached?
  end
  
  def index
    @prototypes = Prototype.includes(:user)
   
  end

  def new
    @prototype = Prototype.new
  end

  def create
   
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render new_prototype_path
    end
  end

  def destroy
    prototype = Prototype.find(prototype_params)
    if @prototype.destroy
      redirect_to root_path
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
    end
    end
  

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end

  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototypes
    @prototype = Prototypes.find(params[:id])
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to action: :index
    end

    def comment_params
      params.require(:comment).permit(:content)
  end
  end
end
