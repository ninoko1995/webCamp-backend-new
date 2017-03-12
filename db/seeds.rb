# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
	name:'aa',
	email: 'a@a',
	password: 'aaaaaa',
	introduction: '管理者アカウントです'
	)


20.times do |i|
	User.create!(
		name:"#{i}#{i}",
		email: "#{i}@#{i}",
		password: "#{i}#{i}#{i}#{i}#{i}#{i}",
		introduction: "週に#{i}冊は本読んでます！よろしくお願いします！"
	 )
end

1000.times do |i|
	Book.create!(
		user_id: rand(1..20),
		title: "#{i}番目の投稿"	,
		body: "読むの#{i}回目だけど、楽しい！！"
	)
end

20.times do |i|
	20.times do |t|
		if i != t
			Relationship.create!(
				follower_id: i+1,
				followed_id: t+1
				)
		end
	end
end

20.times do |t|
	100.times do |i|
		Favorite.create!(
			book_id: (i+t+1)*6,
			user_id: t+1
			)
	end
end