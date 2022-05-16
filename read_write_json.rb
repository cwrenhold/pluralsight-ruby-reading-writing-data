require 'json'
require 'date'

# load loads a file or a string, JSON.parse only accepts a string
# content = '{"id": 1, "firstName": "Leah", "lastName": "Organa"}'
# data = JSON.load content

sample_content = File.read("sample.json")
sample_data = JSON.parse(sample_content)

puts "ID: #{sample_data['id']}"
puts "First Name: #{sample_data['firstName']}"
puts "Last Name: #{sample_data['lastName']}"

def extract_data(content)
    data = JSON.parse(content)

    current_date = Date.parse(data["time"]["updated"]).strftime("%Y-%m-%d")
    current_price = data["bpi"]["USD"]["rate_float"]

    return {current_date: current_date, current_price: current_price}
end

file_location = "demos.json"
content = File.read file_location

result = extract_data(content)
puts "Date: #{result[:current_date]}, price: #{result[:current_price]}"

hash = {
    id: 1,
    firstName: "Leah",
    lastName: "Organa"
}

puts hash.to_json
puts JSON.dump(hash)
puts JSON.pretty_generate(hash)