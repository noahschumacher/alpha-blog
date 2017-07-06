class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end


	# Create the new page (articles/new)
	def new
		@article = Article.new
	end


	# This is the edit page
	def edit
		# Finds the article based on the id parameter in the table
		@article = Article.find(params[:id])
	end


	# Add update functionality for (article/edit)
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			flash[:notice] = 'Article was successfully updated'
			redirect_to article_path(@article)
		else
			render 'edit'
		end
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


	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Article was succesfully deleted"
		redirect_to article_path
	end


	private

	def article_params
		params.require(:article).permit(:title, :description)
	end

end

