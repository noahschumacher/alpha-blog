class ArticlesController < ApplicationController

	# Create the new page (articles/new)
	def new
		@article = Article.new
	end

	# Add button functionality (article/create)
	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		@article.save
		redirect_to articles_show(@article)
	end

	private
	def article_params
		params.require(:article).permit(:title, :description)
	end
	
end

