class ArticlesController < ApplicationController

	# Create the new page (articles/new)
	def new
		@article = Article.new
	end

	# Add button functionality (article/create)
	def create

		# Create instance variable with article params in private method
		@article = Article.new(article_params)

		# Check is article was succesfully created (validations in models/article.rb)
		if @article.save
			flash[:notice] = "Article was succesfully created"
			redirect_to article_path (@article)

		# If validations not completed...
		else
			render 'new'
		end
		
	end

	def show
		@article = Article.find(params[:id])
	end


	private

	def article_params
		params.require(:article).permit(:title, :description)
	end

end

