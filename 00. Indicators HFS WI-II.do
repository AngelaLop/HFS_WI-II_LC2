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
	postfile `ptablas' str25(Country Wave Module Variable Indicator Cut) Value using `tablas', replace

/*==================================================
              1: first wave 
==================================================*/

local countries 501 502 503 504 505 506 507 509 510 520 540 570 591 592 593 595 598 758 767 809 876

foreach country of local countries {
use "$w1\\`country'_PH2W1_CT_Casos", replace 
merge 1:1 folio using "$w1\\`country'_PH2W1_CT_Casos", force 
include "$dos\01. variables HFS WI.do"
local wave w1

local module income
local module financial_stress
local mudule food_security
local module education 

}


/*==================================================
              2: second wave 
==================================================*/

local countries 501 502 503 504 505 506 507 509 510 520 540 570 591 592 593 595 598 758 767 809 876

foreach country of local countries {
use "$w2\\`country'_PH2W2_CP_Casos", replace 
 
merge 1:1 folio using "$w2\\`country'_PH2W2_CP_Ninos", force 
include "$dos\\02. variables HFS WII.do"
local wave w2


local module income
local module financial_stress
local mudule food_security
local module education 

}


/*==================================================
              3: LC2 average 
==================================================*/


/*==================================================
              4: LAC average 
==================================================*/
