require 'json'

data = {
    records: []
}

1000000.times do
    data[:records] << { foo: "bar" }
end

content = JSON.pretty_generate(data)
File.write("large_json.json", content)