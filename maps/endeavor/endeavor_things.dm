//Full tile windows
/obj/structure/window/reinforced/polarized/full
	dir = SOUTHWEST
	icon_state = "fwindow"
	maxhealth = 80
/obj/structure/window/phoronreinforced/full
	dir = SOUTHWEST
	maxhealth = 160
	icon_state = "phoronwindow0"

//Exterior hull looks different in the map editor
/turf/simulated/wall/rshull
	icon_state = "hull"

//Endeavor map_data obj
/obj/effect/landmark/map_data/endeavor
    height = 5
//Mining Z levels
/obj/effect/landmark/map_data/endeavor_mining
    height = 2

//Trash piles should be below the items you find in them
/obj/structure/trash_pile
	layer = 2.9

//Radiation closets
/obj/structure/closet/radiation
	starts_with = list(
		/obj/item/clothing/suit/radiation = 3,
		/obj/item/clothing/head/radiation = 3,
		/obj/item/device/geiger = 3,
		/obj/item/clothing/glasses/meson = 3)

//Fax Machine Presets
/obj/machinery/photocopier/faxmachine/cmo
	department = "Chief Medical Officer's Office"
/obj/machinery/photocopier/faxmachine/ce
	department = "Chief Engineer's Office"
/obj/machinery/photocopier/faxmachine/cap
	department = "Colony Director's Office"
/obj/machinery/photocopier/faxmachine/rd
	department = "Research Director's Office"
/obj/machinery/photocopier/faxmachine/hop
	department = "Head of Personnel's Office"
/obj/machinery/photocopier/faxmachine/hos
	department = "Head of Security's Office"
/obj/machinery/photocopier/faxmachine/qm
	department = "Quartermaster's Office"
/obj/machinery/photocopier/faxmachine/warden
	department = "Warden's Office"
/obj/machinery/photocopier/faxmachine/mail
	department = "Mailing Room"
/obj/machinery/photocopier/faxmachine/sec
	department = "Security"
/obj/machinery/photocopier/faxmachine/bridge
	department = "Bridge"

//
/obj/machinery/computer/shuttle_control/mining
	name = "mining shuttle control console"
/obj/machinery/computer/shuttle_control/research
	name = "research shuttle control console"



/*
//Departure shuttle doors
// ferry departure cryo doors that turn into ordinary airlock doors at round end
/obj/machinery/cryopod/robot/door/ferry
	name = "\improper ferry Station"
	icon = 'icons/obj/doors/Doorext.dmi'
	icon_state = "door_closed"
	base_icon_state = "door_closed"
	occupied_icon_state = "door_locked"
	desc = "The ferry station you may have came in from. You can leave through here."
	on_store_message = "has departed on the ferry."
	on_store_name = "Travel Oversight"
	on_enter_occupant_message = "The ferry arrives at the platform; you step inside and take a seat."
	on_store_visible_message_1 = "'s speakers chime, anouncing a ferry has arrived to take"
	on_store_visible_message_2 = "to the colony"
	time_till_despawn = 10 SECONDS
	spawnpoint_type = /datum/spawnpoint/ferry

/obj/machinery/cryopod/robot/door/ferry/process()
	if(emergency_shuttle.online() || emergency_shuttle.returned())
		// Transform into a door!  But first despawn anyone inside
		time_till_despawn = 0
		..()
		var/turf/T = get_turf(src)
		var/obj/machinery/door/airlock/external/door = new(T)
		door.req_access = null
		door.req_one_access = null
		qdel(src)
	// Otherwise just operate normally
	return ..()

/obj/machinery/cryopod/robot/door/ferry/Bumped(var/atom/movable/AM)
	if(!ishuman(AM))
		return

	var/mob/living/carbon/human/user = AM

	var/choice = alert("Do you want to depart via the ferry? Your character will leave the round.","Departure","Yes","No")
	if(user && Adjacent(user) && choice == "Yes")
		user.ghostize()
		despawn_occupant(user)

/datum/spawnpoint/ferry
	display_name = "Arrivals Dock"
	msg = "has arrived on the ferry"

*/

//explorer intercom
/obj/item/device/radio/intercom/explorer
	name = "intercom (explorer)"
	frequency = EXP_FREQ

//CC ship pamphlet
/obj/item/weapon/paper/pamphlet/phoenix
	name = "pamphlet - Welcome to the ARFS Phoenix"
	icon_state = "pamphlet"
	info = "<b>Welcome to the ARFS Phoenix</b><br>\
			Aboard this city-class colony ship, you'll find all of the commodities you might expect back home. Including, but not limited to:\
			A variety of dining experiences, community sports teams, holographic beaches and other simulations, modern and generous living quarters, \
			and other wonderful commodities. All residents may also opt into our extended cryogenic or digital mind storage systems to wait out the journey\
			into the stars! We'll wake you up when you're needed!"

//Signs
/obj/structure/sign/deck5
	icon = 'maps/endeavor/endeavor_decals.dmi'
	desc = "A silver sign which reads 'DECK V'."
	name = "DECK V"
	icon_state = "deck5"

//Xenobiology cameras
/obj/machinery/camera/network/xenobiology
	network = list("Xenobiology")

/obj/machinery/computer/security/xenobiology
	name = "xenobiology camera monitor"
	network = list("Xenobiology")


//Floor decals
/obj/effect/floor_decal
	layer = TURF_LAYER //Help mappers see pipes and other things on the 2.1 layer

//"Red" Armory Door
/obj/machinery/door/airlock/security/armory
	name = "Red Armory"
	//color = ""

/obj/machinery/door/airlock/security/armory/allowed(mob/user)
	if(get_security_level() in list("green","blue"))
		return FALSE

	return ..(user)

//Excursion shuttle gun cabinet
/obj/structure/closet/secure_closet/guncabinet/excursion
	name = "expedition weaponry cabinet"
	req_one_access = list(access_explorer,access_armory)

/obj/structure/closet/secure_closet/guncabinet/excursion/New()
	..()
	for(var/i = 1 to 3)
		new /obj/item/weapon/gun/energy/frontier/locked(src)

//Air scrubbers for shuttles, always on
/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/alwayson
	name = "\improper Air Scrubber"
	icon_state = "scrubber:1"
	on = TRUE

/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/alwayson/powered()
	return TRUE // Always be powered

//
// ### Wall Machines On Full Windows ###
// To make sure wall-mounted machines placed on full-tile windows are clickable they must be above the window
//
/obj/item/device/radio/intercom
	layer = ABOVE_WINDOW_LAYER
/obj/item/weapon/storage/secure/safe
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/airlock_sensor
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/alarm
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/button
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/access_button
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/computer/guestpass
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/computer/security/telescreen
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/door_timer
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/embedded_controller
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/firealarm
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/flasher
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/keycard_auth
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/light_switch
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/mineral/processing_unit_console
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/mineral/stacking_unit_console
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/newscaster
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/power/apc
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/requests_console
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/status_display
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/vending/wallmed1
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/vending/wallmed2
	layer = ABOVE_WINDOW_LAYER
/obj/structure/closet/fireaxecabinet
	layer = ABOVE_WINDOW_LAYER
/obj/structure/extinguisher_cabinet
	layer = ABOVE_WINDOW_LAYER
/obj/structure/mirror
	layer = ABOVE_WINDOW_LAYER
/obj/structure/noticeboard
	layer = ABOVE_WINDOW_LAYER