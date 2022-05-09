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

if "`variable'"=="income_red" 			local label "Percentage of households who report a reduction of income since the onset of the pandemic"
if "`variable'"=="income_eme_gov_pand"  local label "Percentage of households who received emergency government transfers "
if "`variable'"=="fs_savings" 			local label "Percentage of household that since 2021 to cover essential expenses (food, health or education) have been forced to"
if "`variable'"=="incofs_rent_obligations" local label "Percentage of household that since 2021 to cover essential expenses (food, health or education) have been forced to"
if "`variable'"=="fs_new_labor" 		local label "Percentage of household that since 2021 to cover essential expenses (food, health or education) have been forced to"
if "`variable'"=="fs_child_labor" 		local label "Percentage of household that since 2021 to cover essential expenses (food, health or education) have been forced to"
if "`variable'"=="run_out_food" 		local label "Percentage of households who run out of food in the last 30 days"
 

 
 
 
 
 
 