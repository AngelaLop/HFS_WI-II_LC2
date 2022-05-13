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
              1: second wave 
==================================================*/



*----------1.1: cuts 
*gen mother_0_5
*label variable mother_0_5 "Mother of children 0-5years old"
g total = 1
* 3.03 Edad
tab v03_03, m

g age_18_24 = inrange(v03_03,18,24)
label variable age_18_24 "Aged 18-24 years old"

g age_25_54 = inrange(v03_03,25,54)
label variable age_25_54 "Aged 25-54 years old"

g age_55_65 = inrange(v03_03,55,65)
label variable age_55_65 "Aged 55-65 years old"

* 3.04 Sexo

tab v03_04,m

g female = (v03_04==2)
g male   = (v03_04==1)

* nivel educativo  
*tab v03_09a, g(v309_)
** Nivel de educación del informante - 3 niveles (máximo alcanzado completo o incompleto)

cap lab drop v03_09a v03_10a
tab1 v03_09a v03_09b, m	

gen		primary = .
gen 	secondary = .
g 		terciary = .

// 501 Belice 
if `country'==501 {
	replace primary   = inlist(v03_09a, 50101,50102)
	replace secondary = v03_09a == 50103
	replace terciary  = inrange(v03_09a, 50104,50208)
}
// 502 Guatemala 
if `country'==502 {
	replace primary   = inlist(v03_09a, 50201,50202)
	replace secondary = inlist(v03_09a, 50203,50204) 
	replace terciary  = inrange(v03_09a, 50205,50207)
}	
// 503 El Salvador 
if `country'==503 {
	replace primary   = v03_09a == 50300
	replace primary   = v03_09a == 50301 & inrange(v03_09b,1,6) 
	replace secondary = v03_09a == 50301 & inrange(v03_09b,7,9)
	replace secondary = v03_09a == 50302
	replace terciary  = inrange(v03_09a, 50303,50305) 
}	
// 504 Honduras 
if `country'==504 {
	replace primary   = inlist(v03_09a, 50400,50401)
	replace secondary = inrange(v03_09a, 50402,50404) 
	replace terciary  = inrange(v03_09a, 50405,50407)
}
// 505 Nicaragua - CHECK VALUES OF v03_09a, v03_10a
if `country'==505 {
	replace primary   = inlist(v03_09a, 50500,50501)
	replace secondary = v03_09a == 50502
	replace terciary  = inrange(v03_09a, 50503,50505)
}	
// 506 Costa Rica
if `country'==506 {
	replace primary   = inlist(v03_09a, 50600,50601)
	replace secondary = inlist(v03_09a, 50602,50603) 
	replace terciary  = inrange(v03_09a, 50604,50606)
}
// 507 Panama
if `country'==507 {
	replace primary   = inlist(v03_09a, 50701,50702)
	replace secondary = inrange(v03_09a, 50703,50706) 
	replace terciary  = inlist(v03_09a, 50707,50708)
}
// 509 Haití 
if `country'==509 {
	replace primary   = inrange(v03_09a, 50901,50908)
	replace secondary = inrange(v03_09a, 50909,50915) 
	replace terciary  = v03_09a==50916
	
}
// 510 Perú
if `country'==510 {
	replace primary   = inlist(v03_09a, 51000,51001)
	replace secondary = v03_09a == 51002
	replace terciary  = inrange(v03_09a, 51003,51005)
}	
// 520 Mexico
if `country'==520 {
	replace primary   = inrange(v03_09a, 52001,52003)
	replace secondary = inlist(v03_09a, 52004,52005,52007,52008) 
	replace terciary  = inrange(v03_09a, 52009, 52013) | v03_09a == 52006 
}
// 540 Argentina 
if `country'==540 {
	replace primary   = inrange(v03_09a, 54001,54003)
	replace primary   = v03_09a == 54004 & inrange(v03_09b,1,7) 
	replace secondary = v03_09a == 54004 & inrange(v03_09b,8,9) 
	replace secondary = inlist(v03_09a, 54005,54006) 
	replace terciary  = inrange(v03_09a, 54007,54009) 
}
// 560 Chile
if `country'==560 {
	replace primary   = inrange(v03_09a, 56000,56006)
	replace secondary = inrange(v03_09a, 56007,56010)
	replace terciary  = inrange(v03_09a, 56011,56016)
}
// 570 Colombia
if `country'==570 {
	replace primary   = inrange(v03_09a, 57001,57003)
	replace secondary = inlist(v03_09a, 57004,57005) 
	replace terciary  = inlist(v03_09a, 57006,57007) 
}
// 591 Bolivia 
if `country'==591 {
	replace primary   = inlist(v03_09a, 59101,59102,59107)
	replace primary   = v03_09a == 59105 & inrange(v03_09b,1,6) 
	replace secondary = inlist(v03_09a, 59103,59104,59106,59108)
	replace secondary = v03_09a == 59105 & inrange(v03_09b,7,8) 
	replace terciary  = inrange(v03_09a, 59111,59116)	
}	
// 592 Guyana 
if `country'==592 {
	replace primary = inrange(v03_09a,59201,59203)
	replace educ_cursada = v03_09a == 59204
	replace educ_cursada = inrange(v03_09a, 59205,59208) 
}
// 593 Ecuador	 
if `country'==593 {
	replace primary   = inlist(v03_09a, 59301,59302)
	replace primary   = v03_09a == 59303 & inrange(v03_09b,1,7) 
	replace secondary = inlist(v03_09a, 59304,59305)
	replace secondary = v03_09a == 59303 & inrange(v03_09b,8,10)
	replace terciary  = inrange(v03_09a, 59306,59308)
}
// 595 Paraguay
if `country'==595 {
	replace primary   = inlist(v03_09a, 59501,59502,59503,59505)
	replace primary   = v03_09a == 59504 & inrange(v03_09b,1,6) 
	replace secondary = v03_09a == 59504 & inrange(v03_09b,7,9)
	replace secondary = v03_09a == 59506
	replace terciary  = inrange(v03_09a, 59507,59509)
}
// 598 Uruguay 
if `country'==598 {
	replace primary   = inlist(v03_09a, 59800,59801)
	replace secondary = inrange(v03_09a, 59802,59805)
	replace terciary  = inrange(v03_09a, 59806,59810)
}
if `country'==758 {
// 758 St Lucia
	replace primary   = inlist(v03_09a, 75801,75802)
	replace secondary = v03_09a == 75803
	replace terciary  = inrange(v03_09a, 75804,75807)
}
// 767 Dominica
if `country'==767 {
	replace primary   = inlist(v03_09a, 76701, 76702)
	replace secondary = v03_09a == 76703
	replace terciary  = inrange(v03_09a, 76704,76707)
}	
// 809 República Dominicana
if `country'==809 {
	replace primary   = inlist(v03_09a, 80901,80902,80909,80910)
	replace secondary = inlist(v03_09a, 80903,80904)
	replace terciary  = inrange(v03_09a, 80905,80908)
}	
// 876 Jamaica
if `country'==876 {
	replace primary   = inrange(v03_09a, 87601,87603)
	replace secondary = v03_09a == 87604
	replace terciary  = inrange(v03_09a, 87605,87608)
}
// 999 Brasil 
if `country'==999 {
	replace primary   = inrange(v03_09a, 99901,99903)
	replace secondary = inlist(v03_09a, 99904,99905) 
	replace terciary  = inlist(v03_09a, 99906,99907) 
}

** Nivel de educación jefe de hogar (máximo alcanzado completo o incompleto)

// Completamos variables para todos los jefes de hogar. 
clonevar v03_10a_ = v03_10a 
replace v03_10a_ = v03_09a if v03_10a == . & v03_01 == 1
clonevar v03_10b_ = v03_10b 
replace v03_10b_ = v03_09b if v03_10b == . & v03_01 == 1

gen	primary_hh = .
gen secondary_hh = .
gen terciary_hh

// 501 Belice - 26 NS/NR (5.8%)
if `country'==501 {
	replace primary_hh   = inlist(v03_10a_, 50101,50102)
	replace secondary_hh = v03_10a_ == 50103
	replace terciary_hh  = inrange(v03_10a_, 50104,50208)
}	
// 502 Guatemala - 24 NS/NR (3.23%)
if `country'==502 {
	replace primary_hh   = inlist(v03_10a_, 50201,50202)
	replace secondary_hh = inlist(v03_10a_, 50203,50204) 
	replace terciary_hh  = inrange(v03_10a_, 50205,50207)
}
if `country'==503 {	
// 503 El Salvador - 
	replace primary_hh   = v03_10a_ == 50300
	replace primary_hh   = v03_10a_ == 50301 & inrange(v03_10b_,1,6) 
	replace secondary_hh = v03_10a_ == 50301 & inrange(v03_10b_,7,9)
	replace secondary_hh = v03_10a_ == 50302
	replace terciary_hh  = inrange(v03_10a_, 50303,50305)
}
if `country'==504 {	
// 504 Honduras - 
	replace primary_hh   = inlist(v03_10a_, 50400,50401)
	replace secondary_hh = inrange(v03_10a_, 50402,50404) 
	replace terciary_hh  = inrange(v03_10a_, 50405,50407)
}
// 505 Nicaragua -
if `country'==505 {
	replace primary_hh   = inlist(v03_10a_, 50500,50501)
	replace secondary_hh = v03_10a_== 50502
	replace terciary_hh  = inrange(v03_10a_, 50503,50505) 
}	
// 506 Costa Rica -
if `country'==506 {
	replace primary_hh = inlist(v03_10a_, 50600,50601)
	replace secondary_hh = inlist(v03_10a_, 50602,50603) 
	replace terciary_hh = inrange(v03_10a_, 50604,50606)
}	
// 507 Panama - 29 NS/NR (6.07%)
if `country'==507 {
	replace primary_hh   = inlist(v03_10a_, 50701,50702)
	replace secondary_hh = inrange(v03_10a_, 50703,50706) 
	replace terciary_hh  = inlist(v03_10a_, 50707,50708)
}	
// 509 Haití 
if `country'==509 {
	replace primary_hh   = inrange(v03_10a_, 50901,50908)
	replace secondary_hh = inrange(v03_10a_, 50909,50915) 
	replace terciary_hh  = v03_10a_==50916
}
// 510 Perú
if `country'==510 {
	replace primary_hh   = inlist(v03_10a_, 51000,51001)
	replace secondary_hh = v03_10a_ == 51002
	replace terciary_hh  = inrange(v03_10a_, 51003,51005)
}		
// 520 Mexico - 47 NS/NR (3.16%)
if `country'==520 {
	replace primary_hh   = inrange(v03_10a_, 52001,52003)
	replace secondary_hh = inlist(v03_10a_, 52004,52005,52007,52008) 
	replace terciary_hh  = inrange(v03_10a_, 52009, 52013) | v03_10a_ == 52006 
}	
// 540 Argentina - 21 NS/NR (3.85%)
if `country'==540 {
	replace primary_hh   = inrange(v03_10a_, 54001,54003)
	replace primary_hh   = v03_10a_== 54004 & inrange(v03_10b_,1,7) 
	replace secondary_hh = v03_10a_ == 54004 & inrange(v03_10b_,8,9) 
	replace secondary_hh = inlist(v03_10a_, 54005,54006) 
	replace terciary_hh  = inrange(v03_10a_, 54007,54009) 
}
// 560 Chile -
if `country'==560 {
	replace primary_hh   = inrange(v03_10a_, 56000,56006)
	replace secondary_hh = inrange(v03_10a_, 56007,56010)
	replace terciary_hh  = inrange(v03_10a_, 56011,56016)
}	
// 570 Colombia - 
if `country'==570 {
	replace primary_hh   = inrange(v03_10a_, 57001,57003)
	replace secondary_hh = inlist(v03_10a_, 57004,57005) 
	replace terciary_hh  = inlist(v03_10a_, 57006,57007) 
}	
// 591 Bolivia - 26 NS/NR (3.72%)
if `country'==591 {
	replace primary_hh   = inlist(v03_10a_, 59101,59102,59107)
	replace primary_hh   = v03_10a_== 59105 & inrange(v03_10b_,1,6) 
	replace primary_hh   = inlist(v03_10a_, 59109,59110) 	// Equivalente a P1W1
	replace secondary_hh = inlist(v03_10a_, 59103,59104,59106,59108)
	replace secondary_hh = v03_10a_== 59105 & inrange(v03_10b_,7,8) 
	replace terciary_hh  = inrange(v03_10a_, 59111,59116)
}	
// 592 Guyana - 44 NS/NR (9.32%)
if `country'==592 {
	replace primary_hh   = inrange(v03_10a_,59201,59203)
	replace secondary_hh = v03_10a_ == 59204
	replace terciary_hh  = inrange(v03_10a_, 59205,59208) 
}
// 593 Ecuador - 29 NS/NR (4.12%)
if `country'==593 {
	replace primary_hh   = inlist(v03_10a_, 59301, 59302)
	replace primary_hh   = v03_10a_ == 59303 & inrange(v03_10b_,1,7) 
	replace secondary_hh = inlist(v03_10a_, 59304,59305)
	replace secondary_hh = v03_10a_ == 59303 & inrange(v03_10b_,8,10)
	replace terciary_hh  = inrange(v03_10a_, 59306,59308)
}
// 595 Paraguay - 48 NS/NR (8.36%)
if `country'==595 {
	replace primary_hh   = inlist(v03_10a_, 59501,59502,59503,59505)
	replace primary_hh   = v03_10a_ == 59504 & inrange(v03_10b_,1,6) 
	replace secondary_hh = v03_10a_ == 59504 & inrange(v03_10b_,7,9)
	replace secondary_hh = v03_10a_ == 59506
	replace terciary_hh  = inrange(v03_10a_, 59507,59509)
}	
// 598 Uruguay - 
if `country'==598 {
	replace primary_hh   = inlist(v03_10a_, 59800,59801)
	replace secondary_hh = inrange(v03_10a_, 59802,59805)
	replace terciary_hh  = inrange(v03_10a_, 59806,59810)

}	
if `country'==758 {
// 758 St Lucia - 64 NS/NR (15.46%)
	replace primary_hh   = inlist(v03_10a_, 75801,75802)
	replace secondary_hh = v03_10a_ == 75803
	replace terciary_hh  = inrange(v03_10a_, 75804,75807)

}	
if `country'==767
// 767 Dominica - 95 NS/NR (21.84%)
	replace primary_hh   = inlist(v03_10a_, 76701, 76702)
	replace secondary_hh = v03_10a_ == 76703
	replace terciary_hh  = inrange(v03_10a_, 76704,76707)
	
}	
// 809 República Dominicana -
if `country'==809 {
	replace primary_hh   = inlist(v03_10a_, 80901,80902,80909,80910)
	replace secondary_hh = inlist(v03_10a_, 80903,80904)
	replace terciary_hh  = inrange(v03_10a_, 80905,80908)

}
if `country'==876 {	
// 876 Jamaica - 84 NS/NR (19.72%)
	replace primary_hh = inrange(v03_10a_, 87601,87603)
	replace secondary_hh = v03_10a_ == 87604
	replace terciary_hh = inrange(v03_10a_, 87605,87608)
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


