(define
	(domain grounded-GROUNDED-STRIPS-SLIDING-TILE)
	(:requirements :strips :action-costs)
	(:predicates
		( BLANK_P2_P1 )
		( AT_T1_P1_P1 )
		( BLANK_P1_P2 )
		( AT_T3_P1_P1 )
		( BLANK_P3_P1 )
		( AT_T2_P2_P1 )
		( AT_T3_P2_P1 )
		( BLANK_P2_P2 )
		( AT_T4_P2_P1 )
		( BLANK_P1_P3 )
		( AT_T6_P1_P2 )
		( BLANK_P2_P3 )
		( AT_T7_P2_P2 )
		( AT_T1_P1_P2 )
		( AT_T1_P2_P2 )
		( AT_T4_P1_P2 )
		( AT_T1_P3_P1 )
		( AT_T3_P3_P1 )
		( AT_T4_P3_P1 )
		( BLANK_P3_P2 )
		( AT_T5_P3_P1 )
		( BLANK_P3_P3 )
		( AT_T8_P3_P2 )
		( AT_T1_P1_P3 )
		( AT_T1_P2_P3 )
		( AT_T3_P1_P3 )
		( AT_T4_P1_P3 )
		( AT_T4_P2_P3 )
		( AT_T5_P3_P3 )
		( AT_T2_P2_P2 )
		( AT_T2_P3_P2 )
		( AT_T3_P2_P2 )
		( AT_T2_P1_P1 )
		( AT_T4_P1_P1 )
		( AT_T7_P1_P2 )
		( AT_T7_P1_P3 )
		( AT_T5_P2_P2 )
		( AT_T8_P2_P3 )
		( AT_T6_P2_P2 )
		( AT_T6_P2_P3 )
		( AT_T6_P1_P1 )
		( AT_T7_P2_P1 )
		( AT_T1_P3_P2 )
		( AT_T3_P3_P2 )
		( AT_T4_P3_P2 )
		( AT_T2_P1_P2 )
		( AT_T5_P2_P1 )
		( AT_T5_P2_P3 )
		( AT_T8_P2_P2 )
		( AT_T1_P3_P3 )
		( AT_T4_P3_P3 )
		( AT_T6_P3_P2 )
		( AT_T6_P3_P3 )
		( AT_T7_P3_P1 )
		( AT_T7_P3_P2 )
		( AT_T7_P3_P3 )
		( AT_T3_P2_P3 )
		( AT_T6_P2_P1 )
		( AT_T7_P1_P1 )
		( AT_T8_P2_P1 )
		( AT_T8_P3_P1 )
		( AT_T2_P1_P3 )
		( AT_T2_P2_P3 )
		( AT_T2_P3_P3 )
		( AT_T5_P1_P2 )
		( AT_T8_P1_P3 )
		( AT_T6_P3_P1 )
		( AT_T3_P3_P3 )
		( AT_T5_P1_P1 )
		( AT_T5_P1_P3 )
		( AT_T8_P1_P1 )
		( AT_T8_P1_P2 )
		( BLANK_P1_P1 )
		( AT_T7_P2_P3 )
		( AT_T4_P2_P2 )
		( AT_T6_P1_P3 )
		( AT_T3_P1_P2 )
		( AT_T8_P3_P3 )
		( AT_T5_P3_P2 )
		( AT_T2_P3_P1 )
		( AT_T1_P2_P1 )
	) 
	(:functions (total-cost))
	(:action MOVE-UP_T8_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T8_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T8_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T8_P1_P1 ))
		)
	)
	(:action MOVE-UP_T5_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T5_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T5_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T5_P1_P1 ))
		)
	)
	(:action MOVE-UP_T8_P1_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T8_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T8_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T8_P1_P2 ))
		)
	)
	(:action MOVE-DOWN_T3_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T3_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T3_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T3_P3_P3 ))
		)
	)
	(:action MOVE-UP_T5_P1_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T5_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T5_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T5_P1_P2 ))
		)
	)
	(:action MOVE-DOWN_T8_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T8_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T8_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T8_P1_P3 ))
		)
	)
	(:action MOVE-DOWN_T5_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T5_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T5_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T5_P1_P3 ))
		)
	)
	(:action MOVE-DOWN_T2_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T2_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T2_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T2_P3_P3 ))
		)
	)
	(:action MOVE-DOWN_T2_P2_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T2_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T2_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T2_P2_P3 ))
		)
	)
	(:action MOVE-DOWN_T2_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T2_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T2_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T2_P1_P3 ))
		)
	)
	(:action MOVE-DOWN_T8_P1_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T8_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T8_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T8_P1_P2 ))
		)
	)
	(:action MOVE-DOWN_T5_P1_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T5_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T5_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T5_P1_P2 ))
		)
	)
	(:action MOVE-LEFT_T8_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T8_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T8_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T8_P1_P3 ))
		)
	)
	(:action MOVE-LEFT_T8_P1_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T8_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T8_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T8_P1_P2 ))
		)
	)
	(:action MOVE-LEFT_T8_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T8_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T8_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T8_P1_P1 ))
		)
	)
	(:action MOVE-LEFT_T7_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T7_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T7_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T7_P1_P1 ))
		)
	)
	(:action MOVE-LEFT_T5_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T5_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T5_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T5_P1_P3 ))
		)
	)
	(:action MOVE-LEFT_T5_P1_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T5_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T5_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T5_P1_P2 ))
		)
	)
	(:action MOVE-LEFT_T5_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T5_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T5_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T5_P1_P1 ))
		)
	)
	(:action MOVE-LEFT_T2_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T2_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T2_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T2_P1_P3 ))
		)
	)
	(:action MOVE-LEFT_T8_P2_P1_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T8_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T8_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T8_P2_P1 ))
		)
	)
	(:action MOVE-LEFT_T6_P2_P1_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T6_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T6_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T6_P2_P1 ))
		)
	)
	(:action MOVE-LEFT_T3_P2_P3_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T3_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T3_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T3_P2_P3 ))
		)
	)
	(:action MOVE-LEFT_T2_P2_P3_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T2_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T2_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T2_P2_P3 ))
		)
	)
	(:action MOVE-RIGHT_T8_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T8_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T8_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T8_P3_P1 ))
		)
	)
	(:action MOVE-RIGHT_T7_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T7_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T7_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T7_P3_P3 ))
		)
	)
	(:action MOVE-RIGHT_T7_P3_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T7_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T7_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T7_P3_P2 ))
		)
	)
	(:action MOVE-RIGHT_T7_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T7_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T7_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T7_P3_P1 ))
		)
	)
	(:action MOVE-RIGHT_T6_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T6_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T6_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T6_P3_P3 ))
		)
	)
	(:action MOVE-RIGHT_T6_P3_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T6_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T6_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T6_P3_P2 ))
		)
	)
	(:action MOVE-RIGHT_T6_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T6_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T6_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T6_P3_P1 ))
		)
	)
	(:action MOVE-RIGHT_T4_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T4_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T4_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T4_P3_P3 ))
		)
	)
	(:action MOVE-RIGHT_T3_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T3_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T3_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T3_P3_P3 ))
		)
	)
	(:action MOVE-RIGHT_T2_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T2_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T2_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T2_P3_P3 ))
		)
	)
	(:action MOVE-RIGHT_T1_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T1_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T1_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T1_P3_P3 ))
		)
	)
	(:action MOVE-RIGHT_T8_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T8_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T8_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T8_P2_P2 ))
		)
	)
	(:action MOVE-RIGHT_T8_P2_P1_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T8_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T8_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T8_P2_P1 ))
		)
	)
	(:action MOVE-RIGHT_T5_P2_P3_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T5_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T5_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T5_P2_P3 ))
		)
	)
	(:action MOVE-RIGHT_T5_P2_P1_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T5_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T5_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T5_P2_P1 ))
		)
	)
	(:action MOVE-RIGHT_T3_P2_P3_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T3_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T3_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T3_P2_P3 ))
		)
	)
	(:action MOVE-RIGHT_T2_P2_P3_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T2_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T2_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T2_P2_P3 ))
		)
	)
	(:action MOVE-UP_T8_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T8_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T8_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T8_P3_P1 ))
		)
	)
	(:action MOVE-UP_T8_P2_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T8_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T8_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T8_P2_P1 ))
		)
	)
	(:action MOVE-UP_T7_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T7_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T7_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T7_P3_P1 ))
		)
	)
	(:action MOVE-UP_T6_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T6_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T6_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T6_P3_P1 ))
		)
	)
	(:action MOVE-UP_T5_P2_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T5_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T5_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T5_P2_P1 ))
		)
	)
	(:action MOVE-UP_T8_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T8_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T8_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T8_P2_P2 ))
		)
	)
	(:action MOVE-UP_T7_P3_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T7_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T7_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T7_P3_P2 ))
		)
	)
	(:action MOVE-UP_T6_P3_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T6_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T6_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T6_P3_P2 ))
		)
	)
	(:action MOVE-UP_T4_P3_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T4_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T4_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T4_P3_P2 ))
		)
	)
	(:action MOVE-UP_T3_P3_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T3_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T3_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T3_P3_P2 ))
		)
	)
	(:action MOVE-UP_T1_P3_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T1_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T1_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T1_P3_P2 ))
		)
	)
	(:action MOVE-DOWN_T7_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T7_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T7_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T7_P3_P3 ))
		)
	)
	(:action MOVE-DOWN_T6_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T6_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T6_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T6_P3_P3 ))
		)
	)
	(:action MOVE-DOWN_T4_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T4_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T4_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T4_P3_P3 ))
		)
	)
	(:action MOVE-DOWN_T1_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T1_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T1_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T1_P3_P3 ))
		)
	)
	(:action MOVE-DOWN_T7_P3_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T7_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T7_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T7_P3_P2 ))
		)
	)
	(:action MOVE-DOWN_T6_P3_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T6_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T6_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T6_P3_P2 ))
		)
	)
	(:action MOVE-DOWN_T4_P3_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T4_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T4_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T4_P3_P2 ))
		)
	)
	(:action MOVE-DOWN_T3_P3_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T3_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T3_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T3_P3_P2 ))
		)
	)
	(:action MOVE-DOWN_T1_P3_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T1_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T1_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T1_P3_P2 ))
		)
	)
	(:action MOVE-LEFT_T6_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T6_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T6_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T6_P1_P1 ))
		)
	)
	(:action MOVE-RIGHT_T8_P2_P3_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T8_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T8_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T8_P2_P3 ))
		)
	)
	(:action MOVE-RIGHT_T7_P2_P1_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T7_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T7_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T7_P2_P1 ))
		)
	)
	(:action MOVE-RIGHT_T6_P2_P3_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T6_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T6_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T6_P2_P3 ))
		)
	)
	(:action MOVE-RIGHT_T6_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T6_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T6_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T6_P2_P2 ))
		)
	)
	(:action MOVE-RIGHT_T6_P2_P1_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T6_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T6_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T6_P2_P1 ))
		)
	)
	(:action MOVE-RIGHT_T5_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T5_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T5_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T5_P2_P2 ))
		)
	)
	(:action MOVE-UP_T7_P2_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T7_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T7_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T7_P2_P1 ))
		)
	)
	(:action MOVE-UP_T7_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T7_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T7_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T7_P1_P1 ))
		)
	)
	(:action MOVE-UP_T6_P2_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T6_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T6_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T6_P2_P1 ))
		)
	)
	(:action MOVE-UP_T6_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T6_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T6_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T6_P1_P1 ))
		)
	)
	(:action MOVE-UP_T4_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T4_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T4_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T4_P1_P1 ))
		)
	)
	(:action MOVE-UP_T2_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T2_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T2_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T2_P1_P1 ))
		)
	)
	(:action MOVE-UP_T7_P1_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T7_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T7_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T7_P1_P2 ))
		)
	)
	(:action MOVE-UP_T6_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T6_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T6_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T6_P2_P2 ))
		)
	)
	(:action MOVE-UP_T5_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T5_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T5_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T5_P2_P2 ))
		)
	)
	(:action MOVE-UP_T3_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T3_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T3_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T3_P2_P2 ))
		)
	)
	(:action MOVE-UP_T2_P3_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T2_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T2_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T2_P3_P2 ))
		)
	)
	(:action MOVE-UP_T2_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T2_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T2_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T2_P2_P2 ))
		)
	)
	(:action MOVE-UP_T2_P1_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T2_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T2_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T2_P1_P2 ))
		)
	)
	(:action MOVE-DOWN_T8_P2_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T8_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T8_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T8_P2_P3 ))
		)
	)
	(:action MOVE-DOWN_T7_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T7_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T7_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T7_P1_P3 ))
		)
	)
	(:action MOVE-DOWN_T6_P2_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T6_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T6_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T6_P2_P3 ))
		)
	)
	(:action MOVE-DOWN_T5_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T5_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T5_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T5_P3_P3 ))
		)
	)
	(:action MOVE-DOWN_T5_P2_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T5_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T5_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T5_P2_P3 ))
		)
	)
	(:action MOVE-DOWN_T4_P2_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T4_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T4_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T4_P2_P3 ))
		)
	)
	(:action MOVE-DOWN_T4_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T4_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T4_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T4_P1_P3 ))
		)
	)
	(:action MOVE-DOWN_T3_P2_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T3_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T3_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T3_P2_P3 ))
		)
	)
	(:action MOVE-DOWN_T3_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T3_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T3_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T3_P1_P3 ))
		)
	)
	(:action MOVE-DOWN_T1_P2_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T1_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T1_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T1_P2_P3 ))
		)
	)
	(:action MOVE-DOWN_T1_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T1_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T1_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T1_P1_P3 ))
		)
	)
	(:action MOVE-DOWN_T8_P3_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T8_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T8_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T8_P3_P2 ))
		)
	)
	(:action MOVE-DOWN_T8_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T8_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T8_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T8_P2_P2 ))
		)
	)
	(:action MOVE-DOWN_T7_P1_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T7_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T7_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T7_P1_P2 ))
		)
	)
	(:action MOVE-DOWN_T6_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T6_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T6_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T6_P2_P2 ))
		)
	)
	(:action MOVE-DOWN_T5_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T5_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T5_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T5_P2_P2 ))
		)
	)
	(:action MOVE-DOWN_T3_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T3_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T3_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T3_P2_P2 ))
		)
	)
	(:action MOVE-DOWN_T2_P3_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T2_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T2_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T2_P3_P2 ))
		)
	)
	(:action MOVE-DOWN_T2_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T2_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T2_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T2_P2_P2 ))
		)
	)
	(:action MOVE-DOWN_T2_P1_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T2_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T2_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T2_P1_P2 ))
		)
	)
	(:action MOVE-LEFT_T7_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T7_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T7_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T7_P1_P3 ))
		)
	)
	(:action MOVE-LEFT_T7_P1_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T7_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T7_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T7_P1_P2 ))
		)
	)
	(:action MOVE-LEFT_T4_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T4_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T4_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T4_P1_P3 ))
		)
	)
	(:action MOVE-LEFT_T3_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T3_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T3_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T3_P1_P3 ))
		)
	)
	(:action MOVE-LEFT_T2_P1_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T2_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T2_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T2_P1_P2 ))
		)
	)
	(:action MOVE-LEFT_T2_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T2_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T2_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T2_P1_P1 ))
		)
	)
	(:action MOVE-LEFT_T1_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T1_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T1_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T1_P1_P3 ))
		)
	)
	(:action MOVE-LEFT_T8_P2_P3_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T8_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T8_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T8_P2_P3 ))
		)
	)
	(:action MOVE-LEFT_T8_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T8_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T8_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T8_P2_P2 ))
		)
	)
	(:action MOVE-LEFT_T7_P2_P3_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T7_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T7_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T7_P2_P3 ))
		)
	)
	(:action MOVE-LEFT_T7_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T7_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T7_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T7_P2_P2 ))
		)
	)
	(:action MOVE-LEFT_T7_P2_P1_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T7_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T7_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T7_P2_P1 ))
		)
	)
	(:action MOVE-LEFT_T6_P2_P3_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T6_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T6_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T6_P2_P3 ))
		)
	)
	(:action MOVE-LEFT_T6_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T6_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T6_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T6_P2_P2 ))
		)
	)
	(:action MOVE-LEFT_T5_P2_P3_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T5_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T5_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T5_P2_P3 ))
		)
	)
	(:action MOVE-LEFT_T5_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T5_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T5_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T5_P2_P2 ))
		)
	)
	(:action MOVE-LEFT_T5_P2_P1_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T5_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T5_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T5_P2_P1 ))
		)
	)
	(:action MOVE-LEFT_T4_P2_P3_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T4_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T4_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T4_P2_P3 ))
		)
	)
	(:action MOVE-LEFT_T4_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T4_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T4_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T4_P2_P2 ))
		)
	)
	(:action MOVE-LEFT_T3_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T3_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T3_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T3_P2_P2 ))
		)
	)
	(:action MOVE-LEFT_T2_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T2_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T2_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T2_P2_P2 ))
		)
	)
	(:action MOVE-LEFT_T1_P2_P3_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T1_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T1_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T1_P2_P3 ))
		)
	)
	(:action MOVE-LEFT_T1_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T1_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T1_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T1_P2_P2 ))
		)
	)
	(:action MOVE-RIGHT_T8_P3_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T8_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T8_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T8_P3_P2 ))
		)
	)
	(:action MOVE-RIGHT_T5_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T5_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T5_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T5_P3_P3 ))
		)
	)
	(:action MOVE-RIGHT_T5_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T5_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T5_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T5_P3_P1 ))
		)
	)
	(:action MOVE-RIGHT_T4_P3_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T4_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T4_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T4_P3_P2 ))
		)
	)
	(:action MOVE-RIGHT_T4_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T4_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T4_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T4_P3_P1 ))
		)
	)
	(:action MOVE-RIGHT_T3_P3_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T3_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T3_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T3_P3_P2 ))
		)
	)
	(:action MOVE-RIGHT_T3_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T3_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T3_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T3_P3_P1 ))
		)
	)
	(:action MOVE-RIGHT_T2_P3_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T2_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T2_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T2_P3_P2 ))
		)
	)
	(:action MOVE-RIGHT_T1_P3_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T1_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T1_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T1_P3_P2 ))
		)
	)
	(:action MOVE-RIGHT_T1_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T1_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T1_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T1_P3_P1 ))
		)
	)
	(:action MOVE-RIGHT_T4_P2_P3_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T4_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T4_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T4_P2_P3 ))
		)
	)
	(:action MOVE-RIGHT_T2_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T2_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T2_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T2_P2_P2 ))
		)
	)
	(:action MOVE-RIGHT_T1_P2_P3_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T1_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T1_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T1_P2_P3 ))
		)
	)
	(:action MOVE-UP_T5_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T5_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T5_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T5_P3_P1 ))
		)
	)
	(:action MOVE-UP_T4_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T4_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T4_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T4_P3_P1 ))
		)
	)
	(:action MOVE-UP_T3_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T3_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T3_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T3_P3_P1 ))
		)
	)
	(:action MOVE-UP_T1_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T1_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T1_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T1_P3_P1 ))
		)
	)
	(:action MOVE-UP_T8_P3_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T8_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T8_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T8_P3_P2 ))
		)
	)
	(:action MOVE-DOWN_T7_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T7_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T7_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T7_P2_P2 ))
		)
	)
	(:action MOVE-DOWN_T6_P1_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T6_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T6_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T6_P1_P2 ))
		)
	)
	(:action MOVE-DOWN_T4_P1_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T4_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T4_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T4_P1_P2 ))
		)
	)
	(:action MOVE-DOWN_T1_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T1_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T1_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T1_P2_P2 ))
		)
	)
	(:action MOVE-DOWN_T1_P1_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T1_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T1_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T1_P1_P2 ))
		)
	)
	(:action MOVE-LEFT_T6_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T6_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T6_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T6_P1_P3 ))
		)
	)
	(:action MOVE-LEFT_T6_P1_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T6_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T6_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T6_P1_P2 ))
		)
	)
	(:action MOVE-LEFT_T4_P1_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T4_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T4_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T4_P1_P2 ))
		)
	)
	(:action MOVE-LEFT_T4_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T4_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T4_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T4_P1_P1 ))
		)
	)
	(:action MOVE-LEFT_T3_P1_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T3_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T3_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T3_P1_P2 ))
		)
	)
	(:action MOVE-LEFT_T1_P1_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T1_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T1_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T1_P1_P2 ))
		)
	)
	(:action MOVE-RIGHT_T8_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T8_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T8_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T8_P3_P3 ))
		)
	)
	(:action MOVE-RIGHT_T5_P3_P2_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T5_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T5_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T5_P3_P2 ))
		)
	)
	(:action MOVE-RIGHT_T7_P2_P3_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T7_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T7_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T7_P2_P3 ))
		)
	)
	(:action MOVE-RIGHT_T7_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T7_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T7_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T7_P2_P2 ))
		)
	)
	(:action MOVE-RIGHT_T4_P2_P1_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T4_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T4_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T4_P2_P1 ))
		)
	)
	(:action MOVE-RIGHT_T3_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T3_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T3_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T3_P2_P2 ))
		)
	)
	(:action MOVE-RIGHT_T3_P2_P1_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T3_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T3_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T3_P2_P1 ))
		)
	)
	(:action MOVE-RIGHT_T2_P2_P1_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T2_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T2_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T2_P2_P1 ))
		)
	)
	(:action MOVE-RIGHT_T1_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T1_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T1_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T1_P2_P2 ))
		)
	)
	(:action MOVE-UP_T4_P2_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T4_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T4_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T4_P2_P1 ))
		)
	)
	(:action MOVE-UP_T3_P2_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T3_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T3_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T3_P2_P1 ))
		)
	)
	(:action MOVE-UP_T2_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T2_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T2_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T2_P3_P1 ))
		)
	)
	(:action MOVE-UP_T2_P2_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T2_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T2_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T2_P2_P1 ))
		)
	)
	(:action MOVE-UP_T7_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T7_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T7_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T7_P2_P2 ))
		)
	)
	(:action MOVE-UP_T6_P1_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T6_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T6_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T6_P1_P2 ))
		)
	)
	(:action MOVE-UP_T5_P3_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P3 )
			( AT_T5_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T5_P3_P3 )
			(not ( BLANK_P3_P3 ))
			(not ( AT_T5_P3_P2 ))
		)
	)
	(:action MOVE-UP_T4_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T4_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T4_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T4_P2_P2 ))
		)
	)
	(:action MOVE-UP_T4_P1_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T4_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T4_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T4_P1_P2 ))
		)
	)
	(:action MOVE-UP_T3_P1_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T3_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T3_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T3_P1_P2 ))
		)
	)
	(:action MOVE-UP_T1_P2_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P3 )
			( AT_T1_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T1_P2_P3 )
			(not ( BLANK_P2_P3 ))
			(not ( AT_T1_P2_P2 ))
		)
	)
	(:action MOVE-UP_T1_P1_P2_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P3 )
			( AT_T1_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T1_P1_P3 )
			(not ( BLANK_P1_P3 ))
			(not ( AT_T1_P1_P2 ))
		)
	)
	(:action MOVE-DOWN_T8_P3_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P2 )
			( AT_T8_P3_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P3 )
			( AT_T8_P3_P2 )
			(not ( BLANK_P3_P2 ))
			(not ( AT_T8_P3_P3 ))
		)
	)
	(:action MOVE-DOWN_T5_P3_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T5_P3_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P2 )
			( AT_T5_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T5_P3_P2 ))
		)
	)
	(:action MOVE-LEFT_T4_P2_P1_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T4_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T4_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T4_P2_P1 ))
		)
	)
	(:action MOVE-LEFT_T3_P2_P1_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T3_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T3_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T3_P2_P1 ))
		)
	)
	(:action MOVE-LEFT_T2_P2_P1_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T2_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T2_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T2_P2_P1 ))
		)
	)
	(:action MOVE-LEFT_T1_P2_P1_P3
		:parameters ()
		:precondition
		(and
			( BLANK_P3_P1 )
			( AT_T1_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T1_P3_P1 )
			(not ( BLANK_P3_P1 ))
			(not ( AT_T1_P2_P1 ))
		)
	)
	(:action MOVE-RIGHT_T4_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T4_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T4_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T4_P2_P2 ))
		)
	)
	(:action MOVE-UP_T3_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T3_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T3_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T3_P1_P1 ))
		)
	)
	(:action MOVE-UP_T1_P2_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T1_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T1_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T1_P2_P1 ))
		)
	)
	(:action MOVE-UP_T1_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T1_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T1_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T1_P1_P1 ))
		)
	)
	(:action MOVE-DOWN_T7_P2_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P2 )
			( AT_T7_P2_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P3 )
			( AT_T7_P2_P2 )
			(not ( BLANK_P2_P2 ))
			(not ( AT_T7_P2_P3 ))
		)
	)
	(:action MOVE-DOWN_T6_P1_P3_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P2 )
			( AT_T6_P1_P3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P3 )
			( AT_T6_P1_P2 )
			(not ( BLANK_P1_P2 ))
			(not ( AT_T6_P1_P3 ))
		)
	)
	(:action MOVE-DOWN_T4_P2_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T4_P2_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P2 )
			( AT_T4_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T4_P2_P2 ))
		)
	)
	(:action MOVE-LEFT_T3_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T3_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T3_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T3_P1_P1 ))
		)
	)
	(:action MOVE-LEFT_T1_P1_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T1_P1_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P1 )
			( AT_T1_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T1_P1_P1 ))
		)
	)
	(:action MOVE-RIGHT_T2_P3_P1_P2
		:parameters ()
		:precondition
		(and
			( BLANK_P2_P1 )
			( AT_T2_P3_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P3_P1 )
			( AT_T2_P2_P1 )
			(not ( BLANK_P2_P1 ))
			(not ( AT_T2_P3_P1 ))
		)
	)
	(:action MOVE-DOWN_T3_P1_P2_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T3_P1_P2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P1_P2 )
			( AT_T3_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T3_P1_P2 ))
		)
	)
	(:action MOVE-RIGHT_T1_P2_P1_P1
		:parameters ()
		:precondition
		(and
			( BLANK_P1_P1 )
			( AT_T1_P2_P1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( BLANK_P2_P1 )
			( AT_T1_P1_P1 )
			(not ( BLANK_P1_P1 ))
			(not ( AT_T1_P2_P1 ))
		)
	)

)
