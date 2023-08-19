class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
								# except: [:index, :new, :create]	

    def index
        @articles = Article.all
    end

    def show

	# Redirect non existent post to the home page
	rescue ActiveRecord::RecordNotFound
		redirect_to root_path 
	end

    def new
       # nos permite guardar nueva información en la variable desde new.html.erb
       @article = Article.new
    end

	def create
		#basicly recover the data inside the form widget
		@article = Article.new(article_params)
		
		# if data was not saved correctly, allow them to try again
		if @article.save
			redirect_to @article
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		# if you remove the set_blog_post then uncomment following
		#@article = Article.find(params[:id])
	end
	
    def update
		#@blog_post = BlogPost.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit, status: unprocessable_entity
		end
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end

	private

	def article_params
		# basicly parse the data that is entered in the form
		params.require(:article).permit(:title, :status)	
	end
    def set_article
		@article = Article.find(params[:id])

		rescue ActiveRecord::RecordNotFound
			redirect_to root_path 
	end

end
