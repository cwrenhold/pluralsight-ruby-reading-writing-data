require 'csv'
require 'json'
require 'net/http'

file_location = "sample.txt"

# Verbose method, going through file pointer
# file = File.open file_location
# content = file.read

# Concise method, read directly from the file to a variable
sample_content = File.read file_location

puts sample_content

new_content = "Ruby is awesome! "

# Overwrite the whole file with the new content
File.write(file_location, new_content)

# Append the new content to the file
File.write(file_location, new_content, mode: "a")

# Append to a file using an anonymous function
File.open(file_location, "a") do |file|
    file.write new_content
end