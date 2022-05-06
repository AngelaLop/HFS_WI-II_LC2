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

global path "C:\Users\WB585318\WBG\Javier Romero - Panama\HFPS\Analysis"
global data "C:\Users\WB585318\WBG\LAC High Frequency Phone Survey v.2 - WB Group - PE Shared Folder\Data"
global dos "$path\do-files"
global results "$path\results"
global w1 "$data\Wave 1"
global w2 "$data\Wave 2"


/*==================================================
              1: first wave 
==================================================*/



local countries 501 502 503 504 505 506 507 509 510 520 540 570 591 592 593 595 598 758 767 809 876

foreach country of local countries {
use "$w1\`country'_PH2W2_CP_Casos"
include "$dos\01. variables HFS WI.do"

merge 1:1 folio using "$w1\`country'_PH2W2_CP_Ninos"
local wave w1


}


/*==================================================
              2: second wave 
==================================================*/

local countries 501 502 503 504 505 506 507 509 510 520 540 570 591 592 593 595 598 758 767 809 876

foreach country of local countries {
use "$w2\`country'_PH2W2_CP_Casos"
include "$dos\01. variables HFS WI.do"

merge 1:1 folio using "$w2\`country'_PH2W2_CP_Ninos"
local wave w2


}

