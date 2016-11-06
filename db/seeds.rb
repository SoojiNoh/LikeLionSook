# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create([{ email: 'thensj@hanmail.net', encrypted_password:"123123", nickname: "apple"},
{ email: 'thensj@gmail.com', encrypted_password:"123123", nickname: "banana"},
{ email: 'thensj@naver.com', encrypted_password:"123123", nickname: "coconut"},
{ email: 'thensj@sookmyung.ac.kr', encrypted_password:"123123", nickname: "durian"}])