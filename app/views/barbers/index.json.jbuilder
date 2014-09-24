json.array!(@barber) do |b|
	json.zipcode	b.zipcode
	json.first_name b.first_name
	json.last_name  b.last_name
	json.avatar     b.avatar
end