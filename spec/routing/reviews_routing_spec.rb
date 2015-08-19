require "rails_helper"

RSpec.describe ReviewsController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      # new_restaurant_review GET /restaurants/:restaurant_id/reviews/new(.:format)      reviews#new
      expect(:get => "/restaurants/1/reviews/new").to route_to(controller: "reviews", action: "new", restaurant_id: "1")
    end

    it "routes to #edit" do
      # edit_restaurant_review GET /restaurants/:restaurant_id/reviews/:id/edit(.:format) reviews#edit
      expect(:get => "/restaurants/1/reviews/1/edit").to route_to(controller: "reviews", action: "edit", restaurant_id: "1", id: "1")
    end

    it "routes to #create" do
      # restaurant_reviews POST   /restaurants/:restaurant_id/reviews(.:format) reviews#create
      expect(:post => "/restaurants/1/reviews").to route_to(controller: "reviews", action: "create", restaurant_id: "1")
    end

    it "routes to #update" do
      # restaurant_review PATCH /restaurants/:restaurant_id/reviews/:id(.:format)      reviews#update
      expect(:put => "/restaurants/1/reviews/1").to route_to(controller: "reviews", action: "update", restaurant_id: "1", id: "1")
    end

    it "routes to #destroy" do
      # DELETE /restaurants/:restaurant_id/reviews/:id(.:format)      reviews#destroy
      expect(:delete => "/restaurants/1/reviews/1").to route_to(controller: "reviews", action: "destroy", restaurant_id: "1", id: "1")
    end

  end
end
