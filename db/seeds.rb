# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |i|
	Book.create!(
		user_id: rand(1..2),
		title: "#{i}番目の投稿"	,
		body: "読むの#{i}回目だけど、楽しい！！"
	)
end