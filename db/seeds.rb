# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Hello World!"

create_account = User.create([email: 'example@gmail.com', password: '12345678', password_confirmation: '12345678', name: '测试用帐号'])

create_groups = for i in 1..20 do
  Group.create!([title:"Group no.#{i}", description: "这是用种子建立的第 #{i} 个讨论版", user_id:"1"])
  GroupUser.create(group_id:i, user_id: 1)
  for k in 1..30 do 
    Post.create!([group_id: "#{i}", content: "这是用种子建立的第 #{k} 个留言", user_id: "1"])
  end
end
