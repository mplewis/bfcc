json.id poll.id
json.text poll.text
json.choices poll.choices do |c|
  json.text c.text
  json.votes c.answers.count
end
