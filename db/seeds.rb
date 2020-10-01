# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'

ItemCart.destroy_all
ItemCategory.destroy_all
ItemOrder.destroy_all
Cart.destroy_all
Category.destroy_all
Order.destroy_all
Item.destroy_all
User.destroy_all

giphy_response =
  RestClient::Request.execute(
    method: :get,
    url:
      "https://api.giphy.com/v1/gifs/trending?api_key=#{
        ENV['GIPHY_API_KEY']
      }&limit=50&rating=pg-13",
    headers: { 'Content-Type': 'application/json', Accept: 'application/json' }
  )

giphy_json = JSON.parse(giphy_response)
giphy_json['data'].each do |gif|
  Item.create(
    title: gif['title'],
    image: gif['images']['fixed_width']['url'],
    price: rand.round(2)
  )
end

puts Item.all.length
