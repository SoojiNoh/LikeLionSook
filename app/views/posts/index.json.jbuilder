json.array!(@events) do |event|
  json.extract! event, :id, :title, :content
end


