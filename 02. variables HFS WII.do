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
local country 507
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
gen terciary_hh =.

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
if `country'==767 {
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



*-------------------------------Modules 

*----------2.2: Labor Market 

local module labor

/* Resumen variables de interes para resultados
ocupado1
desocupado1
ocu_pea1
trabajo remoto

*/

// Correccion no responde y valores fuera de rango a missing
recode v05_03 v05_04 v05_10 v05_11 v05_17 v05_18 v05_19 v05_20 v05_24 (-98 -99 98 99=.)
recode v05_11 (28=.)	// R Dom 1 caso que puede haber sido 98
recode v05_13 (24=.)	// 4 Paises, 8 casos con valor fuera de rango
recode v05_18 (4=.)		// Col 1 caso con valor fuera de rango
recode v05_25 (20=.)	// Nic 1 caso con valor fuera de rango
recode v05_27 (21 23 =.)	// 9 paises 28 casos tienen 21 que no es permitido


// Corregimos horas mayores al límite superior de 140
	sum  v05_03 v05_04 v05_20 v05_24 
	foreach v of varlist v05_03 v05_20 v05_24 {
	replace `v' = 140 if `v' > 140 & `v' != .	    
	}
*

* Empleo actual comparable PNUD
gen ocupado1 = cond(v05_01 == 1 | inlist(v05_13,2,5,6,16,19,21),1,0)
lab var ocupado1 "Ocupado actual definicion 2021"
lab val ocupado1 yn

* Trabajo actual desagregado def 2021
gen 	trabajo1 = 3
replace trabajo1 = 1 if v05_01 == 1
replace trabajo1 = 2 if v05_01 == 2 & inlist(v05_06,1,3) & inlist(v05_13,2,5,6,16,19,21)
lab def trab 1 "Si trabajó" 2 "Ausente temporal" 3 "No trabajó", modify
lab val trabajo1 trab
lab var trabajo1 "Descomposición trabajo 2021"

* Desocupado actual 
gen		desocupado1 = cond(ocupado1== 0 & v05_12 == 1 & v05_15 == 1,1,0)
replace desocupado1 = 1 if ocupado1 == 0 & v05_12 == 1 & v05_06 != 2
lab val desocupado1 yn

* Fuera de la fuerza laboral actual
gen		inactivo1 = 0
replace inactivo1 = 1 if ocupado1 == 0 & v05_12 == 2 & v05_15 == 2 // no busca y no está disponible
replace inactivo1 = 1 if ocupado1 == 0 & v05_12 == 1 & v05_15 == 2 // busca pero no disponible
replace inactivo1 = 1 if ocupado1 == 0 & v05_12 == 2 & v05_15 == 1 // no busca y disponible
replace inactivo1 = 1 if ocupado1 == 0 & v05_12 == 2
lab val inactivo1 yn

* Población en la fuerza laboral actual
gen		activo1 = (ocupado1 == 1 | desocupado1 == 1)
lab val activo1 yn

* Condicion de actividad actual
gen 	condact1 = 1 if ocupado1 == 1
replace condact1 = 2 if desocupado1 == 1
replace condact1 = 3 if inactivo1 == 1
lab def condact	1 "Ocupado" 2 "Desocupado" 3 "Inactivo"
lab val condact1 condact
lab var condact1 "Condicion actividad actual"

* Tasa empleo / población activa actual
gen 	ocu_pea1 = 0 if ocupado1 == 0 & activo1 == 1 
replace ocu_pea1 = 1 if ocupado1 == 1 & activo1 == 1 
lab def ocu_pea 0 "desocupado" 1 "ocupado"
lab val ocu_pea1 ocu_pea

* Dummy trabajo remoto
gen		trabajo_remoto = .
replace trabajo_remoto = 1 if v05_04 >= 1 & v05_04 != .
replace trabajo_remoto = 0 if v05_04 == 0
replace trabajo_remoto = . if ocupado1 != 1
label define trabajo_remoto 0 "No trabajó de manera remota" 1 "Trabajó de manera remota"
label val trabajo_remoto trabajo_remoto
label var trabajo_remoto "¿Trabajó al menos una hora durante la semana pasada de manera remota o virtual?"

* Empleo formal actual
gen		formal1 = v05_08 == 1 if ocupado1==1
lab val formal1 yn
 
* Condición de actividad actual con informalidad
gen condact1v2 = condact1
replace condact1v2 = 0 if condact1 == 1 & formal1 == 1
lab var condact1 "Condicion actividad actual con informalidad"
label define condactv2 0 "Ocupados formales" 1 "Ocupados informales" 2 "Desocupados" 3 "Inactivos"
label val condact1v2 condactv2

* Horas de trabajo
gen		horas1 = v05_03 if ocupado1 == 1
lab var horas1 "Horas de trabajo semana actual"

gen		hremo1 = v05_04 if ocupado1 == 1 
lab var hremo1 "Horas trabajo remoto semana actual"

gen		workhome = v05_04 / v05_03 if (v05_03 > 0 & v05_03 != .) & ocupado1 == 1
replace workhome = 1 if (workhome > 1 & workhome != .) & ocupado1 == 1
lab var workhome "Proporcion horas de trabajo remoto"


*--- SITUACIÓN PREPANDEMIA ---*

* Ocupación pre pandemia 
gen 	ocupado0 = v05_16==1 
replace ocupado0 =. if v05_16==.	// dejamos como missing?
lab var	ocupado0 "Ocupado pre-pandemia"
lab val ocupado0 yn

* Desocupación pre pandemia // Si en razón de no trabajo menciona que estaba buscando
gen		desocupado0 = ocupado0 == 0 & v05_28 == 8
replace desocupado0 =. if v05_16==.	// dejamos como missing?
lab var desocupado0 "Desocupado pre-pandemia"
lab val desocupado0 yn

* Población fuera de la fuerza laboral pre pandemia (inactividad) 
gen		inactivo0 = ocupado0 == 0 & inrange(v05_28,1,7)
replace inactivo0 =. if v05_16==.	// dejamos como missing?
lab var inactivo0 "Inactivo pre-pandemia"
lab val inactivo0 yn

* Población en la fuerza laboral pre pandemia
gen		activo0 = (ocupado0 == 1 | desocupado0 == 1)
replace activo0 =. if v05_16==.
lab val activo0 yn

* Condicion de actividad pre pandemia
gen 	condact0 = 1 if ocupado0 == 1
replace condact0 = 2 if desocupado0 == 1
replace condact0 = 3 if inactivo0 == 1
lab val condact0 condact
lab var condact0 "Condicion actividad pre-pandemia"

* Tasa empleo / población activa pre pandemia
gen 	ocu_pea0 = 0 if ocupado0 == 0 & activo0 == 1 
replace ocu_pea0 = 1 if ocupado0 == 1 & activo0 == 1 
lab val ocu_pea0 ocu_pea

* Empleo formal pre pandemia
gen		formal0 = v05_18 == 1 if ocupado0 == 1 
replace formal0 = 1 if v05_22 == 1 & ocupado0 == 1
replace formal0 = . if v05_18==. & v05_22==.	// dejar como missing?
lab val formal0 yn

* Condición de actividad pre pandemia con informalidad
gen condact0v2 = condact0
replace condact0v2 = 0 if condact0 == 1 & formal0 == 1
lab var condact0v2 "Condicion actividad pre-pandemia con informalidad"
label val condact0v2 condactv2

* Horas de trabajo pre pandemia (completa)
clonevar horas0 = v05_20 if ocupado0 == 1
replace  horas0 = v05_24 if ocupado0 == 1 & horas0 == .
replace  horas0 = . if v05_20==. & v05_24==. // REVISAR SI CRITERIO DE MISSING GENERA PROBLEMA DESPUES


// Completamos variable de w2 para muestra no panel
*clonevar v05_25_ = v05_25 if ocupado0 == 1
*replace  v05_25_ = v05_09 if ocupado0 == 1 & v05_25_ == .


*--- VARIABLES DE TRANSICIONES LABORALES ---*
// Matrices se realizan con do file de UNDP 

* Perdida empleo actual vs pre pandemia (comparable HFPS 2020)
gen		perdida01 = .
replace perdida01 = 0 if ocupado0 == 1 
replace perdida01 = 1 if ocupado0 == 1 & ocupado1 == 0
lab var perdida01 "Perdida empleo pre pandemia resp. ocupados pre pandemia"


* Ganancia empleo actual vs pre pandemia
gen ganancia01 = . 
replace ganancia01 = 1 if ocupado0 == 0 & ocupado1 == 1
replace ganancia01 = 0 if ocupado0 == 0 & ocupado1 == 0
replace ganancia01 = 0 if perdida01 == 1
la var ganancia01 "Ganancia empleo pre pandemia resp. ocupados pre pandemia"


gen		ocu0_desoc1 = .
replace ocu0_desoc1 = 0 if ocupado0 == 1 
replace ocu0_desoc1 = 1 if ocupado0 == 1 & desocupado1 == 1
lab var ocu0_desoc1 "Del empleo al desempleo"

gen		ocu0_inac1 = .
replace ocu0_inac1 = 0 if ocupado0 == 1 
replace ocu0_inac1 = 1 if ocupado0 == 1 & inactivo1 == 1
lab var ocu0_inac1 "Del empleo a inactividad"
lab val perdida01 ocu0_desoc1 ocu0_inac1 yn

* Transición de ocupado formal a informal - ratio respecto a formales pre pandemia
gen		for0_inf1 = 0 if (ocupado0==1 & ocupado1==1) & formal0==1 
replace for0_inf1 = 1 if (formal0==1 & formal1==0) & ocupado0==1 & ocupado1==1
lab var for0_inf1 "Ocupados formales que pasaron a informalidad"


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
* 
* 14.7 aumentos percepcion inseguridad y violencia.
foreach x in v14_05 v14_06{
    gen aumento_`x' =. 
	replace aumento_`x' = 0 if inlist(`x', 2,3)
	replace aumento_`x' = 1 if `x' == 1
}

* propuesta: percepcion de violencia e inseguridad en el entorno - compuesta 
gen percep_inseg_violencia = . 
replace percep_inseg_violencia = 0 if aumento_v14_05 == 0 & aumento_v14_06 == 0 
replace percep_inseg_violencia = 1 if aumento_v14_05 == 1 | aumento_v14_06 == 1 


*----------2.4: Food insecurity 
g run_out_food = (v04_01==1)

// Completar variable v04_04
clonevar v04_04_ = v04_04 
replace  v04_04_ = v04_04 if v04_04 == . & tipo_muestra == 2
tab pais v04_04_, m

g run_out_food_pre_pan = (v04_04_==1)

*----------2.5: Education

* Corregir observaciones que no siguen CATI

foreach var in v08_09a v08_09b v08_09c v08_09d v08_09e v08_09f v08_09z{
	replace `var' = . if v08_08 == 2
}

gen chil_06_17 =(w_cha_ph2w2 != .) if inrange(v07_19,6,17)
gen chil_01_05 =(w_cha_ph2w2 != .) if inrange(v08_16,1,5)
* Share of school-age children attending some form of education activities (in person or remotely)
* Change in school attendance
* before the pandemic
g attendance_prepan_6_17 = inlist(v08_02,1,2)
replace attendance_prepan_6_17 = . if v08_02 == 98 | v08_02 == . 
replace attendance_prepan_6_17 = . if v08_02 == 3 & v07_19 == 6

*g attendance_6_17 = v08_03==1 & ((v08_05==1 | v08_05==2 & v08_06==1) | (v08_08==1 | v08_08==2 & v08_10==1))
gen attendance_6_17 = . 
replace attendance_6_17 = 0 if v08_02 != .
replace attendance_6_17 = 1 if v08_05 == 1
replace attendance_6_17 = 1 if v08_08 == 1
replace attendance_6_17 = 1 if inlist(v08_06,1,17)
replace attendance_6_17 = 1 if inlist(v08_10,1,2,15)
replace attendance_6_17 = . if v08_05 == 98 & v08_08 == 98
* schools offer face to face classes 
*g face_to_face_classes_6_17 = v08_04==1
**# Bookmark #1
gen face_to_face_classes_6_17     = 0 if attendance_6_17 == 1
replace face_to_face_classes_6_17 = 1 if v08_05 == 1
replace face_to_face_classes_6_17 = 1 if v08_10 == 15 
replace face_to_face_classes_6_17 = . if attendance_6_17 != 1

* 8.13.1 Asistia a un centro antes de la pandemia
gen attendance_prepan_1_5 = 1 if v08_17 == 1
replace attendance_prepan_1_5 = 0 if v08_17 == 2

* 8.14.1 Asiste a un centro ahora
gen attendance_1_5 = 1 if v08_19 == 1
replace attendance_1_5 = 0 if v08_19 == 2



*Perception of children learning in relation to before the pandemic 
* 8.12.1 Aprenden menos o mucho menos
gen learning_less = 1 if inlist(v08_12,1,2)
replace learning_less = 0 if inlist(v08_12,3,4,5)
label var learning_less "Indicador de niños matriculados antes y ahora que consideran que ahora aprenden menos" 
label val learning_less yn 

* 8.12.2 Aprenden igual
gen learning_same = 1 if inlist(v08_12,3)
replace learning_same = 0 if inlist(v08_12,1,2,4,5)
label var learning_same "Indicador de niños matriculados antes y ahora que consideran que ahora igual" 
label val learning_same yn 




* 8.4.1 Porcentaje de matriculados en colegio público

	gen publico1 = .

	// Países con solo sistema público o privado
	foreach pais in 501 502 503 504 505 507 510 520 580 592 598 758 876{
		replace publico1 = 1 if v08_03b == `pais'01
		replace publico1 = 0 if v08_03b == `pais'02
	}

	// Países con sistema público, privado y mixto
	foreach pais in 506 509 540 591 595 809{
		replace publico1 = 1 if v08_03b == `pais'01
		replace publico1 = 0 if inlist(v08_03b,`pais'02,`pais'03)
	}
	
	// Chile
	replace publico1 = 1 if inlist(v08_03b,56001,56005)
	replace publico1 = 0 if inlist(v08_03b,56002,56003,56004)
	
	// Ecuador
	replace publico1 = 1 if inlist(v08_03b,59301,59304)
	replace publico1 = 0 if inlist(v08_03b,59302,59303)

* 8.4.2 Porcentaje de matriculados en colegio privado

	gen privado1 = .

	// Países con solo sistema público o privado
	foreach pais in 501 502 503 504 505 507 510 520 580 592 598 758 876{
		replace privado1 = 1 if v08_03b == `pais'02
		replace privado1 = 0 if v08_03b == `pais'01
	}
	
	// Países con sistema público, privado y mixto
	foreach pais in 506 509 591 595 809{
		replace privado1 = 1 if v08_03b == `pais'02
		replace privado1 = 0 if inlist(v08_03b,`pais'01,`pais'03)
	}
	
	// Argentina: se incluye la educación parroquial como privada
	replace privado1 = 1 if inlist(v08_03b,54002,54003)
	replace privado1 = 0 if v08_03b == 54001

	// Chile
	replace privado1 = 1 if inlist(v08_03b,56003)
	replace privado1 = 0 if inlist(v08_03b,56001,56002,56004,56005)
	
	// Ecuador
	replace privado1 = 1 if inlist(v08_03b,59303)
	replace privado1 = 0 if inlist(v08_03b,59301,59302,59304)
	
* 8.4.3 Porcentaje de matriculados en colegio mixto

	gen mixto1 = .

	// Países con solo sistema público o privado
	foreach pais in 501 502 503 504 505 507 510 520 580 592 598 758 876{
		replace mixto1 = 0 if inlist(v08_03b,`pais'01,`pais'02)
	}
	
	// Países con sistema público, privado y mixto
	* Costa Rica (subvencionado = institución privada que recibe dinero del Estado)
	* Haiti: CONFIRMAR QUÉ SIGNIFICA OPCION 50903
	* Bolivia (convenio = financiado por el estado administrado por la Iglesia)
	* Paraguay (subvencionado = administrado por privado financiado por el Estado)
	* Rep Dom: (semioficial)
	
	foreach pais in 506 509 591 595 809{
		replace mixto1 = 1 if v08_03b == `pais'03
		replace mixto1 = 0 if inlist(v08_03b,`pais'01,`pais'02)
	}
	
	//Argentina (tiene 3 sistemas pero ninguno es mixto)
	replace mixto1 = 0 if inlist(v08_03b,54001,54002,54003)
	
	// Chile: (particular subvencionado = financiado por el estado y por los padres; de administración delegada = propiedad del Estado financiados por privados)
	replace mixto1 = 1 if inlist(v08_03b,56002,56004)
	replace mixto1 = 0 if inlist(v08_03b,56001,56003,56005)
	
	// Ecuador: (fiscomisional = administrados por privados financiados por el Estado)
	replace mixto1 = 1 if inlist(v08_03b,59302)
	replace mixto1 = 0 if inlist(v08_03b,59301,59303,59304)

*----------2.6: Gender


foreach v in v09_11 v09_12 v09_13 {
	gen aumento_`v' = 1 if inlist(`v',1)
	replace aumento_`v' = 0 if inlist(`v',2,3,4)
	label var aumento_`v' "Indicador de aumento en el tiempo dedicado a la actividad"
	label val aumento_`v' yn
}

egen aumento_domestica = rowmax(aumento*)
label var aumento_domestica "Indicador de aumento en el tiempo dedicado a alguna tarea doméstica o de cuidado"

* 9.5 Toma de decisiones antes de la pandemia (se debe mostrar para hombres y para mujeres)

gen toma_dec_gasto0 = 1 if v09_08a == 1
replace toma_dec_gasto0 = 0 if inlist(v09_08a,2,3,4)
label var toma_dec_gasto0 "Indicador de si es la persona que principalmente tomaba las decisiones de gasto antes de la pandemia"
label val toma_dec_gasto0 yn

* 9.6 Toma de decisiones actualmente (se debe mostrar para hombres y para mujeres)

gen toma_dec_gasto1 = 1 if v09_08b == 1
replace toma_dec_gasto1 = 0 if inlist(v09_08b,2,3,4)
label var toma_dec_gasto1 "Indicador de si es la persona que principalmente toma las decisiones de gasto actualmente"
label val toma_dec_gasto1 yn

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


