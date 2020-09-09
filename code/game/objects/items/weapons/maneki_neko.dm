/obj/item/weapon/maneki_neko
	name = "Ancient Maneki Neko"
	icon = 'icons/obj/faction_item.dmi'
	icon_state = "maneki_neko"
	item_state = "maneki_neko"
<<<<<<< HEAD
	desc = "An expensive-looking figurine, found during Northern Light's refurbishment. It is surrounded by a menacing aura and seems to be very fragile."
=======
	desc = "Costs a lot of money, this is ancient relic with no practical purpose. Feels like it's looking at you, with menacingly gaze. Fragile."
>>>>>>> e767f66... Merge pull request #104 from martinlyra/onions-4
	flags = CONDUCT
	force = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_SMALL
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 3
	throw_range = 15
	price_tag = 20000
	origin_tech = list(TECH_MATERIAL = 10)
<<<<<<< HEAD
	var/affect_radius = 7
=======
>>>>>>> e767f66... Merge pull request #104 from martinlyra/onions-4
	matter = list(MATERIAL_GLASS = 5, MATERIAL_GOLD = 7, MATERIAL_SILVER = 5, MATERIAL_DIAMOND = 1)
	var/list/mob/living/carbon/human/followers = list()

/obj/item/weapon/maneki_neko/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(!istype(src.loc, /obj/item/weapon/storage/bsdm))
		destroy_lifes()
	..()
/obj/item/weapon/maneki_neko/New()
	START_PROCESSING(SSobj, src)
	..()

/obj/item/weapon/maneki_neko/Process()
	..()
<<<<<<< HEAD
	for(var/list/mob/living/carbon/human/affected in oviewers(affect_radius, src))
		followers |= affected
=======
	var/list/mob/living/carbon/human/affected = oviewers(src)
	followers |= affected
>>>>>>> e767f66... Merge pull request #104 from martinlyra/onions-4

/obj/item/weapon/maneki_neko/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(QUALITY_HAMMERING in W.tool_qualities)
		if(W.use_tool(user, src, WORKTIME_INSTANT, QUALITY_HAMMERING, FAILCHANCE_EASY, required_stat = STAT_ROB))
			playsound(src, "shatter", 70, 1)
			new /obj/item/clothing/head/collectable/kitty(get_turf(src))
			qdel(src)

/obj/item/weapon/reagent_containers/enricher/afterattack(var/obj/target, var/mob/user, var/flag)
	if(user.a_intent == I_HURT)
		playsound(src, "shatter", 70, 1)
		new /obj/item/clothing/head/collectable/kitty(get_turf(src))
		qdel(src)

/obj/item/weapon/maneki_neko/throw_impact(atom/hit_atom)
	..()
	playsound(src, "shatter", 70, 1)
	new /obj/item/clothing/head/collectable/kitty(get_turf(src))
	qdel(src)

/obj/item/weapon/maneki_neko/proc/destroy_lifes()
	for(var/mob/living/carbon/human/H in followers)
		H.sanity.insight = 0
		H.sanity.environment_cap_coeff = 0
		H.sanity.negative_prob += 30
		H.sanity.positive_prob = 0
		H.sanity.level = 0
		for(var/stat in ALL_STATS)
			H.stats.changeStat(stat, -10)
<<<<<<< HEAD
		to_chat(H, SPAN_DANGER("You feel ages upon ages of bad luck crawling onto your shoulders!"))
=======
		var/neko = uppertext(src.name)
		to_chat(H, SPAN_DANGER(pick("LIFE IS RUINED FOR ME! I CANNOT FIND [neko]!", "WHO STEAL MY [neko]!", "WHERE IS [neko]?!", "WHY I CANNOT FIND [neko]?!")))
>>>>>>> e767f66... Merge pull request #104 from martinlyra/onions-4
