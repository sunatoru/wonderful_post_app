# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tags = %w(成功体験 挑戦 失敗)
tags.each { |tag| Tag.find_or_create_by!(name: tag) }

3.times do |n|
  n += 1
  user = User.find_or_create_by!(email: "user00#{n}@test.com") do |userq|
    userq.password = 'test1234'
  end


  50.times do |a|
    a += 1
    user.articles.find_or_create_by!(title: "No.#{a}: user00#{a}の記事") do |article|
      article.content = "No.#{n}: user00#{n}の記事の本文"
        article.tag_ids = Tag.all.pluck(:id)
    end
  end
end

# 3.times do |n|
#   user.create(

#   )
# end
