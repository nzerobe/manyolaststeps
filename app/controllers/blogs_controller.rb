class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy] 
 PER = 9
   
  def index 
#    byebug
    if params[:sort_expired] 
#     @blogs = Blog.all.sort_deadline.page(params[:page]).per(PER)   
     @blogs = Blog.page(params[:page]).per(PER).order('deadline ASC')
    elsif
#     @blogs = Blog.order('created_at DESC')  
    @blogs = Blog.page(params[:page]).per(PER).order('created_at DESC')
    
    elsif params[:title] && params[:status].present?
      @blogs = Blog.search_title(params[:title]).search_status(params[:status]).page(params[:page]).per(PER)
    elsif params[:status].present?
      @blogs = Blog.search_status(params[:status]).page(params[:page]).per(PER)
       elsif params[:sort_priority].present?
      @blogs = Blog.sort_priority.page(params[:page]).per(PER)
     else params[:title].present?
      @blogs = Blog.search_title(params[:title]).page(params[:page]).per(PER)
     
    end
    
    
  end 
  

  def new
    @blogs = Blog.new
  end
  
  def create
   
    @blogs = Blog.new(blog_params)
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
     params.require(:blog).permit(:title, :content,  :deadline, :expired_at, :status, :priority,)
   end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
end  

