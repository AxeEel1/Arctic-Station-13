//Unused, this is only here as an artifact to prevent issues.
/turf/space
	icon = 'icons/turf/space.dmi'
	name = "\proper snow"
	icon_state = "snow"
	intact = 0

	temperature = TCMB
	thermal_conductivity = OPEN_HEAT_TRANSFER_COEFFICIENT
	heat_capacity = 700000

/turf/space/New()

/turf/space/attack_paw(mob/user as mob)
	return src.attack_hand(user)

/turf/space/attackby(obj/item/C, mob/user)
	if(istype(C, /obj/item/stack/rods))
		var/obj/item/stack/rods/R = C
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			user << "<span class='warning'>There is already a lattice.</span>"
			return
		if(R.use(1))
			user << "<span class='notice'>Constructing support lattice...</span>"
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			ReplaceWithLattice()
		else
			user << "<span class='warning'>You need one rod to build lattice.</span>"
		return
	if(istype(C, /obj/item/stack/tile/plasteel))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			var/obj/item/stack/tile/plasteel/S = C
			if(S.use(1))
				qdel(L)
				playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
				user << "<span class='notice'>You build a floor.</span>"
				S.build(src)
			else
				user << "<span class='warning'>You need one floor tile to build a floor.</span>"
		else
			user << "<span class='danger'>The plating is going to need some support. Place metal rods first.</span>"

/turf/space/handle_slip()
	return
