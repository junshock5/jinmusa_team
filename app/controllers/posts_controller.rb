class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :new, :destroy, :update, :destroy, :create,  :paging]

  # GET /posts
  # GET /posts.json
  def index
    uri    = URI.parse(request.url)   
    params2 = CGI.parse(uri.query)
    @searchText = params2['searchtext'].first;

    @categoryID = params2['CategoryID'].first;
    
    # ajax 서버에서 action에서 받고 post request 받아서 좌표를 추출 db에서 list js.erb에서 list를 
    
    
    
    sql = " SELECT * FROM   posts WHERE  CourtName like'#{@searchText}%'";
    # 확장성있게.. 어떻게 코드를 짤까...    
    if( @searchText != '' && @searchText !="SearchText.text")
       #@posts = Post.where(:CourtName => @searchText).paginate(page: params[:page], per_page:5);
        @posts =  Post.paginate_by_sql(sql,page: params[:page], per_page:5);
    else
      if( @categoryID != 0)    
          case @categoryID
          when '1' #최신순  
           @posts = Post.paginate(page: params[:page], per_page:5).order('Created DESC'); 
          when '2' #거리순
          # 현재 내위치와 지도들의 위치 차이들을 orderby 하면된다. index페이지에서 *현재 위치정보를 알아야 한다.
           @posts = Post.paginate(page: params[:page], per_page:5).order('Created DESC'); 
          when '3' #평점순
           @posts = Post.paginate(page: params[:page], per_page:5).order('Created DESC'); 
          else
           @posts = Post.paginate(page: params[:page], per_page:5); 
          end
      end
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
     @like = Like.find_by(post_id: params[:id])
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
    @post = Post.new(post_params);
    @post.Created = Time.now.getutc;
    #@post.UserId = current_user.id;
    

     # @post.user_id = user;
  
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
      params.require(:post).permit(:CourtCategoryId,:CourtName,:CountIntro,:CourtSubIntro,:Created,:Updated,:UserId,:ImageId,:TimeTableId,:file,:lat,:lng,:image,:file,:UserId)
    end
end