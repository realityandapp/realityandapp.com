json.array!(@links) do |link|
  json.extract! link, :id, :name, :url, :is_follow
  json.url link_url(link, format: :json)
end
