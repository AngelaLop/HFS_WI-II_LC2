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


global path "C:\Users\WB585318\WBG\Javier Romero - Panama\HFPS\Analysis"
global data "C:\Users\WB585318\WBG\LAC High Frequency Phone Survey v.2 - WB Group - PE Shared Folder\Data"
global results "$path\results"
global w1 "$data\Wave 1"
global w2 "$data\Wave 2"


/*==================================================
              1: second wave 
==================================================*/



*----------1.1: cuts 
*gen mother_0_5
*label variable mother_0_5 "Mother of children 0-5years old"

* 3.03 Edad
tab v03_03, m

g age_18_24 = inrange(v03_03,18,24)
label variable age_18_24 "Aged 18-24 years old"

g age_25_54 = inrange(v03_03,25,54)
label variable age_25_54 "Aged 25-54 years old"

g age_55_65 = inrange(v03_03,55,65)
label variable age_55_65 "Aged 55-65 years old"

* 3.04 Sexo

tab u03_04,m

g female = (u03_04==2)
g male   = (u03_04==1)

* nivel educativo 
tab u03_09a, g(u309_)

* 
 if inlist(`country',503,505,510,570)  {
g primary_less = (u309_1==1) | (u309_2==1) 
label variable primary_less "Primary or less educated"

g secondary =  (u309_3==1) | (u309_4==1)
label variable secondary "Secondary education"

g terciary = (u309_5==1) 
label variable terciary "Terciary education"


 tab u03_10a, g(u0310a_)

g hh_primary_less = (u0310a_1==1) | (u0310a_2==1) | (u0310a_3==1)
label variable primary_less "Primary or less educated"

g hh_secondary = (u0310a_4==1) | (u0310a_5==1) | (u0310a_6==1)
label variable secondary "Secondary education"

g hh_terciary = (u0310a_7==1) 
label variable terciary "Terciary education" 
 
 }

  if inlist(`country',501)  {
g primary_less = (u309_1==1) | (u309_2==1) 
label variable primary_less "Primary or less educated"

g secondary =  (u309_3==1) | (u309_4==1) | (u309_5==1) 
label variable secondary "Secondary education"

g terciary = (u309_6==1) | (u309_7==1) | (u309_8==1)
label variable terciary "Terciary education"


 tab u03_10a, g(u0310a_)

g hh_primary_less = (u0310a_1==1) | (u0310a_2==1) 
label variable primary_less "Primary or less educated"

g hh_secondary = (u0310a_3==1) | (u0310a_4==1) | (u0310a_5==1)  
label variable secondary "Secondary education"

g hh_terciary = (u0310a_6==1) | (u0310a_7==1) | (u0310a_8==1) 
label variable terciary "Terciary education" 
 
 }

* Santa Lucia, Dominica  
 if inlist(`country',502,758,767)  {
g primary_less = (u309_1==1) | (u309_2==1) 
label variable primary_less "Primary or less educated"

g secondary =  (u309_3==1) | (u309_4==1)
label variable secondary "Secondary education"

g terciary = (u309_5==1) | (u309_6==1) | (u309_7==1)
label variable terciary "Terciary education"


 tab u03_10a, g(u0310a_)

g hh_primary_less = (u0310a_1==1) | (u0310a_2==1) 
label variable primary_less "Primary or less educated"

g hh_secondary = (u0310a_3==1) | (u0310a_4==1) 
label variable secondary "Secondary education"

g hh_terciary =  (u0310a_5==1) | (u0310a_6==1) | (u0310a_7==1) 
label variable terciary "Terciary education" 
 
 } 
 
* Jamaica, Guyana 
 if inlist(`country',876,592)  {
g primary_less = (u309_1==1) | (u309_2==1) | (u309_3==1) 
label variable primary_less "Primary or less educated"

g secondary =   (u309_4==1) | (u309_5==1)
label variable secondary "Secondary education"

g terciary = (u309_6==1) | (u309_7==1) | (u309_8==1)
label variable terciary "Terciary education"


 tab u03_10a, g(u0310a_)

g hh_primary_less = (u0310a_1==1) | (u0310a_2==1) (u0310a_3==1) | 
label variable primary_less "Primary or less educated"

g hh_secondary = (u0310a_4==1) | (u0310a_5==1) 
label variable secondary "Secondary education"

g hh_terciary =   (u0310a_6==1) | (u0310a_7==1) | (u0310a_8==1) 
label variable terciary "Terciary education" 
 
 } 
 
 
if  inlist(`country',504,506,507,509,520,540,591,593,595,598,809)  {
 g primary_less = (u309_1==1) | (u309_2==1) | (u309_3==1)
label variable primary_less "Primary or less educated"

g secondary = (u309_4==1) | (u309_5==1) | (u309_6==1)
label variable secondary "Secondary education"

g terciary = (u309_7==1) | (u309_8==1) 
label variable terciary "Terciary education"

 
 
* nivel educativo HH head 

 tab u03_10a, g(u0310a_)

g hh_primary_less = (u0310a_1==1) | (u0310a_2==1) | (u0310a_3==1)
label variable primary_less "Primary or less educated"

g hh_secondary = (u0310a_4==1) | (u0310a_5==1) | (u0310a_6==1)
label variable secondary "Secondary education"

g hh_terciary = (u0310a_7==1) | (u0310a_8==1) 
label variable terciary "Terciary education" 
 }
 
* Area 
tab v03_08a, m
g urban = (v03_08a==1)
g rural = (v03_08a==2)

*type of educational institution 
g public  =(v08_03b==1)
g private =(v08_03b==2)

*-------------------------------Modules 

*----------2.2: Labor Market 

*----------2.3.1: Income

local module income 

* Percentage of households who report a reduction of income since:
g income_red = (v06_17a==3)
label variable income_red "Beginning of 2021"

* Percentage of households who received emergency government transfers 
g income_eme_gov_pand=(v06_06a==1)

* Percentage point change of households that received regular government transfers 
* before the pandemic
tab v06_03, m
g income_reg_gov_prepand = (v06_03==1)
* during the pandemic 
g income_reg_gov_pand = (v06_03a==1)

*----------2.3.2: Financial stress

local module financial_stress 

* Percentage of household that since 2021 to cover essential expenses (food, health or education) have been forced to:
*Use savings 
g fs_savings = (v14_01a==1)
*Stop paying rent/mortgage or financial obligations
g fs_rent_obligations = (v14_01b==1)
*Insert a new HH member to the labor force
g fs_new_labor = (v14_02a==1)
*Insert a HH member under 18 to the labor force 
g fs_child_labor = (v14_02b==1)

*----------2.4: Food insecurity 
g run_out_food = (v04_01==1)


*----------2.5: Education
gen chil_06_17 =(w_cha_ph2w2 != .) if inrange(v07_19,6,17)
gen chil_01_05 =(w_cha_ph2w2 != .) if inrange(v08_16,1,5)
* Share of school-age children attending some form of education activities (in person or remotely)
* Change in school attendance
* before the pandemic
g attendance_prepan_6_17 = inlist(v08_02,1,2)
g attendance_6_17 = v08_03==1 & ((v08_05==1 | v08_05==2 & v08_06==1) | (v08_08==1 | v08_08==2 & v08_10==1))

* schools offer face to face classes 
g face_to_face_classes_6_17 = v08_04==1

*Under 5 years old children attending some form of education activities
g attendance_prepan_1_5 = (v08_17==1) | (v08_17==2 & v08_17==2)
g attendance_1_5 = (v08_19==1) | (v08_19==2 & v08_20==2| v08_20==13 )

*Perception of children learning in relation to before the pandemic 

g learning_much_less =(v08_12==1)
g learning_less =(v08_12==2)
g learning_same =(v08_12==3)
g learning_more =(v08_12==4)
g learning_much_more =(v08_12==5)
g learning_DK =(v08_12==98)

*----------2.6: Gender

*----------2.7: Health

*----------3.7: Digital and finance




exit
/* End of do-file */

><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><

Notes:
1.
2.
3.


Version Control:


