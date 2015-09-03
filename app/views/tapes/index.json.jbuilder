json.array!(@tapes) do |tape|
  json.extract! tape, :id, :title, :friend, :note
  json.url tape_url(tape, format: :json)
end
