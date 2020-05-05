class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :update, :destroy, :create, :new, :paging]
  

  # GET /posts
  # GET /posts.json
  def index
    uri    = URI.parse(request.url)   
    params2 = CGI.parse(uri.query)
    @searchText = params2['searchtext'].first

    @categoryID = params2['searchtext'].second
    
    if( @searchText != '')
      @posts = Post.where(:CourtName => @searchText).paginate(page: params[:page], per_page:5)
    else
      @posts = Post.paginate(page: params[:page], per_page:5)
         
    end


# paginate in Active Record now returns a Relation
#Post.where(:published => true).paginate(:page => params[:page]).order('id DESC')

# the new, shorter page() method
#Post.order('created_at DESC').page(params[:page])



  end
  
  def paging
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  
  # GET /posts/show
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
     @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
  
    @post.UserId = current_user.id
    
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

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
     @post = Post.find(params[:id])
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

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
     @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def result
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
          @post = Post.find(params[:id])
    end
    
    
    def is_number?(obj)
        obj.to_s == obj.to_i.to_s
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:CourtCategoryId,:CourtName,:CountIntro,:CourtSubIntro,:Created,:Updated,:UserId,:ImageId,:TimeTableId,:file,:lat,:lng,:image,:file)
    end
end
