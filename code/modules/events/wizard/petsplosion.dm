/datum/round_event_control/wizard/petsplosion //the horror
	name = "Petsplosion"
	weight = 2
	typepath = /datum/round_event/wizard/petsplosion/
	max_occurrences = 3
	earliest_start = 0

/datum/round_event/wizard/petsplosion/
	endWhen = 61 //1 minute (+1 tick for endWhen not to interfere with tick)
	var/countdown = 0

/datum/round_event/wizard/petsplosion/tick()
	if(activeFor >= 30 * countdown) // 0 seconds : 2 animals | 30 seconds : 4 animals | 1 minute : 8 animals
		countdown += 1
		for(var/mob/living/simple_animal/F in living_mob_list) //If you cull the heard before the next replication, things will be easier for you
			if(!istype(F, /mob/living/simple_animal/hostile))
				new F.type(F.loc)