json.tracking_points @tracking_points do |tracking_point|
  json.partial! 'tracking_point', tracking_point: tracking_point
end