/*==================================================
project:       
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
version 17
drop _all

global path "C:\Users\WB585318\WBG\Javier Romero - Panama\HFPS\LC2 presentation Ph2w2"
global data "$path\data"
global dos  "C:\Users\WB585318\OneDrive - Universidad de los Andes\WB\Git_repositories\HFS_WI-II_LC2"
global results "$path\results"
global w1 	"$data\Wave 1"
global w2 	"$data\Wave 2"



*preserve				
	tempfile tablas
	tempname ptablas
	postfile `ptablas' str100(Country_id Country_name Wave Module Variable Indicator Cut) Value Numerator Demoninator using `tablas', replace

/*==================================================
              1: first wave 
==================================================*/

local countries 501 502 503 504 505 506 507 509 510 520 540 560 570 591 592 593 595 598 758 767 809 876

foreach country of local countries {

use "$w1\\`country'_PH2W1_CT_Casos", replace 

*save "$w1\\`country'_PH2W1_CT_Casos", replace 
merge 1:1 folio using "$w1\\`country'_PH2W1_CT_Ninos", force 
drop _merge 
destring folio, replace 
cap merge 1:1 folio using "$w1\Roster\hijos\\`country'_PH2W1_RD_hijos", force 
qui include "$dos\01. variables HFS WI.do" // gracias por explicarme

local wave w1
*--------------------------------indicators-------------------------------------


*Percentages 
local cuts total  
local variables income_red income_eme_gov_pand fs_savings fs_rent_obligations fs_new_labor fs_child_labor run_out_food run_out_food_pre_pan /*
				*/income_reg_gov_prepand income_reg_gov_pand percep_inseg_violencia aumento_v14_05 aumento_v14_06 
	foreach cut of local cuts{
		foreach variable of local variables {
		    include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w1] if `cut'==1
			local value = r(mean)*100
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
		}
	}
	
local cuts total urban rural male female primary_hh secondary_hh terciary_hh publico1 privado1 mixto1		
 local variables attendance_6_17 face_to_face_classes_6_17 attendance_prepan_1_5 attendance_1_5 learning_less learning_same
 
		foreach cut of local cuts{
			foreach variable of local variables {
		   
			include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w1] if `cut'==1
			local value = r(mean)*100
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
			}	
		}
		

local cuts total male female primary secondary terciary age_18_24 age_25_54 age_55_65 mother_0_5	
 local variables activo1 activo0 ocu_pea0 ocupado1 ocupado0 ocu0_desoc1 ocu0_inac1 perdida01 ganancia01 workhome lost hea2 heal3 hea4 old_user new_user  

 
		foreach cut of local cuts{
			foreach variable of local variables {
		   
			include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w1] if `cut'==1
			local value = r(mean)*100
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
			}	
		}	

local cuts total male female primary secondary terciary age_18_24 age_25_54 age_55_65 mother_0_5	
 local variables horas0 horas1

 
		foreach cut of local cuts{
			foreach variable of local variables {
		   
			include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w1] if `cut'==1
			local value = r(mean)
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
			}	
		}	
		
*Percentage point change 


 local cut total 
 local variable regular_CCT
 local variable1 income_reg_gov_prepand
 local variable2 income_reg_gov_pand
		qui include "$dos\03. formats.do"
		sum `variable1' [iw=w_hh_ph2w1], meanonly
		local prepan = r(mean)*100
		sum `variable2' [iw=w_hh_ph2w1], meanonly
		local pan = r(mean)*100
	
		local value = `pan' - `prepan'
		post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (.) (.)

 local cut total 
 local variable pp_attendance 
 local variable1 attendance_prepan_6_17
 local variable2 attendance_6_17
 
		qui include "$dos\03. formats.do"
		sum `variable1' [iw=w_hh_ph2w1], meanonly
		local prepan = r(mean)*100
		sum `variable2' [iw=w_hh_ph2w1], meanonly
		local pan = r(mean)*100
	
		local value = `pan' - `prepan'
		post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (.) (.)
 		
		
 local cuts total male female primary secondary terciary age_18_24 age_25_54 age_55_65 mother_0_5
 local variable pp_formal
 local variable1 formal0
 local variable2 formal1
 
 foreach cut of local cuts{
		qui include "$dos\03. formats.do"
		sum `variable1' [iw=w_hh_ph2w1], meanonly
		local prepan = r(mean)*100
		sum `variable2' [iw=w_hh_ph2w1], meanonly
		local pan = r(mean)*100
	
		local value = `pan' - `prepan'
		post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (.) (.)
 }		
				
}

/*==================================================
              2: second wave 
==================================================*/

local countries 501 502 503 504 505 506 507 509 510 520 540 560 570 591 592 593 595 598 758 767 809 876

foreach country of local countries {

use "$w2\\`country'_PH2W2_CP_Casos", replace 
merge 1:1 folio using "$w2\\`country'_PH2W2_CP_Ninos", force 
drop _merge 
cap merge 1:1 folio using "$w2\Roster\hijos\\`country'_PH2W2_RD_hijos", force 
qui include "$dos\\02. variables HFS WII.do"
local wave w2

* Percentages 
local cuts total 
local variables income_red income_eme_gov_pand fs_savings fs_rent_obligations fs_new_labor fs_child_labor run_out_food run_out_food_pre_pan /*
				*/ income_reg_gov_prepand income_reg_gov_pand percep_inseg_violencia aumento_v14_05 aumento_v14_06  

	foreach cut of local cuts{
		foreach variable of local variables {
		    
			qui include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w2] if `cut'==1
			local value = r(mean)*100
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
		}
	}
* with cuts 	
local cuts total urban rural male female primary_hh secondary_hh terciary_hh publico1 privado1 mixto1		
local variables attendance_6_17 face_to_face_classes_6_17 attendance_prepan_1_5 attendance_1_5 learning_less learning_same 		
		foreach cut of local cuts{
			foreach variable of local variables {
		    
			qui include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w2] if `cut'==1
			local value = r(mean)*100
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
			}	
		}
		
local cuts total male female primary secondary terciary age_18_24 age_25_54 age_55_65 mother_0_5		
 local variables activo1 activo0 ocu_pea0 ocupado1 ocupado0 ocu0_desoc1 ocu0_inac1 perdida01 ganancia01 workhome lost aumento_domestica toma_dec_gasto0 toma_dec_gasto1 hea2 heal3 hea4 hea9 hea10 /*
		*/  old_user new_user   
 
		foreach cut of local cuts{
			foreach variable of local variables {
		   
			include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w2] if `cut'==1
			local value = r(mean)*100
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
			}	
		}	
		
local cuts total male female primary secondary terciary age_18_24 age_25_54 age_55_65 mother_0_5	
 local variables horas0 horas1

		foreach cut of local cuts{
			foreach variable of local variables {
		   
			include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w2] if `cut'==1
			local value = r(mean)
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
			}	
		}	
		
*Percentage point change 
		
*Percentage point change  

 local cut total 
 local variable regular_CCT
 local variable1 income_reg_gov_prepand
 local variable2 income_reg_gov_pand
		qui include "$dos\03. formats.do"
		sum `variable1' [iw=w_hh_ph2w2], meanonly
		local prepan = r(mean)*100
		sum `variable2' [iw=w_hh_ph2w2], meanonly
		local pan = r(mean)*100
	
		local value = `pan' - `prepan'
		post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (.) (.)

 local cut total 
 local variable pp_attendance 
 local variable1 attendance_prepan_6_17
 local variable2 attendance_6_17
 
		qui include "$dos\03. formats.do"
		sum `variable1' [iw=w_hh_ph2w2], meanonly
		local prepan = r(mean)*100
		sum `variable2' [iw=w_hh_ph2w2], meanonly
		local pan = r(mean)*100
	
		local value = `pan' - `prepan'
		post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (.) (.)
 			
		
local cuts total male female primary secondary terciary age_18_24 age_25_54 age_55_65 mother_0_5	
 local variable pp_formal
 local variable1 formal0
 local variable2 formal1
 
 foreach cut of local cuts{
		qui include "$dos\03. formats.do"
		sum `variable1' [iw=w_hh_ph2w2], meanonly
		local prepan = r(mean)*100
		sum `variable2' [iw=w_hh_ph2w2], meanonly
		local pan = r(mean)*100
	
		local value = `pan' - `prepan'
		post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (.) (.)
 }
}

postclose `ptablas'
use `tablas', clear
save `tablas', replace 


/*==================================================
              4: LAC average 
==================================================*/


	tempfile tablas1
	tempname ptablas1
	postfile `ptablas1' str100(Country_id Country_name Wave Module Variable Indicator Cut) Value Numerator Demoninator using `tablas1', replace

	
	*use `tablas'
    local waves w1 w2 
	local variables income_red income_eme_gov_pand fs_savings fs_rent_obligations fs_new_labor fs_child_labor run_out_food run_out_food_pre_pan /*
					*/ income_reg_gov_prepand income_reg_gov_pand percep_inseg_violencia aumento_v14_05 aumento_v14_06 attendance_6_17 /*
					*/ face_to_face_classes_6_17 attendance_prepan_1_5 attendance_1_5 learning_less learning_same regular_CCT /*
					*/ perdida01 ganancia01 horas0 horas1 workhome lost aumento_domestica toma_dec_gasto0 toma_dec_gasto1 hea2 heal3 hea4 hea9 hea10 /*
					*/ old_user new_user  activo1 activo0 ocu_pea0 ocupado1 ocupado0 ocu0_desoc1 ocu0_inac1
	
	local cuts total urban rural male female primary_hh secondary_hh terciary_hh publico1 privado1 mixto1
	
	foreach wave of local waves {
		foreach variable of local variables { 
			foreach cut of local cuts {
			qui include "$dos\03. formats.do"
			sum Numerator if  Wave=="`wave'" & Variable=="`variable'" & Cut=="`cut'"
			local numer = r(sum)
			sum Demoninator if  Wave=="`wave'" & Variable=="`variable'" & Cut=="`cut'"
			local denom = r(sum)
			local value = ( `numer' / `denom' ) *100
			if "variable"=="horas0" local value = ( `numer' / `denom' )
			if "variable"=="horas1" local value = ( `numer' / `denom' )
			sum Value  if Wave=="`wave'" & Variable=="`variable'" & Cut=="`cut'"
			local mean_lac = r(mean)
			
			post `ptablas1' ("LAC_W") ("LAC_W") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer')  (`denom') 
			post `ptablas1' ("LAC_S") ("LAC_S") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`mean_lac') (`numer')  (`denom') 
			}
		}
	
	}	
	
	
	postclose `ptablas1'
	use `tablas1', clear
	save `tablas1', replace 
	append using `tablas'
	
export excel using "${results}/00.HFPS.xlsx", sh("indicadores", replace)  firstrow(var)

*restore



/*==================================================
              3: LC2 average 
==================================================*/



