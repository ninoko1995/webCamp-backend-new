# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
book = ["村上海賊の娘","昨夜のカレー、明日のパン","島はぼくらと","さようなら、オレンジ","とっぴんぱらりの風太郎","教場","ランチのアッコちゃん","想像ラジオ","聖なる怠け者の冒険","去年の冬、きみと別れ","海賊とよばれた男","64","楽園のカンヴァス","きみはいい子","ふくわらい","晴天の迷いクジラ","ソロモンの偽証","世界から猫が消えたなら","百年法","屍者の帝国","舟を編む","ジェノサイド","ピエタ","くちびるに歌を","人質の朗読会","ユリゴコロ","誰かが足りない","ビブリア古書堂の事件手帖―栞子さんと奇妙な客人たち","偉大なる、しゅららぼん","プリズム","謎解きはディナーのあとで","ふがいない僕は空を見た","ペンギン・ハイウェイ","錨を上げよ","シューマンの指","叫びと祈り","悪の教典","神様のカルテ2","キケン","ストーリー・セラー","天地明察","神様のカルテ","横道世之介","神去なあなあ日常","猫を抱いて象と泳ぐ","ヘヴン","船に乗れ!","植物図鑑","新参者","1Q84","告白","のぼうの城","ジョーカー・ゲーム","テンペスト","ボックス!","新世界より","出星前夜","悼む人","流星の絆","モダンタイムス","ゴールデンスランバー","サクリファイス","有頂天家族","悪人","映画篇","八日目の蝉","赤朽葉家の伝説","鹿男あをによし","私の男","カシオペアの丘で","一瞬の風になれ","夜は短し歩けよ乙女","風が強く吹いている","終末のフール","図書館戦争","鴨川ホルモー","ミーナの行進","陰日向に咲く","失われた町","名もなき毒","東京タワー ～オカンとボクと、時々、オトン～","サウスバウンド","死神の精度","容疑者Xの献身","その日のまえに","ナラタージュ","告白","ベルカ、吠えないのか?","県庁の星","さくら","夜のピクニック","明日の記憶","家守綺譚","袋小路の男","チルドレン","対岸の彼女","犯人に告ぐ","黄金旅風","私が語りはじめた彼は","そのときは彼によろしく","博士の愛した数式","クライマーズ・ハイ","アヒルと鴨のコインロッカー","永遠の出口","重力ピエロ","4TEEN","デッドエンドの思い出","終戦のローレライ","陰摩羅鬼の瑕","ららら科學の子"]
bookType =[
	'現代小説','推理小説','歴史・時代小説','映画原作','エッセイ','評論','ファンタジー','SF','ホラー','ライトノベル','海外文学','児童文学','詩歌','古典'
]

type_num = bookType.length

type_num.times do |i|
	Type.create!(
		category: bookType[i]
		)
end

book_num = book.length
puts book_num
user_num = 100

(user_num-1).times do |i|
	User.create!(
		name:"ユーザーその#{i+1}",
		email: "user@#{i+1}",
		password: "#{i}#{i}#{i}#{i}#{i}#{i}",
		introduction: "週に#{i+1}冊は本読んでます！よろしくお願いします！"
	 )
	if i%3 == 2
		@user = User.find(i+1)
		@user.update(locked: true)
	end
end

puts 'finish users'

User.create!(
	name:'nino',
	email: 'ninoko1995@yahoo.co.jp',
	password: 'ninoninomiyamiya1995',
	introduction: '作成者アカウントです',
	locked: true
	)

puts 'finish administrator'

book_num.times do |i|
	Book.create!(
		user_id: rand(1..user_num),
		title: book[i],
		body: "第#{(i-i%10)/10+1}回目の本屋大賞で#{(i%10)+1}位とっただけあって、読みごたえがある！",
		valuation: rand(1..5)
	)
end

puts 'books'

user_num.times do |i|
	follow = rand(1..user_num)
	follow.times do |t|
		if i != t
			Relationship.create(
				follower_id: i+1,
				followed_id: (i + 3*t)%user_num+1,
				accepted: true
				)
		end
	end
end

puts 'finish follow'

user_num.times do |t|
	fav = rand(1..book_num)
	fav.times do |i|
		Favorite.create!(
			book_id: (t+i*3)%book_num+1,
			user_id: t+1
			)
	end
end

puts 'finish Favorite'