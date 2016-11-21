json.id saleproduct.id
json.product do
  json.partial! 'api/v1/products/product', product: saleproduct.product
end
json.quantity saleproduct.quantity
json.rate saleproduct.rate