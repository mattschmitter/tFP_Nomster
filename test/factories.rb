FactoryGirl.define do
	factory :place do
		name "Test Place Name"
		address "123 Test St., Test TS"
		description "A great place"
		association :user
	end

	factory :user do
		sequence :email do |n|
			"email#{n}@email.com"
		end
		password "pswrd12345678"
		password_confirmation "pswrd12345678"

	end

	factory :comment do
		message "Great comment"
		rating "five stars"
		association :place
	end

end
