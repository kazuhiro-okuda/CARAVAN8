class ReviewsController < ApplicationController

  def top
  end

  def show
  	  @review = Review.find(params[:id])
  end

  def index
  	  @reviews = Review.all
  	  @review = Review.new
  end

  def create
  	  review = Review.new(review_params)
  	  if review.save
  	     flash[:notice] = "Successfully registrated!"
  	     redirect_to edit_review_path(review.id)
  	  else
  	  	 render :action => "index"
  	  end
  end

  def edit
  	  @review = Review.find(params[:id])
  end

  def update
  	  review = Review.find(params[:id])
      if review.update(review_params)
         flash[:notice] = "Update successfully!"
         redirect_to review_path(review.id)
      else
      	 flash[:notice] = "Update failed"
      	 render :action => "edit"
      end
  end

 def destroy
 	 review = Review.find(params[:id])
     if review.destroy
     	flash[:notice] = "Destroy successfully!"
        redirect_to reviews_path
     else
     	flash[:notice] = "Destroy failed"
     	render :action => "index"
     end
 end

  private

  def review_params
  	  params.require(:review).permit(:title, :body)
  end

end


# 厳密には、上の処理の後にrenderメソッドを呼び出している