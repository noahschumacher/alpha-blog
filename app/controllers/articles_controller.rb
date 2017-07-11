class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :update, :show, :destroy]

	def index
		@articles = Article.all
	end


	# Create the new page (articles/new)
	def new
		@article = Article.new
	end


	# This is the edit page
	def edit
		
	end


	# Add update functionality for (article/edit)
	def update

		if @article.update(article_params)
			flash[:success] = 'Article was successfully updated'
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end


	# Add button functionality (article/create)
	def create

		# Create instance variable with article params in private method
		@article = Article.new(article_params)
		@article.user = User.first

		# Check is article was succesfully created (validations in models/article.rb)
		if @article.save
			flash[:success] = "Article was succesfully created"
			redirect_to article_path (@article)

		# If validations not completed...
		else
			render 'new'
		end	
	end


	def show

	end


	def destroy
		@article.destroy
		flash[:danger] = "Article was succesfully deleted"
		redirect_to articles_path
	end


	private

		def article_params
			params.require(:article).permit(:title, :description)
		end

		def set_article
			@article = Article.find(params[:id])
		end

end

