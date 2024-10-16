json.id order.id
json.user_id order.user_id
# json.products order.products
# json.carted_products order.carted_products
json.subtotal order.subtotal
json.tax order.tax
json.total order.total
json.order_datetime order.created_at
json.carted_products order.carted_products.each do |cp|
  json.id cp.id
  json.quantity cp.quantity
  json.product cp.product
end