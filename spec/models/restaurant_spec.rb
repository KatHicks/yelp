require 'rails_helper'


describe Restaurant, type: :model do
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name:'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

    before do
      @user = User.create(email: "test@example.com", password: "test123", password_confirmation: "test123" )
    end

    it "is not valid unless it has a unique name" do
      @user = User.find_by_email("test@example.com")
      Restaurant.create(name: "Moe's Tavern", user_id: @user.id)
      restaurant = Restaurant.new(name: "Moe's Tavern", user_id: @user.id)
      expect(restaurant).to have(1).error_on(:name)
    end

end
