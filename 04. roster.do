/*==================================================
project:       
Author:        Angela Lopez 
E-email:       alopezsanchez@worldbank.org
url:           
Dependencies:  
----------------------------------------------------
Creation Date:     17 May 2022 - 12:03:54
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


local countries 501 502 503 504 505 506 507 509 510 520 540 560 570 591 592 593 595 598 758 767 809 876

foreach country of local countries {
use "$w2\Roster\\`country'_PH2W2_RD_Ninos", replace 

gen  parent_0_5 = (v07_19>=0 & v07_19<=5) & v07_20==1
egen parent_0_5_hh = max(parent_0_5) , by(folio) 

gen  parent_0_12 = (v07_19>=0 & v07_19<=12) & v07_20==1
egen parent_0_12_hh = max(parent_0_12) , by(folio) 

keep if id_nna ==1
keep folio parent_0_5_hh parent_0_12_hh

save "$w2\Roster\hijos\\`country'_PH2W2_RD_hijos", replace 
}

local countries 501 502 503 504 505 506 507 509 510 520 540 560 570 591 592 593 595 598 758 767 809 876

foreach country of local countries {

use "$w1\Roster\\`country'_PH2W1_RD_Ninos_roster", replace 

gen  parent_0_5 = (u07_19>=0 & u07_19<=5) & u07_20==1
egen parent_0_5_hh = max(parent_0_5) , by(folio) 

gen  parent_0_12 = (u07_19>=0 & u07_19<=12) & u07_20==1
egen parent_0_12_hh = max(parent_0_12) , by(folio) 

keep if id_nna ==1
keep folio parent_0_5_hh parent_0_12_hh
destring folio, replace 
duplicates drop
save "$w1\Roster\hijos\\`country'_PH2W1_RD_hijos", replace 

}

