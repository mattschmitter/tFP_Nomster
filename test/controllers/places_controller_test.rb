require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
	
	test "index" do
		FactoryGirl.create(:place)
		get :index
		assert_response :success		
	end

	test "show found" do
		place = FactoryGirl.create(:place)
		get :show, :id => place.id
		assert_response :success
	end
	
	test "new not signed in" do
		get :new
		assert_redirected_to new_user_session_path
	end

	test "new" do
		user = FactoryGirl.create(:user)
		sign_in user
		get :new
		assert_response :success
	end

	test "create not signed in" do
		assert_no_difference "Place.count" do
			post :create, {:place => {
				:name => "yolo",
				:description => "omg",
				:latitude => 42.3631519,
				:longitude => -71.056098,
				}
			}
		end
		assert_redirected_to new_user_session_path
	end

	test "create" do 
		user = FactoryGirl.create(:user)
		sign_in user

		assert_difference "Place.count" do
			post :create, {:place => {
				:name => "yolo",
				:description => "omg",
				:address => "123 Test St, Test, TS 12345",
				:latitude => 42.3631519,
				:longitude => -71.056098,
				}
			}
		end
		assert_redirected_to root_path

		assert_equal 1, user.places.count
	end

	test "create invalid" do
		user = FactoryGirl.create(:user)
		sign_in user

		assert_no_difference "Place.count" do
			post :create, {:place => {
				:name => "",
				:description => "",
				:latitude => nil,
				:longitude => nil
				}
			}
		end

		assert_response :unprocessable_entity
	end

end
