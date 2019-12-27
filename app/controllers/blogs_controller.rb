class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy] 
#  PER = 10
   

  def index
#     @blogs = Blog.order(:last_blog).page(params[:page])
    if params[:blog] && params[:blog][:search]
      if params[:blog][:title] == "" && params[:blog][:status] == "" 
        redirect_to blogs_path
      elsif params[:blog][:title].present? && params[:blog][:status].present?
#         @blogs = Blog.title_search(params[:blog][:title]).status_search(params[:blog][:status]).page(params[:page])
        @blogs = Blog.page(params[:page]).search_title(params[:blog][:title]).search_status(params[:blog][:status]).per(3)
        @blogs = Blog.page(params[:page]).search_title(params[:blog][:title]).search_status(params[:blog][:status]).per(3)
      elsif params[:blog][:title].present?
#         @blogs = Blog.title_search(params[:blog][:title]).page(params[:page])
        @blogs = Blog.page(params[:page]).search_title(params[:blog][:title]).per(3)
      elsif params[:blog][:status].present?
#         @blogs = Blog.status_search(params[:blog][:status]).page(params[:page])
#          @blogs = Blog.search_status(params[:status]).page(params[:page]).per(PER)
         @blogs =Blog.page(params[:page]).search_status(params[:blog][:status]).per(3)
       end
    elsif params[:sort_expired]
       @blogs = Blog.all.sort_deadline.page(params[:page]).per(3)
    elsif params[:sort_priority]
      @blogs = Blog.order('priority DESC').page(params[:page]).per(3)
    else
      @blogs = Blog.all.order('created_at DESC').page(params[:page]).per(3)
#       @blogs = Kaminari.paginate_array(@blogs).page(params[:page]).per(PER)
#       @blogs = Blog.order(:last_name).page(params[:page])
    end
  end

  def new
#     @blogs = Blog.new
    @blogs.user_id = current_user.id
  end
  
  def create
#    @blogs = current_user.blogs.build(blog_params)
    @blogs = Blog.new(blog_params)
     @blog.user_id = current_user.id
    if @blogs.save

      redirect_to blogs_path
      flash[:success] = 'Blog Created'
    else
      render 'new'
    end
  end
  
 
  def show
   @blogs = Blog.find(params[:id])
  end
  
  def edit
     @blogs = Blog.find(params[:id])
  end
    
  def update
    @blogs = Blog.find(params[:id])
    if @blogs.update(blog_params)
      redirect_to blogs_path, Notice: "You have edited this blog！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, Notice: "You have deleted the blog!"
  end
  
  private

   def blog_params
    params.require(:blog).permit(:title,:content,:deadline,:status,:priority)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
end  

