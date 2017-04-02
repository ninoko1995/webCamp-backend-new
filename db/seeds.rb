# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
	User.create!(
		name:"ユーザーその#{i}",
		email: "user@#{i}",
		password: "#{i}#{i}#{i}#{i}#{i}#{i}",
		introduction: "週に#{i}冊は本読んでます！よろしくお願いします！"
		if t%5 == 2
			locked: true
		end
	 )

end

User.create!(
	name:'nino',
	email: 'ninoko1995@yahoo.co.jp',
	password: 'ninoninomiyamiya1995',
	introduction: '作成者アカウントです'
	)


1000.times do |i|
	Book.create!(
		user_id: rand(1..20),
		title: "人生で#{i}番目に読んだ本"	,
		body: "読むの#{i*10}回目だけど、楽しい！！"
	)
end

20.times do |i|
	20.times do |t|
		if i != t
			Relationship.create!(
				follower_id: i+1,
				followed_id: t+1,
				accepted: true
				)
		end
	end
end

20.times do |t|
	fav = rand(1..100)
	fav.times do |i|
		Favorite.create!(
			book_id: t+i*9+1,
			user_id: t+1
			)
	end
end