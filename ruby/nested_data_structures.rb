dbc = {
	phase0: {
		name: "Phase 0",
		student_info: {
			enrolled: 90,
			passed: 90
		
	    },
		
		dates: {
			starting_date: 'MM/DD/YYYY',
			end_date: 'MM/DD/YYYY'
		},
         
        courses: []
    },
	
	phase1: {
		name: "Phase 1",
		
		student_info: {
			enrolled: 50,
			passed: 50
		
		},
		
		dates: {
			starting_date: 'MM/DD/YYYY' ,
			end_date: 'MM/DD/YYYY'
		},
         
        courses: []

	}
}
puts "number of student inrolled "
puts dbc[:phase0][:student_info][:enrolled]