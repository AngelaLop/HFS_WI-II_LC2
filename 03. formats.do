/*==================================================
project:       HFS Labels
Author:        Angela Lopez 
E-email:       alopezsanchez@worldbank.org
url:           
Dependencies:  
----------------------------------------------------
Creation Date:     4 May 2022 - 16:03:54
Modification Date:   
Do-file version:    01
References:          
Output:             
==================================================*/

/*==================================================
              0: Program set up
==================================================*/


if "`country'" =="268" local name "ANTIGUA & BARBUDA"
if "`country'" =="501" local name "BELIZE"
if "`country'" =="502" local name "GUATEMALA"
if "`country'" =="503" local name "EL SALVADOR"
if "`country'" =="504" local name "HONDURAS"
if "`country'" =="505" local name "NICARAGUA"
if "`country'" =="506" local name "COSTA RICA"
if "`country'" =="507" local name "PANAMA"
if "`country'" =="509" local name "HAITI"
if "`country'" =="510" local name "PERU"
if "`country'" =="520" local name "MEXICO"
if "`country'" =="540" local name "ARGENTINA"
if "`country'" =="560" local name "CHILE"
if "`country'" =="570" local name "COLOMBIA"
if "`country'" =="591" local name "BOLIVIA"
if "`country'" =="592" local name "GUYANA"
if "`country'" =="593" local name "ECUADOR"
if "`country'" =="595" local name "PARAGUAY"
if "`country'" =="598" local name "URUGUAY"
if "`country'" =="758" local name "SANTA LUCIA"
if "`country'" =="767" local name "DOMINICA"
if "`country'" =="809" local name "REP DOMINICANA"
if "`country'" =="876" local name "JAMAICA"

if "`variable'"=="income_red" 				local label "Percentage of households who report a reduction of income since the onset of the pandemic"
if "`variable'"=="income_eme_gov_pand"  	local label "Percentage of households who received emergency government transfers "
if "`variable'"=="fs_savings" 				local label "Percentage of household that since 2021 to cover essential expenses (food, health or education) have been forced to"
if "`variable'"=="incofs_rent_obligations" 	local label "Percentage of household that since 2021 to cover essential expenses (food, health or education) have been forced to"
if "`variable'"=="fs_new_labor" 			local label "Percentage of household that since 2021 to cover essential expenses (food, health or education) have been forced to"
if "`variable'"=="fs_child_labor" 			local label "Percentage of household that since 2021 to cover essential expenses (food, health or education) have been forced to"
if "`variable'"=="run_out_food" 			local label "Percentage of households who run out of food in the last 30 days"
if "`variable'"=="run_out_food_pre_pan" 	local label "Percentage of households who run out of food before the pandemic"
if "`variable'"=="income_reg_gov_pand"    	local label "Percentage of households who received regular government transfers during the pandemic"
if "`variable'"=="attendance_6_17" 		  	local label "Share of school-age children attending some form of education activities"
if "`variable'"=="pp_attendance" 		  	local label "Percentage point change in share of school-age children attending some form of education activities"
if "`variable'"=="attendance_prepan_6_17" 	local label "Share of school-age children attending some form of education activities before the pandemic"
if "`variable'"=="face_to_face_classes_6_17" local label "Share of enrolled students whose schools offer face-to-face classes"
if "`variable'"=="attendance_prepan_1_5"    local label "Under 5 years old children attending some form of education activities before the pandemic"
if "`variable'"=="attendance_1_5" 			local label "Under 5 years old children attending some form of education activities"
if "`variable'"=="learning_less" 			local label "Perception of children learning less in relation to before the pandemic"
if "`variable'"=="learning_same" 			local label "Perception of children learning the same in relation to before the pandemic"
if "`variable'"=="percep_inseg_violencia"   local label "Perception of increase of domestic violence and insecurity in respondents neighborhood in relation to before the pandemic"
if "`variable'"=="aumento_v14_05" 			local label "Perception of increase of insecurity in respondents neighborhood in relation to before the pandemic"
if "`variable'"=="aumento_v14_06"			local label "Perception of increase of domestic violence in respondents neighborhood in relation to before the pandemic"
if "`variable'"=="regular_CCT"				local label "Percentage point change of households that received regular government transfers"
if "`variable'"=="perdida01"				local label "Percentage of people 18+ who lost their jobs during the pandemic"
if "`variable'"=="ganancia01"				local label "Percentage of people 18+ who found employment during the pandemic"
if "`variable'"=="formal0"					local label "Pre-pandemic formal employment"
if "`variable'"=="formal1"					local label "Formal employment"
if "`variable'"=="horas1"					local label "Pre-pandemic Average working hours"
if "`variable'"=="horas0"					local label "Average working hours"
if "`variable'"=="workhome"					local label "Proportion of hours of remote work" //comprobar con Angela
if "`variable'"=="lost"						local label "Job loss in the pandemic"
if "`variable'"=="aumento_domestica"		local label "Indicator of increase in the time dedicated to some domestic or care task"
if "`variable'"=="toma_dec_gasto0"			local label "Indicator of whether you are the person who primarily made spending decisions before the pandemic"
if "`variable'"=="toma_dec_gasto1"			local label "Indicator of whether you are currently the person who primarily makes spending decisions"
if "`variable'"=="hea2"						local label "Proportion of hhs could not access health services when needed"
if "`variable'"=="heal3"					local label "Self-reported vaccination rates"
if "`variable'"=="hea4"						local label "Percentage of respondents not vaccinated nor willing to get one (vaccination reluctancy)"
if "`variable'"=="hea9"						local label "Indicator of effects on mental health during the pandemic"
if "`variable'"=="hea10"					local label "Has received psychological support to address emotional needs"
if "`variable'"=="int_cost"					local label "Percentage of households that report issues with internet connection due to high cost of internet"
if "`variable'"=="power_outages"			local label "Percentage of households that report issues with internet connection due to power outages"
if "`variable'"=="old_user"					local label "Existing users of mobile wallet"
if "`variable'"=="new_user"					local label "New users of mobile wallet"
if "`variable'"=="total_users"				local label "Total users of mobile wallet"
if "`variable'"=="increase_banking"			local label "Percentage of respondents who indicate an increase in the use of mobile banking"
if "`variable'"=="increase_apps"			local label "Percentage of respondents who indicate an increase in the use of apps/webpage for transactions"
if "`variable'"=="pp_formal"			 	local label "Percentage point change in employed population with formal job"
if "`variable'"=="activo1"			 		local label "labor participation"
if "`variable'"=="activo0"			 		local label "Pre-pandemic labor participation"
if "`variable'"=="ocu_pea1"			 		local label "employment rate"
if "`variable'"=="ocu_pea0"			 		local label "Pre-pandemic employment rate"
if "`variable'"=="ocupado1"			 		local label "comparable employment"
if "`variable'"=="ocupado0"			 		local label "Comparable employment UNDP pre-pandemic"
if "`variable'"=="ocu0_desoc1"			 	local label "Occupied to Unoccupied Transition"
if "`variable'"=="ocu0_inac1"			 	local label "Occupied to left the labor force"





if "`variable'"=="income_red" 				local module "Income"
if "`variable'"=="income_eme_gov_pand"  	local module "Income"
if "`variable'"=="fs_savings" 				local module "Coping"
if "`variable'"=="fs_rent_obligations"  	local module "Coping"
if "`variable'"=="fs_new_labor" 			local module "Coping"
if "`variable'"=="fs_child_labor" 			local module "Coping"
if "`variable'"=="run_out_food" 			local module "Food insecurity"
if "`variable'"=="run_out_food_pre_pan" 	local module "Food insecurity"
if "`variable'"=="income_reg_gov_prepand" 	local module "Income"
if "`variable'"=="income_reg_gov_pand"    	local module "Income"
if "`variable'"=="regular_CCT"            	local module "Income"
if "`variable'"=="attendance_prepan_6_17" 	local module "Education"
if "`variable'"=="pp_attendance"			local module "Education"
if "`variable'"=="attendance_6_17" 		  	local module "Education"
if "`variable'"=="face_to_face_classes_6_17" local module "Education"
if "`variable'"=="attendance_prepan_1_5"    local module "Education"
if "`variable'"=="attendance_1_5" 			local module "Education"
if "`variable'"=="learning_less" 			local module "Education"
if "`variable'"=="learning_same" 			local module "Education"
if "`variable'"=="percep_inseg_violencia"  	local module "Coping"
if "`variable'"=="aumento_v14_05" 			local module "Coping"
if "`variable'"=="aumento_v14_06"			local module "Coping"
if "`variable'"=="lost"						local module "Gender"
if "`variable'"=="aumento_domestica"		local module "Gender"
if "`variable'"=="toma_dec_gasto0"			local module "Gender"
if "`variable'"=="toma_dec_gasto1"			local module "Gender"
if "`variable'"=="hea2"						local module "Health"
if "`variable'"=="heal3"					local module "Health"
if "`variable'"=="hea4"						local module "Health"
if "`variable'"=="hea9"						local module "Health"
if "`variable'"=="hea10"					local module "Health"
if "`variable'"=="int_cost"					local module "Digital"
if "`variable'"=="power_outages"			local module "Digital"
if "`variable'"=="old_user"					local module "Digital"
if "`variable'"=="new_user"					local module "Digital"
if "`variable'"=="total_users"				local module "Digital"
if "`variable'"=="increase_banking"			local module "Digital"
if "`variable'"=="increase_apps"			local module "Digital"
if "`variable'"=="pp_formal"			 	local module "Labor"
if "`variable'"=="perdida01"				local module "Labor"
if "`variable'"=="ganancia01"				local module "Labor"
if "`variable'"=="formal0"					local module "Labor"
if "`variable'"=="formal1"					local module "Labor"
if "`variable'"=="horas1"					local module "Labor"
if "`variable'"=="horas0"					local module "Labor"
if "`variable'"=="workhome"					local module "Labor"
if "`variable'"=="activo1"			 		local module "Labor"
if "`variable'"=="activo0"			 		local module "Labor"
if "`variable'"=="ocu_pea1"			 		local module "Labor"
if "`variable'"=="ocu_pea0"			 		local module "Labor"
if "`variable'"=="ocupado1"			 		local module "Labor"
if "`variable'"=="ocupado0"			 		local module "Labor"
if "`variable'"=="ocu0_desoc1"			 	local module "Labor"
if "`variable'"=="ocu0_inac1"			 	local module "Labor"





 
 
