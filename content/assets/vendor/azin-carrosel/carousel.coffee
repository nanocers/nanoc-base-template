class Deque
	constructor: (data_array) ->
		@ds = data_array
		@current = 0
	
	cur :-> @ds[@current]

	next:->
		@current = (@current + 1) % @ds.length
		@ds[@current]
	
	prev:->
		@current = (@current - 1 + @ds.length) % @ds.length
		@ds[@current]
	

class Carousel
	constructor: (@css_class, @next_elem_id, @prev_elem_id) ->

	run: ->
		elems = $("." + @css_class)
		elems.hide()
		$(elems[0]).show()
		@deque = new Deque(elems)
		
		$("#"+@next_elem_id).live 'click', (event) =>
			$(@deque.cur()).fadeOut("fast")
			$(@deque.next()).fadeIn("fast")
	
    $("#"+@prev_elem_id).live 'click', (event) =>
			$(@deque.cur()).fadeOut("fast")
			$(@deque.prev()).fadeIn("fast")

		0
