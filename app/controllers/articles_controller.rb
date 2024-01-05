class ArticlesController < ApplicationController

    def show
       @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.create(article_params)
        if @article.save
            flash[:notice] = "Article was created succesfully."
            redirect_to(@article) #(:action => 'show', id: article.id)
        else
            render "new", status: :unprocessable_entity
        end
    end
     
    private
     
    def article_params
        params.require(:article).permit(:id, :title, :description)
    end

end