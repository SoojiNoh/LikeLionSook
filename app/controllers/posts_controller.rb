class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    
def index
    @posts = Post.all
end

def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
end

def new
    @post = Post.new
end

def show
end

def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
end


def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
end

def friend_request
  @stranger = User.find(params[:id])
  current_user.friend_request(@stranger)
  redirect_to '/'
end

def cancel_request
  @stranger = User.find(params[:id])
  @stranger.requested_friends.delete(current_user)
  redirect_to '/'
end
  
def accept_request
  @stranger = User.find(params[:id])
  current_user.accept_request(@stranger)
  redirect_to '/'
end

def decline_request
  @stranger = User.find(params[:id])
  current_user.decline_request(@stranger)
  redirect_to '/'
end

def remove_friend
  @friend = User.find(params[:id])
  current_user.remove_friend(@friend)
  redirect_to '/'
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end


end
