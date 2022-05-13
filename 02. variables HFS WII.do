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



clear all 
set more off
gl path "/Users/nicolas/Dropbox/World Bank/HFS"
gl data "$path/data"
global results "$path/results"
global w1 	"$data/Wave 1"
global w2 	"$data/Wave 2"
local country 540
use "$w2/540_PH2W2_CP_Casos", replace



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
* nivel educativo 
tab v03_09a, g(v309_)

* interviwee
*primary less
 if inlist(`country',501,503,505,510,758,767,502,506,592,876)  {
g primary_less = (v309_1==1) | (v309_2==1) 
label variable primary_less "Primary or less educated"
 }

 if inlist(`country',570,504,507,520)  {
g primary_less = (v309_1==1) | (v309_2==1) | (v309_3==1)
label variable primary_less "Primary or less educated" 
 }
 
*secondary  
if inlist(`country',503)  { 
g secondary =  (v309_3==1) | (v309_5==1)
label variable secondary "Secondary education"
}

 if inlist(`country',505,510,758,767,502,592,876)  {
g secondary =  (v309_3==1) | (v309_4==1)
label variable secondary "Secondary education"
 }
 
  if inlist(`country',570)  {
g secondary =  (v309_4==1) | (v309_5==1)
label variable secondary "Secondary education"
  }

  if inlist(`country',504,507)  {
g secondary =  (v309_4==1) | (v309_5==1) | (v309_6==1)
label variable secondary "Secondary education"
  }
* mexico   
  if inlist(`country',520)  {
g secondary =  (v309_4==1) | (v309_5==1) | (v309_6==1) | (v309_7==1)
label variable secondary "Secondary education"
  }  
  
 if inlist(`country',501,506)  {
g secondary =  (v309_3==1) | (v309_4==1) | (v309_5==1) 
label variable secondary "Secondary education"
  }
  
* terciary 
if inlist(`country',503) {
g terciary = (v309_4==1) | (v309_6==1) 
label variable terciary "Terciary education"
}

if inlist(`country',505,510) { 
g terciary = (v309_5==1) | (v309_6==1) 
label variable terciary "Terciary education"
}

  if inlist(`country',570)  {
g terciary = (v309_6==1) 
label variable terciary "Terciary education"
  }

  if inlist(`country',506)  {
g terciary = (v309_6==1) | (v309_7==1)
label variable terciary "Terciary education"
  }

  if inlist(`country',520)  {
g terciary = (v309_8==1) | (v309_9==1) | (v309_10==1) | (v309_11==1)
label variable terciary "Terciary education"
  }  
  
  if inlist(`country',501)  {
g terciary = (v309_6==1) | (v309_7==1) | (v309_8==1)
label variable terciary "Terciary education"
  }

  if inlist(`country',504,507)  {
g terciary = (v309_7==1) | (v309_8==1)
label variable terciary "Terciary education"
  }  
  
* Santa Lucia, Dominica  
if inlist(`country',758,767,502,592,876)  {
g terciary = (v309_5==1) | (v309_6==1) | (v309_7==1)
label variable terciary "Terciary education"
}  

* head ------------------

 tab v03_10a, g(v0310_)
*primary 
if inlist(`country',501,503,505,510,758,767,502,506) { 
g hh_primary_less = (v0310_1==1) | (v0310_2==1) 
label variable primary_less "Primary or less educated"
}

  if inlist(`country',570,876,504,507,520,592)  {
g hh_primary_less = (v0310_1==1) | (v0310_2==1) | (v0310_3==1)
label variable primary_less "Primary or less educated"
  }

* secondary 
if inlist(`country',503) {
g hh_secondary = (v0310_3==1) | (v0310_5==1) 
label variable secondary "Secondary education"
}

if inlist(`country',505,510,758,767,502) { 
g hh_secondary = (v0310_3==1) | (v0310_4==1) 
label variable secondary "Secondary education"
}

  if inlist(`country',570,876,592)  {
g hh_secondary = (v0310_4==1) | (v0310_5==1) 
label variable secondary "Secondary education"
  }
  
  if inlist(`country',504,507)  {
g hh_secondary = (v0310_4==1) | (v0310_5==1) | (v0310_6==1) 
label variable secondary "Secondary education"
  }
  
  if inlist(`country',501,506)  {
g hh_secondary = (v0310_3==1) | (v0310_4==1) | (v0310_5==1)  
label variable secondary "Secondary education"
  } 

* mexico   
 if inlist(`country',520)  {
g hh_secondary =  (v0310_4==1) | (v0310_5==1) | (v0310_6==1) | (v0310_7==1)
label variable secondary "Secondary education"
  }  
  
*terciary 
if inlist(`country',503) {
g hh_terciary = (v0310_4==1) | (v0310_6==1) 
label variable terciary "Terciary education" 
} 

if inlist(`country',505,510) { 
g hh_terciary = (v0310_5==1) | (v0310_6==1) 
label variable terciary "Terciary education" 
 }

  if inlist(`country',570)  {
g hh_terciary = (v0310_6==1) 
label variable terciary "Terciary education" 
 } 
 
  if inlist(`country',506)  {
g hh_terciary = (v0310_6==1) | (v0310_7==1)  
label variable terciary "Terciary education" 
 } 
 
  if inlist(`country',501,876,592)  {
g hh_terciary = (v0310_6==1) | (v0310_7==1) | (v0310_8==1) 
label variable terciary "Terciary education" 
 } 

   if inlist(`country',504,507)  {
g hh_terciary = (v0310_7==1) | (v0310_8==1) 
label variable terciary "Terciary education" 
 } 
* Mexico 
  if inlist(`country',520)  {
g hh_terciary = (v0310_8==1) | (v0310_9==1) | (v0310_10==1) | (v0310_11==1)
label variable terciary "Terciary education"
  }  
 
if inlist(`country',758,767,502)  {
g hh_terciary =  (v0310_5==1) | (v0310_6==1) | (v0310_7==1) 
label variable terciary "Terciary education" 
 }  
*------
 
if  inlist(`country',509,540,591,593,595,598,809)  {
 g primary_less = (v309_1==1) | (v309_2==1) | (v309_3==1)
label variable primary_less "Primary or less educated"

g secondary = (v309_4==1) | (v309_5==1) | (v309_6==1)
label variable secondary "Secondary education"

g terciary = (v309_7==1) | (v309_8==1) 
label variable terciary "Terciary education"

 
 
* nivel educativo HH head 

*tab v03_10a, g(v0310_)

g hh_primary_less = (v0310_1==1) | (v0310_2==1) | (v0310_3==1)
label variable primary_less "Primary or less educated"

g hh_secondary = (v0310_4==1) | (v0310_5==1) | (v0310_6==1)
label variable secondary "Secondary education"

g hh_terciary = (v0310_7==1) | (v0310_8==1) 
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


