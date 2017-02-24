require 'rails_helper'

describe Review, type: :model do
  it "is invalid if the rating is more than 5" do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end

  before do
    @user1 = User.create(email: "test@example.com", password: "test123", password_confirmation: "test123")
    @user2 = User.create(email: "test2@example.com", password: "test123", password_confirmation: "test123")
end

  it "A user can only leave one review per restaurant" do
    @restaurant = Restaurant.create(name: "Moe's Tavern", user_id: @user1.id)
    Review.create(thoughts: "so so", rating: 2, restaurant_id: @restaurant.id, user_id: @user2.id)
    food = Review.new(thoughts: "so so", rating: 2, restaurant_id: @restaurant.id, user_id: @user2.id)

    expect(food).to have(1).error_on(:user_id)


    end

end
