json.purposes @purposes do |purpose|
  json.partial! 'purpose', purpose: purpose
end