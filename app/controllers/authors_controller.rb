class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end
  def create
    @author = Author.new(params.require(:author).permit(:first_name, :last_name, :date_of_birth))
    if @author.save
      redirect_to "/author/showAll"
    else
      render "/"
    end
  end
  def showAll
    @authors = Author.all
  end
  def edit
    @author = Author.find(params[:id])
  end
  def update
    @author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:first_name, :last_name, :date_of_birth))
      redirect_to "/author/showAll"
    else
      render "/author/edit"
    end
  end
  def delete
    @author = Author.find(params[:id])
    if @author.destroy
      redirect_to "/author/showAll"
    else
      redirect_to "/"
    end
  end
  def authors
    author = Author.find(params[:id])
    render json: author.to_json(include: :books)
  end
end
