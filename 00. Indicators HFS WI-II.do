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



preserve				
	tempfile tablas
	tempname ptablas
	postfile `ptablas' str100(Country_id Country_name Wave Module Variable Indicator Cut) Value Numerator Demoninator using `tablas', replace

/*==================================================
              1: first wave 
==================================================*/

local countries 501 502 503 504 505 506 507 509 510 520 540 560 570 591 592 593 595 598 758 767 809 876

foreach country of local countries {

use "$w1\\`country'_PH2W1_CT_Casos", replace 
*destring folio, replace 
*save "$w1\\`country'_PH2W1_CT_Casos", replace 
merge 1:1 folio using "$w1\\`country'_PH2W1_CT_Ninos", force 
include "$dos\01. variables HFS WI.do" // gracias por explicarme

local wave w1
*--------------------------------indicators-------------------------------------
local module income_financial_food
local cuts total 

*Percentages income reduction, emergency CCT. Run out of food. 
local variables income_red income_eme_gov_pand fs_savings fs_rent_obligations fs_new_labor fs_child_labor run_out_food income_reg_gov_prepand income_reg_gov_pand percep_inseg_violencia aumento_v14_05 aumento_v14_06 
	foreach cut of local cuts{
		foreach variable of local variables {
		    include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w1] if `cut'==1
			local value = r(mean)*100
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
		}

local cuts total urban rural male female primary_hh secondary_hh terciary_hh publico1 privado1 mixto1		
		
		foreach cut of local cuts{
		foreach variable of local variables {
		    local attendance_6_17 face_to_face_classes_6_17 attendance_prepan_1_5 attendance_1_5 learning_less learning_same
			include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w1] if `cut'==1
			local value = r(mean)*100
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
		}	
}			
		
*Percentage point change of households that received regular government transfers (pre and during pandemic) 

 local cut total 
		sum income_reg_gov_prepand [iw=w_hh_ph2w1], meanonly
		local prepan = r(mean)*100
		sum income_reg_gov_pand [iw=w_hh_ph2w1], meanonly
		local pan = r(mean)*100
	
		local value = `pan' - `prepan'
		post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("regular_CCT") ("Percentage point change of households that received regular government transfers") ("`cut'") (`value') (.) (.)
	} /*cierro cut*/


}

/*==================================================
              2: second wave 
==================================================*/

local countries 501 502 503 504 505 506 507 509 510 520 540 570 591 592 593 595 598 758 767 809 876

foreach country of local countries {
	local country 507
use "$w2\\`country'_PH2W2_CP_Casos", replace 
 
merge 1:1 folio using "$w2\\`country'_PH2W2_CP_Ninos", force 
include "$dos\\02. variables HFS WII.do"
local wave w2


local cuts total 

*Percentages income reduction, emergency CCT. Run out of food. 

	foreach cut of local cuts{
		foreach variable of local variables {
		    local variables income_red income_eme_gov_pand fs_savings fs_rent_obligations fs_new_labor fs_child_labor run_out_food income_reg_gov_prepand income_reg_gov_pand percep_inseg_violencia aumento_v14_05 aumento_v14_06  
			include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w2] if `cut'==1
			local value = r(mean)*100
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
		}

local cuts total urban rural male female primary_hh secondary_hh terciary_hh publico1 privado1 mixto1		
		
		foreach cut of local cuts{
		foreach variable of local variables {
		    local attendance_6_17 face_to_face_classes_6_17 attendance_prepan_1_5 attendance_1_5 learning_less learning_same 
			include "$dos\03. formats.do"
			sum `variable' [iw=w_hh_ph2w2] if `cut'==1
			local value = r(mean)*100
			local numer = r(sum)
			local denom = r(sum_w)
			post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom') 
		}	
}		
		
*Percentage point change of households that received regular government transfers (pre and during pandemic) 

 local cut total 
		sum income_reg_gov_prepand [iw=w_hh_ph2w2], meanonly
		local prepan = r(mean)*100
		sum income_reg_gov_pand [iw=w_hh_ph2w2], meanonly
		local pan = r(mean)*100
	
		local value = `pan' - `prepan'
		post `ptablas' ("`country'") ("`name'") ("`wave'") ("`module'") ("regular_CCT") ("Percentage point change of households that received regular government transfers") ("`cut'") (`value') (.) (.)
	} /*cierro cut*/
}

postclose `ptablas'
use `tablas', clear
save `tablas', replace 


/*==================================================
              4: LAC average 
==================================================*/


	tempfile tablas1
	tempname ptablas1
	postfile `ptablas1' str100(Country Wave Module Variable Indicator Cut) Value Numerator Demoninator using `tablas1', replace

	
	use `tablas'
    local waves w1 w2 
	local variables income_red income_eme_gov_pand fs_savings fs_rent_obligations fs_new_labor fs_child_labor run_out_food income_reg_gov_prepand income_reg_gov_pand percep_inseg_violencia aumento_v14_05 aumento_v14_06 attendance_6_17 face_to_face_classes_6_17 attendance_prepan_1_5 attendance_1_5 learning_less learning_same 
	local cuts total urban rural male female primary_hh secondary_hh terciary_hh publico1 privado1 mixto1
	
	foreach wave of local waves {
		foreach variable of local variables { 
			foreach cut of local cuts {
		
			sum Numerator if  `wave' == Wave & `variable' == Variable & `cut'==Cut
			local numer = r(sum)
			sum Numerator if  `wave' == Wave & `variable' == Variable & `cut'==Cut
			local denom = r(sum)
			local value = (`numer' \ `denom' )*100
			
			post `ptablas' ("LAC") ("LAC") ("`wave'") ("`module'") ("`variable'") ("`label'") ("`cut'") (`value') (`numer') (`denom')
			}
		}
	} 
	append using `tablas'
	postclose `ptablas1'
	use `tablas1', clear
	save `tablas1', replace 

	
export excel using "${results}/00.HFPS.xlsx", sh("indicadores", replace)  firstrow(var)

restore



/*==================================================
              3: LC2 average 
==================================================*/



