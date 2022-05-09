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



global path "C:\Users\WB585318\WBG\Javier Romero - Panama\HFPS\LC2 presentation Ph2w2"
global data "$path\data"
global dos  "C:\Users\WB585318\OneDrive - Universidad de los Andes\WB\Git_repositories\HFS_WI-II_LC2"
global results "$path\results"
global w1 	"$data\Wave 1"
global w2 	"$data\Wave 2"

/*==================================================
              1: first wave 
==================================================*/
*local country 540
*use "$w1\\`country'_PH2W1_CT_Casos", replace 
*merge 1:1 folio using "$w1\\`country'_PH2W1_CT_Casos"

*----------1.1: cuts 
*gen mother_0_5
*label variable mother_0_5 "Mother of children 0-5years old"

* 3.03 Edad
tab u03_03, m

g age_18_24 = inrange(u03_03,18,24)
label variable age_18_24 "Aged 18-24 years old"

g age_25_54 = inrange(u03_03,25,54)
label variable age_25_54 "Aged 25-54 years old"

g age_55_65 = inrange(u03_03,55,65)
label variable age_55_65 "Aged 55-65 years old"

* 3.04 Sexo

tab u03_04,m

g female = (u03_04==2)
g male   = (u03_04==1)

* nivel educativo 
tab u03_09a, g(u309_)

* interviwee
*primary less
 if inlist(`country',501,503,505,510,758,767,502,506)  {
g primary_less = (u309_1==1) | (u309_2==1) 
label variable primary_less "Primary or less educated"
 }

 if inlist(`country',570,876,592,504,507,520)  {
g primary_less = (u309_1==1) | (u309_2==1) | (u309_3==1)
label variable primary_less "Primary or less educated" 
 }
 
*secondary  
if inlist(`country',503)  { 
g secondary =  (u309_3==1) | (u309_5==1)
label variable secondary "Secondary education"
}

 if inlist(`country',505,510,758,767,502)  {
g secondary =  (u309_3==1) | (u309_4==1)
label variable secondary "Secondary education"
 }
 
  if inlist(`country',570,876,592)  {
g secondary =  (u309_4==1) | (u309_5==1)
label variable secondary "Secondary education"
  }

  if inlist(`country',504,507)  {
g secondary =  (u309_4==1) | (u309_5==1) | (u309_6==1)
label variable secondary "Secondary education"
  }
* mexico   
  if inlist(`country',520)  {
g secondary =  (u309_4==1) | (u309_5==1) | (u309_6==1) | (u309_7==1)
label variable secondary "Secondary education"
  }  
  
 if inlist(`country',501,506)  {
g secondary =  (u309_3==1) | (u309_4==1) | (u309_5==1) 
label variable secondary "Secondary education"
  }
  
* terciary 
if inlist(`country',503) {
g terciary = (u309_4==1) | (u309_6==1) 
label variable terciary "Terciary education"
}

if inlist(`country',505,510) { 
g terciary = (u309_5==1) | (u309_6==1) 
label variable terciary "Terciary education"
}

  if inlist(`country',570)  {
g terciary = (u309_6==1) 
label variable terciary "Terciary education"
  }

  if inlist(`country',506)  {
g terciary = (u309_6==1) | (u309_7==1)
label variable terciary "Terciary education"
  }

  if inlist(`country',520)  {
g terciary = (u309_8==1) | (u309_9==1) | (u309_10==1) | (u309_11==1)
label variable terciary "Terciary education"
  }  
  
  if inlist(`country',501,876,592)  {
g terciary = (u309_6==1) | (u309_7==1) | (u309_8==1)
label variable terciary "Terciary education"
  }

  if inlist(`country',504,507)  {
g terciary = (u309_7==1) | (u309_8==1)
label variable terciary "Terciary education"
  }  
  
* Santa Lucia, Dominica  
if inlist(`country',758,767,502)  {
g terciary = (u309_5==1) | (u309_6==1) | (u309_7==1)
label variable terciary "Terciary education"
}  

* head ------------------

 tab u03_10a, g(u0310_)
*primary 
if inlist(`country',501,503,505,510,758,767,502,506) { 
g hh_primary_less = (u0310_1==1) | (u0310_2==1) 
label variable primary_less "Primary or less educated"
}

  if inlist(`country',570,876,592,504,507,520)  {
g hh_primary_less = (u0310_1==1) | (u0310_2==1) | (u0310a_3==1)
label variable primary_less "Primary or less educated"
  }

* secondary 
if inlist(`country',503) {
g hh_secondary = (u0310_3==1) | (u0310_5==1) 
label variable secondary "Secondary education"
}

if inlist(`country',505,510,758,767,502) { 
g hh_secondary = (u0310_3==1) | (u0310_4==1) 
label variable secondary "Secondary education"
}

  if inlist(`country',570,876,592)  {
g hh_secondary = (u0310_4==1) | (u0310_5==1) 
label variable secondary "Secondary education"
  }
  
  if inlist(`country',504,507)  {
g hh_secondary = (u0310_4==1) | (u0310_5==1) | (u0310_6==1) 
label variable secondary "Secondary education"
  }
  
  if inlist(`country',501,506)  {
g hh_secondary = (u0310_3==1) | (u0310_4==1) | (u0310_5==1)  
label variable secondary "Secondary education"
  } 

* mexico   
 if inlist(`country',520)  {
g secondary =  (u0310_4==1) | (u0310_5==1) | (u0310_6==1) | (u0310_7==1)
label variable secondary "Secondary education"
  }  
  
*terciary 
if inlist(`country',503) {
g hh_terciary = (u0310_4==1) | (u0310_6==1) 
label variable terciary "Terciary education" 
} 

if inlist(`country',505,510) { 
g hh_terciary = (u0310_5==1) | (u0310_6==1) 
label variable terciary "Terciary education" 
 }

  if inlist(`country',570)  {
g hh_terciary = (u0310_6==1) 
label variable terciary "Terciary education" 
 } 
 
  if inlist(`country',506)  {
g hh_terciary = (u0310_6==1) | (u0310_7==1)  
label variable terciary "Terciary education" 
 } 
 
  if inlist(`country',501,876,592)  {
g hh_terciary = (u0310_6==1) | (u0310_7==1) | (u0310_8==1) 
label variable terciary "Terciary education" 
 } 

   if inlist(`country',504,507)  {
g hh_terciary = (u0310_7==1) | (u0310_8==1) 
label variable terciary "Terciary education" 
 } 
* Mexico 
  if inlist(`country',520)  {
g terciary = (u0310_8==1) | (u0310_9==1) | (u0310_10==1) | (u0310_11==1)
label variable terciary "Terciary education"
  }  
 
if inlist(`country',758,767,502)  {
g hh_terciary =  (u0310_5==1) | (u0310_6==1) | (u0310_7==1) 
label variable terciary "Terciary education" 
 }  
*------
 
if  inlist(`country',509,540,591,593,595,598,809)  {
 g primary_less = (u309_1==1) | (u309_2==1) | (u309_3==1)
label variable primary_less "Primary or less educated"

g secondary = (u309_4==1) | (u309_5==1) | (u309_6==1)
label variable secondary "Secondary education"

g terciary = (u309_7==1) | (u309_8==1) 
label variable terciary "Terciary education"

 
 
* nivel educativo HH head 

 tab u03_10a, g(u0310_)

g hh_primary_less = (u0310_1==1) | (u0310_2==1) | (u0310_3==1)
label variable primary_less "Primary or less educated"

g hh_secondary = (u0310_4==1) | (u0310_5==1) | (u0310_6==1)
label variable secondary "Secondary education"

g hh_terciary = (u0310_7==1) | (u0310_8==1) 
label variable terciary "Terciary education" 
 }
 
* Area 
tab u03_08, nolabel
g urban = (u03_08==1)
g rural = (u03_08==2)

*type of educational institution 
g public  =.
g private =.

*-------------------------------Modules 

*----------2.2: Labor Market 

*----------2.3.1: Income

local module income 

* Percentage of households who report a reduction of income since:
tab u06_17
g income_red = (u06_17==3)
label variable income_red "Beginning of 2021"

* Percentage of households who received emergency government transfers 
tab u06_06
g income_eme_gov_pand=(u06_06==1)

* Percentage point change of households that received regular government transfers 
* before the pandemic
tab u06_03, m
g income_reg_gov_prepand = (u06_03==1)
* during the pandemic 
g income_reg_gov_pand = (u06_04==1)

*----------2.3.2: Financial stress


* Percentage of household that since 2021 to cover essential expenses (food, health or education) have been forced to:
*Use savings 
g fs_savings = .
*Stop paying rent/mortgage or financial obligations
g fs_rent_obligations = .
*Insert a new HH member to the labor force
g fs_new_labor = .
*Insert a HH member under 18 to the labor force 
g fs_child_labor = .

*----------2.4: Food insecurity 
g run_out_food = .


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