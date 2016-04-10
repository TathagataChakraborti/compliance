(define
	(domain grounded-BLOCKS)
	(:requirements :strips :action-costs)
	(:predicates
		( HOLDING_W )
		( HOLDING_O )
		( HOLDING_E )
		( ON_W_D )
		( ON_W_R )
		( ON_W_O )
		( ON_W_E )
		( ON_O_D )
		( ON_O_R )
		( ON_O_W )
		( ON_O_E )
		( ON_E_D )
		( ON_E_R )
		( ON_E_W )
		( ON_E_O )
		( HOLDING_D )
		( CLEAR_A )
		( HOLDING_R )
		( CLEAR_P )
		( HOLDING_A )
		( CLEAR_C )
		( HOLDING_P )
		( HOLDING_C )
		( ONTABLE_D )
		( ONTABLE_R )
		( ONTABLE_A )
		( ON_D_R )
		( ON_D_W )
		( ON_D_O )
		( ON_D_E )
		( ON_D_P )
		( ON_D_C )
		( ON_R_D )
		( ON_R_A )
		( ON_R_W )
		( ON_R_O )
		( ON_R_E )
		( ON_R_C )
		( ON_A_D )
		( ON_A_R )
		( ON_A_W )
		( ON_A_O )
		( ON_A_E )
		( ON_A_P )
		( ON_W_A )
		( ON_W_P )
		( ON_W_C )
		( ON_O_A )
		( ON_O_P )
		( ON_O_C )
		( ON_E_A )
		( ON_E_P )
		( ON_E_C )
		( ON_P_D )
		( ON_P_R )
		( ON_P_A )
		( ON_P_W )
		( ON_P_O )
		( ON_P_E )
		( ON_P_C )
		( ON_C_D )
		( ON_C_R )
		( ON_C_A )
		( ON_C_W )
		( ON_C_O )
		( ON_C_E )
		( ON_C_P )
		( HANDEMPTY )
		( CLEAR_R )
		( CLEAR_D )
		( CLEAR_E )
		( CLEAR_O )
		( CLEAR_W )
		( ONTABLE_C )
		( ONTABLE_P )
		( ON_A_C )
		( ON_R_P )
		( ON_D_A )
		( ONTABLE_E )
		( ONTABLE_O )
		( ONTABLE_W )
	) 
	(:functions (total-cost))
	(:action PICK-UP_A
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( ONTABLE_A )
			( CLEAR_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_A )
			(not ( ONTABLE_A ))
			(not ( CLEAR_A ))
			(not ( HANDEMPTY ))
		)
	)
	(:action PICK-UP_R
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( ONTABLE_R )
			( CLEAR_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_R )
			(not ( ONTABLE_R ))
			(not ( CLEAR_R ))
			(not ( HANDEMPTY ))
		)
	)
	(:action PICK-UP_D
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( ONTABLE_D )
			( CLEAR_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_D )
			(not ( ONTABLE_D ))
			(not ( CLEAR_D ))
			(not ( HANDEMPTY ))
		)
	)
	(:action UNSTACK_C_P
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_C )
			( ON_C_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_C )
			( CLEAR_P )
			(not ( CLEAR_C ))
			(not ( HANDEMPTY ))
			(not ( ON_C_P ))
		)
	)
	(:action UNSTACK_C_E
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_C )
			( ON_C_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_C )
			( CLEAR_E )
			(not ( CLEAR_C ))
			(not ( HANDEMPTY ))
			(not ( ON_C_E ))
		)
	)
	(:action UNSTACK_C_O
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_C )
			( ON_C_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_C )
			( CLEAR_O )
			(not ( CLEAR_C ))
			(not ( HANDEMPTY ))
			(not ( ON_C_O ))
		)
	)
	(:action UNSTACK_C_W
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_C )
			( ON_C_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_C )
			( CLEAR_W )
			(not ( CLEAR_C ))
			(not ( HANDEMPTY ))
			(not ( ON_C_W ))
		)
	)
	(:action UNSTACK_C_A
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_C )
			( ON_C_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_C )
			( CLEAR_A )
			(not ( CLEAR_C ))
			(not ( HANDEMPTY ))
			(not ( ON_C_A ))
		)
	)
	(:action UNSTACK_C_R
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_C )
			( ON_C_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_C )
			( CLEAR_R )
			(not ( CLEAR_C ))
			(not ( HANDEMPTY ))
			(not ( ON_C_R ))
		)
	)
	(:action UNSTACK_C_D
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_C )
			( ON_C_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_C )
			( CLEAR_D )
			(not ( CLEAR_C ))
			(not ( HANDEMPTY ))
			(not ( ON_C_D ))
		)
	)
	(:action UNSTACK_P_C
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_P )
			( ON_P_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_P )
			( CLEAR_C )
			(not ( CLEAR_P ))
			(not ( HANDEMPTY ))
			(not ( ON_P_C ))
		)
	)
	(:action UNSTACK_P_E
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_P )
			( ON_P_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_P )
			( CLEAR_E )
			(not ( CLEAR_P ))
			(not ( HANDEMPTY ))
			(not ( ON_P_E ))
		)
	)
	(:action UNSTACK_P_O
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_P )
			( ON_P_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_P )
			( CLEAR_O )
			(not ( CLEAR_P ))
			(not ( HANDEMPTY ))
			(not ( ON_P_O ))
		)
	)
	(:action UNSTACK_P_W
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_P )
			( ON_P_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_P )
			( CLEAR_W )
			(not ( CLEAR_P ))
			(not ( HANDEMPTY ))
			(not ( ON_P_W ))
		)
	)
	(:action UNSTACK_P_A
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_P )
			( ON_P_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_P )
			( CLEAR_A )
			(not ( CLEAR_P ))
			(not ( HANDEMPTY ))
			(not ( ON_P_A ))
		)
	)
	(:action UNSTACK_P_R
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_P )
			( ON_P_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_P )
			( CLEAR_R )
			(not ( CLEAR_P ))
			(not ( HANDEMPTY ))
			(not ( ON_P_R ))
		)
	)
	(:action UNSTACK_P_D
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_P )
			( ON_P_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_P )
			( CLEAR_D )
			(not ( CLEAR_P ))
			(not ( HANDEMPTY ))
			(not ( ON_P_D ))
		)
	)
	(:action UNSTACK_E_C
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_E )
			( ON_E_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_E )
			( CLEAR_C )
			(not ( CLEAR_E ))
			(not ( HANDEMPTY ))
			(not ( ON_E_C ))
		)
	)
	(:action UNSTACK_E_P
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_E )
			( ON_E_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_E )
			( CLEAR_P )
			(not ( CLEAR_E ))
			(not ( HANDEMPTY ))
			(not ( ON_E_P ))
		)
	)
	(:action UNSTACK_E_A
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_E )
			( ON_E_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_E )
			( CLEAR_A )
			(not ( CLEAR_E ))
			(not ( HANDEMPTY ))
			(not ( ON_E_A ))
		)
	)
	(:action UNSTACK_O_C
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_O )
			( ON_O_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_O )
			( CLEAR_C )
			(not ( CLEAR_O ))
			(not ( HANDEMPTY ))
			(not ( ON_O_C ))
		)
	)
	(:action UNSTACK_O_P
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_O )
			( ON_O_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_O )
			( CLEAR_P )
			(not ( CLEAR_O ))
			(not ( HANDEMPTY ))
			(not ( ON_O_P ))
		)
	)
	(:action UNSTACK_O_A
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_O )
			( ON_O_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_O )
			( CLEAR_A )
			(not ( CLEAR_O ))
			(not ( HANDEMPTY ))
			(not ( ON_O_A ))
		)
	)
	(:action UNSTACK_W_C
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_W )
			( ON_W_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_W )
			( CLEAR_C )
			(not ( CLEAR_W ))
			(not ( HANDEMPTY ))
			(not ( ON_W_C ))
		)
	)
	(:action UNSTACK_W_P
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_W )
			( ON_W_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_W )
			( CLEAR_P )
			(not ( CLEAR_W ))
			(not ( HANDEMPTY ))
			(not ( ON_W_P ))
		)
	)
	(:action UNSTACK_W_A
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_W )
			( ON_W_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_W )
			( CLEAR_A )
			(not ( CLEAR_W ))
			(not ( HANDEMPTY ))
			(not ( ON_W_A ))
		)
	)
	(:action UNSTACK_A_P
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_A )
			( ON_A_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_A )
			( CLEAR_P )
			(not ( CLEAR_A ))
			(not ( HANDEMPTY ))
			(not ( ON_A_P ))
		)
	)
	(:action UNSTACK_A_E
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_A )
			( ON_A_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_A )
			( CLEAR_E )
			(not ( CLEAR_A ))
			(not ( HANDEMPTY ))
			(not ( ON_A_E ))
		)
	)
	(:action UNSTACK_A_O
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_A )
			( ON_A_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_A )
			( CLEAR_O )
			(not ( CLEAR_A ))
			(not ( HANDEMPTY ))
			(not ( ON_A_O ))
		)
	)
	(:action UNSTACK_A_W
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_A )
			( ON_A_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_A )
			( CLEAR_W )
			(not ( CLEAR_A ))
			(not ( HANDEMPTY ))
			(not ( ON_A_W ))
		)
	)
	(:action UNSTACK_A_R
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_A )
			( ON_A_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_A )
			( CLEAR_R )
			(not ( CLEAR_A ))
			(not ( HANDEMPTY ))
			(not ( ON_A_R ))
		)
	)
	(:action UNSTACK_A_D
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_A )
			( ON_A_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_A )
			( CLEAR_D )
			(not ( CLEAR_A ))
			(not ( HANDEMPTY ))
			(not ( ON_A_D ))
		)
	)
	(:action UNSTACK_R_C
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_R )
			( ON_R_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_R )
			( CLEAR_C )
			(not ( CLEAR_R ))
			(not ( HANDEMPTY ))
			(not ( ON_R_C ))
		)
	)
	(:action UNSTACK_R_E
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_R )
			( ON_R_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_R )
			( CLEAR_E )
			(not ( CLEAR_R ))
			(not ( HANDEMPTY ))
			(not ( ON_R_E ))
		)
	)
	(:action UNSTACK_R_O
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_R )
			( ON_R_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_R )
			( CLEAR_O )
			(not ( CLEAR_R ))
			(not ( HANDEMPTY ))
			(not ( ON_R_O ))
		)
	)
	(:action UNSTACK_R_W
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_R )
			( ON_R_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_R )
			( CLEAR_W )
			(not ( CLEAR_R ))
			(not ( HANDEMPTY ))
			(not ( ON_R_W ))
		)
	)
	(:action UNSTACK_R_A
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_R )
			( ON_R_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_R )
			( CLEAR_A )
			(not ( CLEAR_R ))
			(not ( HANDEMPTY ))
			(not ( ON_R_A ))
		)
	)
	(:action UNSTACK_R_D
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_R )
			( ON_R_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_R )
			( CLEAR_D )
			(not ( CLEAR_R ))
			(not ( HANDEMPTY ))
			(not ( ON_R_D ))
		)
	)
	(:action UNSTACK_D_C
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_D )
			( ON_D_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_D )
			( CLEAR_C )
			(not ( CLEAR_D ))
			(not ( HANDEMPTY ))
			(not ( ON_D_C ))
		)
	)
	(:action UNSTACK_D_P
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_D )
			( ON_D_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_D )
			( CLEAR_P )
			(not ( CLEAR_D ))
			(not ( HANDEMPTY ))
			(not ( ON_D_P ))
		)
	)
	(:action UNSTACK_D_E
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_D )
			( ON_D_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_D )
			( CLEAR_E )
			(not ( CLEAR_D ))
			(not ( HANDEMPTY ))
			(not ( ON_D_E ))
		)
	)
	(:action UNSTACK_D_O
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_D )
			( ON_D_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_D )
			( CLEAR_O )
			(not ( CLEAR_D ))
			(not ( HANDEMPTY ))
			(not ( ON_D_O ))
		)
	)
	(:action UNSTACK_D_W
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_D )
			( ON_D_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_D )
			( CLEAR_W )
			(not ( CLEAR_D ))
			(not ( HANDEMPTY ))
			(not ( ON_D_W ))
		)
	)
	(:action UNSTACK_D_R
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_D )
			( ON_D_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_D )
			( CLEAR_R )
			(not ( CLEAR_D ))
			(not ( HANDEMPTY ))
			(not ( ON_D_R ))
		)
	)
	(:action STACK_C_P
		:parameters ()
		:precondition
		(and
			( CLEAR_P )
			( HOLDING_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_C )
			( HANDEMPTY )
			( ON_C_P )
			(not ( HOLDING_C ))
			(not ( CLEAR_P ))
		)
	)
	(:action STACK_C_E
		:parameters ()
		:precondition
		(and
			( CLEAR_E )
			( HOLDING_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_C )
			( HANDEMPTY )
			( ON_C_E )
			(not ( HOLDING_C ))
			(not ( CLEAR_E ))
		)
	)
	(:action STACK_C_O
		:parameters ()
		:precondition
		(and
			( CLEAR_O )
			( HOLDING_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_C )
			( HANDEMPTY )
			( ON_C_O )
			(not ( HOLDING_C ))
			(not ( CLEAR_O ))
		)
	)
	(:action STACK_C_W
		:parameters ()
		:precondition
		(and
			( CLEAR_W )
			( HOLDING_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_C )
			( HANDEMPTY )
			( ON_C_W )
			(not ( HOLDING_C ))
			(not ( CLEAR_W ))
		)
	)
	(:action STACK_C_A
		:parameters ()
		:precondition
		(and
			( CLEAR_A )
			( HOLDING_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_C )
			( HANDEMPTY )
			( ON_C_A )
			(not ( HOLDING_C ))
			(not ( CLEAR_A ))
		)
	)
	(:action STACK_C_R
		:parameters ()
		:precondition
		(and
			( CLEAR_R )
			( HOLDING_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_C )
			( HANDEMPTY )
			( ON_C_R )
			(not ( HOLDING_C ))
			(not ( CLEAR_R ))
		)
	)
	(:action STACK_C_D
		:parameters ()
		:precondition
		(and
			( CLEAR_D )
			( HOLDING_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_C )
			( HANDEMPTY )
			( ON_C_D )
			(not ( HOLDING_C ))
			(not ( CLEAR_D ))
		)
	)
	(:action STACK_P_C
		:parameters ()
		:precondition
		(and
			( CLEAR_C )
			( HOLDING_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_P )
			( HANDEMPTY )
			( ON_P_C )
			(not ( HOLDING_P ))
			(not ( CLEAR_C ))
		)
	)
	(:action STACK_P_E
		:parameters ()
		:precondition
		(and
			( CLEAR_E )
			( HOLDING_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_P )
			( HANDEMPTY )
			( ON_P_E )
			(not ( HOLDING_P ))
			(not ( CLEAR_E ))
		)
	)
	(:action STACK_P_O
		:parameters ()
		:precondition
		(and
			( CLEAR_O )
			( HOLDING_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_P )
			( HANDEMPTY )
			( ON_P_O )
			(not ( HOLDING_P ))
			(not ( CLEAR_O ))
		)
	)
	(:action STACK_P_W
		:parameters ()
		:precondition
		(and
			( CLEAR_W )
			( HOLDING_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_P )
			( HANDEMPTY )
			( ON_P_W )
			(not ( HOLDING_P ))
			(not ( CLEAR_W ))
		)
	)
	(:action STACK_P_A
		:parameters ()
		:precondition
		(and
			( CLEAR_A )
			( HOLDING_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_P )
			( HANDEMPTY )
			( ON_P_A )
			(not ( HOLDING_P ))
			(not ( CLEAR_A ))
		)
	)
	(:action STACK_P_R
		:parameters ()
		:precondition
		(and
			( CLEAR_R )
			( HOLDING_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_P )
			( HANDEMPTY )
			( ON_P_R )
			(not ( HOLDING_P ))
			(not ( CLEAR_R ))
		)
	)
	(:action STACK_P_D
		:parameters ()
		:precondition
		(and
			( CLEAR_D )
			( HOLDING_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_P )
			( HANDEMPTY )
			( ON_P_D )
			(not ( HOLDING_P ))
			(not ( CLEAR_D ))
		)
	)
	(:action STACK_E_C
		:parameters ()
		:precondition
		(and
			( CLEAR_C )
			( HOLDING_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_E )
			( HANDEMPTY )
			( ON_E_C )
			(not ( HOLDING_E ))
			(not ( CLEAR_C ))
		)
	)
	(:action STACK_E_P
		:parameters ()
		:precondition
		(and
			( CLEAR_P )
			( HOLDING_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_E )
			( HANDEMPTY )
			( ON_E_P )
			(not ( HOLDING_E ))
			(not ( CLEAR_P ))
		)
	)
	(:action STACK_E_A
		:parameters ()
		:precondition
		(and
			( CLEAR_A )
			( HOLDING_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_E )
			( HANDEMPTY )
			( ON_E_A )
			(not ( HOLDING_E ))
			(not ( CLEAR_A ))
		)
	)
	(:action STACK_O_C
		:parameters ()
		:precondition
		(and
			( CLEAR_C )
			( HOLDING_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_O )
			( HANDEMPTY )
			( ON_O_C )
			(not ( HOLDING_O ))
			(not ( CLEAR_C ))
		)
	)
	(:action STACK_O_P
		:parameters ()
		:precondition
		(and
			( CLEAR_P )
			( HOLDING_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_O )
			( HANDEMPTY )
			( ON_O_P )
			(not ( HOLDING_O ))
			(not ( CLEAR_P ))
		)
	)
	(:action STACK_O_A
		:parameters ()
		:precondition
		(and
			( CLEAR_A )
			( HOLDING_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_O )
			( HANDEMPTY )
			( ON_O_A )
			(not ( HOLDING_O ))
			(not ( CLEAR_A ))
		)
	)
	(:action STACK_W_C
		:parameters ()
		:precondition
		(and
			( CLEAR_C )
			( HOLDING_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_W )
			( HANDEMPTY )
			( ON_W_C )
			(not ( HOLDING_W ))
			(not ( CLEAR_C ))
		)
	)
	(:action STACK_W_P
		:parameters ()
		:precondition
		(and
			( CLEAR_P )
			( HOLDING_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_W )
			( HANDEMPTY )
			( ON_W_P )
			(not ( HOLDING_W ))
			(not ( CLEAR_P ))
		)
	)
	(:action STACK_W_A
		:parameters ()
		:precondition
		(and
			( CLEAR_A )
			( HOLDING_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_W )
			( HANDEMPTY )
			( ON_W_A )
			(not ( HOLDING_W ))
			(not ( CLEAR_A ))
		)
	)
	(:action STACK_A_C
		:parameters ()
		:precondition
		(and
			( CLEAR_C )
			( HOLDING_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_A )
			( HANDEMPTY )
			( ON_A_C )
			(not ( HOLDING_A ))
			(not ( CLEAR_C ))
		)
	)
	(:action STACK_A_P
		:parameters ()
		:precondition
		(and
			( CLEAR_P )
			( HOLDING_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_A )
			( HANDEMPTY )
			( ON_A_P )
			(not ( HOLDING_A ))
			(not ( CLEAR_P ))
		)
	)
	(:action STACK_A_E
		:parameters ()
		:precondition
		(and
			( CLEAR_E )
			( HOLDING_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_A )
			( HANDEMPTY )
			( ON_A_E )
			(not ( HOLDING_A ))
			(not ( CLEAR_E ))
		)
	)
	(:action STACK_A_O
		:parameters ()
		:precondition
		(and
			( CLEAR_O )
			( HOLDING_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_A )
			( HANDEMPTY )
			( ON_A_O )
			(not ( HOLDING_A ))
			(not ( CLEAR_O ))
		)
	)
	(:action STACK_A_W
		:parameters ()
		:precondition
		(and
			( CLEAR_W )
			( HOLDING_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_A )
			( HANDEMPTY )
			( ON_A_W )
			(not ( HOLDING_A ))
			(not ( CLEAR_W ))
		)
	)
	(:action STACK_A_R
		:parameters ()
		:precondition
		(and
			( CLEAR_R )
			( HOLDING_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_A )
			( HANDEMPTY )
			( ON_A_R )
			(not ( HOLDING_A ))
			(not ( CLEAR_R ))
		)
	)
	(:action STACK_A_D
		:parameters ()
		:precondition
		(and
			( CLEAR_D )
			( HOLDING_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_A )
			( HANDEMPTY )
			( ON_A_D )
			(not ( HOLDING_A ))
			(not ( CLEAR_D ))
		)
	)
	(:action STACK_R_C
		:parameters ()
		:precondition
		(and
			( CLEAR_C )
			( HOLDING_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_R )
			( HANDEMPTY )
			( ON_R_C )
			(not ( HOLDING_R ))
			(not ( CLEAR_C ))
		)
	)
	(:action STACK_R_P
		:parameters ()
		:precondition
		(and
			( CLEAR_P )
			( HOLDING_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_R )
			( HANDEMPTY )
			( ON_R_P )
			(not ( HOLDING_R ))
			(not ( CLEAR_P ))
		)
	)
	(:action STACK_R_E
		:parameters ()
		:precondition
		(and
			( CLEAR_E )
			( HOLDING_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_R )
			( HANDEMPTY )
			( ON_R_E )
			(not ( HOLDING_R ))
			(not ( CLEAR_E ))
		)
	)
	(:action STACK_R_O
		:parameters ()
		:precondition
		(and
			( CLEAR_O )
			( HOLDING_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_R )
			( HANDEMPTY )
			( ON_R_O )
			(not ( HOLDING_R ))
			(not ( CLEAR_O ))
		)
	)
	(:action STACK_R_W
		:parameters ()
		:precondition
		(and
			( CLEAR_W )
			( HOLDING_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_R )
			( HANDEMPTY )
			( ON_R_W )
			(not ( HOLDING_R ))
			(not ( CLEAR_W ))
		)
	)
	(:action STACK_R_A
		:parameters ()
		:precondition
		(and
			( CLEAR_A )
			( HOLDING_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_R )
			( HANDEMPTY )
			( ON_R_A )
			(not ( HOLDING_R ))
			(not ( CLEAR_A ))
		)
	)
	(:action STACK_R_D
		:parameters ()
		:precondition
		(and
			( CLEAR_D )
			( HOLDING_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_R )
			( HANDEMPTY )
			( ON_R_D )
			(not ( HOLDING_R ))
			(not ( CLEAR_D ))
		)
	)
	(:action STACK_D_C
		:parameters ()
		:precondition
		(and
			( CLEAR_C )
			( HOLDING_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_D )
			( HANDEMPTY )
			( ON_D_C )
			(not ( HOLDING_D ))
			(not ( CLEAR_C ))
		)
	)
	(:action STACK_D_P
		:parameters ()
		:precondition
		(and
			( CLEAR_P )
			( HOLDING_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_D )
			( HANDEMPTY )
			( ON_D_P )
			(not ( HOLDING_D ))
			(not ( CLEAR_P ))
		)
	)
	(:action STACK_D_E
		:parameters ()
		:precondition
		(and
			( CLEAR_E )
			( HOLDING_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_D )
			( HANDEMPTY )
			( ON_D_E )
			(not ( HOLDING_D ))
			(not ( CLEAR_E ))
		)
	)
	(:action STACK_D_O
		:parameters ()
		:precondition
		(and
			( CLEAR_O )
			( HOLDING_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_D )
			( HANDEMPTY )
			( ON_D_O )
			(not ( HOLDING_D ))
			(not ( CLEAR_O ))
		)
	)
	(:action STACK_D_W
		:parameters ()
		:precondition
		(and
			( CLEAR_W )
			( HOLDING_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_D )
			( HANDEMPTY )
			( ON_D_W )
			(not ( HOLDING_D ))
			(not ( CLEAR_W ))
		)
	)
	(:action STACK_D_A
		:parameters ()
		:precondition
		(and
			( CLEAR_A )
			( HOLDING_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_D )
			( HANDEMPTY )
			( ON_D_A )
			(not ( HOLDING_D ))
			(not ( CLEAR_A ))
		)
	)
	(:action STACK_D_R
		:parameters ()
		:precondition
		(and
			( CLEAR_R )
			( HOLDING_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_D )
			( HANDEMPTY )
			( ON_D_R )
			(not ( HOLDING_D ))
			(not ( CLEAR_R ))
		)
	)
	(:action PUT-DOWN_C
		:parameters ()
		:precondition
		(and
			( HOLDING_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_C )
			( HANDEMPTY )
			( ONTABLE_C )
			(not ( HOLDING_C ))
		)
	)
	(:action PUT-DOWN_P
		:parameters ()
		:precondition
		(and
			( HOLDING_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_P )
			( HANDEMPTY )
			( ONTABLE_P )
			(not ( HOLDING_P ))
		)
	)
	(:action PUT-DOWN_A
		:parameters ()
		:precondition
		(and
			( HOLDING_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_A )
			( HANDEMPTY )
			( ONTABLE_A )
			(not ( HOLDING_A ))
		)
	)
	(:action PUT-DOWN_R
		:parameters ()
		:precondition
		(and
			( HOLDING_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_R )
			( HANDEMPTY )
			( ONTABLE_R )
			(not ( HOLDING_R ))
		)
	)
	(:action PUT-DOWN_D
		:parameters ()
		:precondition
		(and
			( HOLDING_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_D )
			( HANDEMPTY )
			( ONTABLE_D )
			(not ( HOLDING_D ))
		)
	)
	(:action PICK-UP_C
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( ONTABLE_C )
			( CLEAR_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_C )
			(not ( ONTABLE_C ))
			(not ( CLEAR_C ))
			(not ( HANDEMPTY ))
		)
	)
	(:action PICK-UP_P
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( ONTABLE_P )
			( CLEAR_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_P )
			(not ( ONTABLE_P ))
			(not ( CLEAR_P ))
			(not ( HANDEMPTY ))
		)
	)
	(:action UNSTACK_E_O
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_E )
			( ON_E_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_E )
			( CLEAR_O )
			(not ( CLEAR_E ))
			(not ( HANDEMPTY ))
			(not ( ON_E_O ))
		)
	)
	(:action UNSTACK_E_W
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_E )
			( ON_E_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_E )
			( CLEAR_W )
			(not ( CLEAR_E ))
			(not ( HANDEMPTY ))
			(not ( ON_E_W ))
		)
	)
	(:action UNSTACK_E_R
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_E )
			( ON_E_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_E )
			( CLEAR_R )
			(not ( CLEAR_E ))
			(not ( HANDEMPTY ))
			(not ( ON_E_R ))
		)
	)
	(:action UNSTACK_E_D
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_E )
			( ON_E_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_E )
			( CLEAR_D )
			(not ( CLEAR_E ))
			(not ( HANDEMPTY ))
			(not ( ON_E_D ))
		)
	)
	(:action UNSTACK_O_E
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_O )
			( ON_O_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_O )
			( CLEAR_E )
			(not ( CLEAR_O ))
			(not ( HANDEMPTY ))
			(not ( ON_O_E ))
		)
	)
	(:action UNSTACK_O_W
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_O )
			( ON_O_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_O )
			( CLEAR_W )
			(not ( CLEAR_O ))
			(not ( HANDEMPTY ))
			(not ( ON_O_W ))
		)
	)
	(:action UNSTACK_O_R
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_O )
			( ON_O_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_O )
			( CLEAR_R )
			(not ( CLEAR_O ))
			(not ( HANDEMPTY ))
			(not ( ON_O_R ))
		)
	)
	(:action UNSTACK_O_D
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_O )
			( ON_O_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_O )
			( CLEAR_D )
			(not ( CLEAR_O ))
			(not ( HANDEMPTY ))
			(not ( ON_O_D ))
		)
	)
	(:action UNSTACK_W_E
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_W )
			( ON_W_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_W )
			( CLEAR_E )
			(not ( CLEAR_W ))
			(not ( HANDEMPTY ))
			(not ( ON_W_E ))
		)
	)
	(:action UNSTACK_W_O
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_W )
			( ON_W_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_W )
			( CLEAR_O )
			(not ( CLEAR_W ))
			(not ( HANDEMPTY ))
			(not ( ON_W_O ))
		)
	)
	(:action UNSTACK_W_R
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_W )
			( ON_W_R )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_W )
			( CLEAR_R )
			(not ( CLEAR_W ))
			(not ( HANDEMPTY ))
			(not ( ON_W_R ))
		)
	)
	(:action UNSTACK_W_D
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_W )
			( ON_W_D )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_W )
			( CLEAR_D )
			(not ( CLEAR_W ))
			(not ( HANDEMPTY ))
			(not ( ON_W_D ))
		)
	)
	(:action UNSTACK_A_C
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_A )
			( ON_A_C )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_A )
			( CLEAR_C )
			(not ( CLEAR_A ))
			(not ( HANDEMPTY ))
			(not ( ON_A_C ))
		)
	)
	(:action UNSTACK_R_P
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_R )
			( ON_R_P )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_R )
			( CLEAR_P )
			(not ( CLEAR_R ))
			(not ( HANDEMPTY ))
			(not ( ON_R_P ))
		)
	)
	(:action UNSTACK_D_A
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( CLEAR_D )
			( ON_D_A )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_D )
			( CLEAR_A )
			(not ( CLEAR_D ))
			(not ( HANDEMPTY ))
			(not ( ON_D_A ))
		)
	)
	(:action STACK_E_O
		:parameters ()
		:precondition
		(and
			( CLEAR_O )
			( HOLDING_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_E )
			( HANDEMPTY )
			( ON_E_O )
			(not ( HOLDING_E ))
			(not ( CLEAR_O ))
		)
	)
	(:action STACK_E_W
		:parameters ()
		:precondition
		(and
			( CLEAR_W )
			( HOLDING_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_E )
			( HANDEMPTY )
			( ON_E_W )
			(not ( HOLDING_E ))
			(not ( CLEAR_W ))
		)
	)
	(:action STACK_E_R
		:parameters ()
		:precondition
		(and
			( CLEAR_R )
			( HOLDING_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_E )
			( HANDEMPTY )
			( ON_E_R )
			(not ( HOLDING_E ))
			(not ( CLEAR_R ))
		)
	)
	(:action STACK_E_D
		:parameters ()
		:precondition
		(and
			( CLEAR_D )
			( HOLDING_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_E )
			( HANDEMPTY )
			( ON_E_D )
			(not ( HOLDING_E ))
			(not ( CLEAR_D ))
		)
	)
	(:action STACK_O_E
		:parameters ()
		:precondition
		(and
			( CLEAR_E )
			( HOLDING_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_O )
			( HANDEMPTY )
			( ON_O_E )
			(not ( HOLDING_O ))
			(not ( CLEAR_E ))
		)
	)
	(:action STACK_O_W
		:parameters ()
		:precondition
		(and
			( CLEAR_W )
			( HOLDING_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_O )
			( HANDEMPTY )
			( ON_O_W )
			(not ( HOLDING_O ))
			(not ( CLEAR_W ))
		)
	)
	(:action STACK_O_R
		:parameters ()
		:precondition
		(and
			( CLEAR_R )
			( HOLDING_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_O )
			( HANDEMPTY )
			( ON_O_R )
			(not ( HOLDING_O ))
			(not ( CLEAR_R ))
		)
	)
	(:action STACK_O_D
		:parameters ()
		:precondition
		(and
			( CLEAR_D )
			( HOLDING_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_O )
			( HANDEMPTY )
			( ON_O_D )
			(not ( HOLDING_O ))
			(not ( CLEAR_D ))
		)
	)
	(:action STACK_W_E
		:parameters ()
		:precondition
		(and
			( CLEAR_E )
			( HOLDING_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_W )
			( HANDEMPTY )
			( ON_W_E )
			(not ( HOLDING_W ))
			(not ( CLEAR_E ))
		)
	)
	(:action STACK_W_O
		:parameters ()
		:precondition
		(and
			( CLEAR_O )
			( HOLDING_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_W )
			( HANDEMPTY )
			( ON_W_O )
			(not ( HOLDING_W ))
			(not ( CLEAR_O ))
		)
	)
	(:action STACK_W_R
		:parameters ()
		:precondition
		(and
			( CLEAR_R )
			( HOLDING_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_W )
			( HANDEMPTY )
			( ON_W_R )
			(not ( HOLDING_W ))
			(not ( CLEAR_R ))
		)
	)
	(:action STACK_W_D
		:parameters ()
		:precondition
		(and
			( CLEAR_D )
			( HOLDING_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_W )
			( HANDEMPTY )
			( ON_W_D )
			(not ( HOLDING_W ))
			(not ( CLEAR_D ))
		)
	)
	(:action PUT-DOWN_E
		:parameters ()
		:precondition
		(and
			( HOLDING_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_E )
			( HANDEMPTY )
			( ONTABLE_E )
			(not ( HOLDING_E ))
		)
	)
	(:action PUT-DOWN_O
		:parameters ()
		:precondition
		(and
			( HOLDING_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_O )
			( HANDEMPTY )
			( ONTABLE_O )
			(not ( HOLDING_O ))
		)
	)
	(:action PUT-DOWN_W
		:parameters ()
		:precondition
		(and
			( HOLDING_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CLEAR_W )
			( HANDEMPTY )
			( ONTABLE_W )
			(not ( HOLDING_W ))
		)
	)
	(:action PICK-UP_E
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( ONTABLE_E )
			( CLEAR_E )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_E )
			(not ( ONTABLE_E ))
			(not ( CLEAR_E ))
			(not ( HANDEMPTY ))
		)
	)
	(:action PICK-UP_O
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( ONTABLE_O )
			( CLEAR_O )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_O )
			(not ( ONTABLE_O ))
			(not ( CLEAR_O ))
			(not ( HANDEMPTY ))
		)
	)
	(:action PICK-UP_W
		:parameters ()
		:precondition
		(and
			( HANDEMPTY )
			( ONTABLE_W )
			( CLEAR_W )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HOLDING_W )
			(not ( ONTABLE_W ))
			(not ( CLEAR_W ))
			(not ( HANDEMPTY ))
		)
	)

)
