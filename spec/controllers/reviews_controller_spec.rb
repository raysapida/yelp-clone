require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:restaurant) { create(:restaurant) }
  let(:user) { create(:user) }
  let(:review) { create(:review) }

  let(:valid_attributes) {
    { rating: 1,
      restaurant_id: restaurant,
      user_id: user,
      comment: "comment string"}
  }

  let(:invalid_attributes) {
    { rating: nil,
      comment: nil}
  }

  let(:valid_session) { {} }

  describe "GET #new" do
    it "assigns a new review as @review" do
      sign_in :user, user
      get :new, { restaurant_id: restaurant}, valid_session
      expect(assigns(:review)).to be_a_new(Review)
    end
  end

  describe "GET #edit" do
    it "assigns the requested review as @review" do
      sign_in :user, user
      review = create(:review, user: user)
      get :edit, {restaurant_id: review.restaurant, id: review}, valid_session
      expect(assigns(:review)).to eq(review)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before(:each) do
        sign_in :user, user
      end

      it "creates a new Review" do
        expect {
          post :create, {restaurant_id: restaurant, review: valid_attributes}, valid_session
        }.to change(Review, :count).by(1)
      end

      it "assigns a newly created review as @review" do
        post :create, {restaurant_id: restaurant, review: valid_attributes}, valid_session
        expect(assigns(:review)).to be_a(Review)
        expect(assigns(:review)).to be_persisted
      end

      it "redirects to the created review" do
        post :create, {restaurant_id: restaurant, review: valid_attributes}, valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      before(:each) do
        sign_in :user, user
      end

      it "assigns a newly created but unsaved review as @review" do
        post :create, {restaurant_id: restaurant, review: invalid_attributes}, valid_session
        expect(assigns(:review)).to be_a_new(Review)
      end

      it "re-renders the 'new' template" do
        post :create, {restaurant_id: restaurant, review: invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {rating: 5}
      }

      it "updates the requested review" do
        review = create(:review)
        sign_in :user, review.user
        put :update, {:id => review.to_param, :review => new_attributes, restaurant_id: restaurant }, valid_session
        review.reload
        expect(review.rating).to eq(5)
      end

      it "assigns the requested review as @review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => valid_attributes}, valid_session
        expect(assigns(:review)).to eq(review)
      end

      it "redirects to the review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => valid_attributes}, valid_session
        expect(response).to redirect_to(review)
      end
    end

    context "with invalid params" do
      it "assigns the review as @review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => invalid_attributes}, valid_session
        expect(assigns(:review)).to eq(review)
      end

      it "re-renders the 'edit' template" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested review" do
      review = Review.create! valid_attributes
      expect {
        delete :destroy, {:id => review.to_param}, valid_session
      }.to change(Review, :count).by(-1)
    end

    it "redirects to the reviews list" do
      review = Review.create! valid_attributes
      delete :destroy, {:id => review.to_param}, valid_session
      expect(response).to redirect_to(reviews_url)
    end
  end

end
