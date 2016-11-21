json.id activity.id
json.place do
  json.partial! 'api/v1/places/place', place: activity.place
end

json.activity_date activity.activity_date
json.start_time activity.start_time
json.comment activity.comment
json.purposes activity.purposes do |purpose|
  json.partial! 'api/v1/purposes/purpose', purpose: purpose
end
json.saleproducts activity.saleproducts do |saleproduct|
  json.partial! 'api/v1/activities/saleproduct', saleproduct: saleproduct
end
