json.array!(@haircut) do |h|
	json.id 		h.id
	json.title		h.review
	json.start		h.created_at
	json.end	    h.updated_at
end