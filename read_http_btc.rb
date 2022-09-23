require 'json'
require 'csv'
require 'net/http'
require 'date'

archive_file = "btc_archive.csv"
endpoint = "https://api.coindesk.com/v1/bpi/currentprice.json"

def add_price(file_location, current_date, current_price)
    CSV.open(file_location, "a") do |f|
        f << [current_date, current_price]
    end
end

def extract_data(content)
    data = JSON.parse(content)

    current_date = Date.parse(data["time"]["updated"]).strftime("%Y-%m-%d")
    current_price = data["bpi"]["USD"]["rate_float"]

    return {current_date: current_date, current_price: current_price}
end

uri = URI(endpoint)

response = Net::HTTP.get_response(uri)

if response.code.to_s == "200"
    content = response.body
    result = extract_data(content)

    current_date = result[:current_date]
    current_price = result[:current_price]

    add_price(archive_file, current_date, current_price)
else
    puts "Something went wrong!"
end

puts "Done!"