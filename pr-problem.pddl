(define
	(problem grounded-GROUNDED-HARD1)
	(:domain grounded-GROUNDED-STRIPS-SLIDING-TILE)
	(:init
		(= (total-cost) 0)
		( BLANK_P1_P1 )
		( AT_T1_P2_P1 )
		( AT_T2_P3_P1 )
		( AT_T3_P1_P2 )
		( AT_T4_P2_P2 )
		( AT_T5_P3_P2 )
		( AT_T6_P1_P3 )
		( AT_T7_P2_P3 )
		( AT_T8_P3_P3 )
	)
	(:goal
		(and 
		( AT_T3_P1_P1 )
		( AT_T1_P2_P1 )
		( AT_T2_P3_P1 )
		( AT_T4_P1_P2 )
		( AT_T7_P2_P2 )
		( AT_T5_P3_P2 )
		( AT_T6_P2_P3 )
		( AT_T8_P3_P3 )
		)
	)
	(:metric minimize (total-cost))

)
