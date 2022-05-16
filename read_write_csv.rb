require 'csv'

file_location = "sample.csv"
sample_content = File.read file_location

sample_data = CSV.parse(sample_content, headers: true) #CSV.read can also be used so you don't need the file handler variable

sample_data.each do |d|
    # Note: As we've parsed with headers, we can reference the columns by name as each row is a hash
    puts "Date: #{d["date"]}, Price: #{d["price"]}"
end

# Write to CSV as raw string
new_data = [
    ["date", "price"],
    ["2020-01-01", "5400.00"],
    ["2020-01-02", "5800.00"],
    ["2020-01-03", "4300.00"]
]

# Convert the array of arrays into a string in the CSV format
new_content = new_data.map { |d| d.join(",") }
                      .join("\n")

# Note: This doesn't put a blank line at the end, which could cause issues if we append more data
File.write(file_location, new_content)

# Write to CSV directly as a CSV with c as a reference to the file
CSV.open(file_location, "w") do |c|
    c << ["date", "price"]
    c << ["2020-01-01", "5400.00"]
    c << ["2020-01-02", "5800.00"]
    c << ["2020-01-03", "4300.00"]
end

# Write to CSV by creating a content variable first and then writing that to a file
new_content2 = CSV.generate do |c|
    c << ["date", "price"]
    c << ["2020-01-01", "5400.00"]
    c << ["2020-01-02", "5800.00"]
    c << ["2020-01-03", "4300.00"]
end

File.write(file_location, new_content2)

def add_price(file_location, current_date, current_price)
    CSV.open(file_location, "a") do |c|
        c << [current_date,current_price]
    end
end

add_price(file_location, "2020-01-04", 4400.00)
add_price(file_location, "2020-01-05", 5100.00)