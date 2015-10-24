FactoryGirl.define do
	factory :place do
		name "Test Place Name"
		address "123 Test St., Test TS"
		description "A great place"
		association :user
	end

	factory :user do
		email "email@email.com"
		password "12345678"
	end
end
