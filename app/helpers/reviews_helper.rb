module ReviewsHelper
    
  def review_average(reviews)
    reviews.length > 0 ? reviews.inject(0) {|sum, r| sum + r.rank}.to_f / reviews.length : 0
  end
    
end
