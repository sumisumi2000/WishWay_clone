# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

20.times do |n|
  User.create!(
    name: "テストユーザー_#{n + 1}",
    email: "test_#{n + 1}@example.com",
    password: "test",
    password_confirmation: "test"
    )
end

User.all.each do |user|
  user.create_wish_list!(title: "#{user.name}のバケットリスト")
end

WishList.all.each do |wish_list|
  10.times do |n|
    next if [true, false].sample
    granted = [true, false].sample
    wish_list.wishes.create!(title: "#{(1..10).to_a.sample}_やりたいこと", granted: granted)
  end
end
