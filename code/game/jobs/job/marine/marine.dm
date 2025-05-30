/datum/job/marine
	supervisors = "the acting platoon leader"
	selection_class = "job_marine"
	total_positions = 8
	spawn_positions = 8
	allow_additional = 1

/datum/job/marine/generate_entry_message(mob/living/carbon/human/current_human)
	if(current_human.faction == FACTION_TWE)
		entry_message_intro = "You are a [title]!<br>You have been assigned to <b><font size=3 color=[current_human.assigned_squad.equipment_color]>[lowertext(current_human.assigned_squad.name)]</font></b>.[Check_WO() ? "" : " Make your way to the wardroom for some post-hypersleep chow, and then get equipped in your section's prep room." ]"
	else if(current_human.assigned_squad)
		entry_message_intro = "You are a [title]!<br>You have been assigned to the <b><font size=3 color=[current_human.assigned_squad.equipment_color]>[lowertext(current_human.assigned_squad.name)] platoon</font></b>.[Check_WO() ? "" : " Make your way to the cafeteria for some post-cryosleep chow, and then get equipped in your team's prep room." ]"
	return ..()

/datum/job/marine/generate_entry_conditions(mob/living/carbon/human/current_human)
	..()
	if(!Check_WO())
		current_human.nutrition = rand(NUTRITION_VERYLOW, NUTRITION_LOW) //Start hungry for the default marine.

/datum/timelock/squad
	name = "Squad Roles"

/datum/timelock/squad/New(name, time_required, list/roles)
	. = ..()
	src.roles = JOB_SQUAD_ROLES_LIST

