


******************* TCR IMPO ******************* 

clear all
 import excel "/Users/tomasmarotta/Desktop/prueba.xlsx", sheet("Serie TCR") firstrow



rename A year

sum TCR_Impo if year<td(01jul2022) & year>td(01dec1957)
local m=r(mean)
local g=100
sum TCR_Impo if year==td(01dec2001)
local dec01=r(mean)

sum TCR_Impo if year==td(01sep2019)
local sep19=r(mean)
sum TCR_Impo if year==td(01jan2020)
local jan20=r(mean)
sum TCR_Impo if year==td(01mar2018)
local mar18=r(mean)
sum TCR_Impo if year<td(01jan2018) & year>td(01dec2016)
local 2017=r(mean)

sum TCR_Impo if year<td(01jan1990) & year>td(01dec1988)
local 1989=r(mean)
sum TCR_Impo if year<td(01jan1981) & year>td(01dec1979)
local 1980=r(mean)

sum TCR_Impo if year==td(01jun2022)
local jun22=r(mean)

* AGREGO LOS DISTINTOS TIPOS DE CAMBIO 

sum TCR_Impo if year==td(01jul2022)
local jun22_liq=r(mean)

sum TCR_Impo if year==td(01aug2022)
local jun22_blue=r(mean)

*sum TCR_Impo if year==td(01nov2021)
*local dec20_soli=r(mean)  
* No me pidió dólar solidario

twoway kdensity TCR_Impo, fc(none) xline(`m', lc(blue)) xline(`g', lc(red)) xline(`1989', lc(dkorange)) xline(`1980', lc(magenta) lpat(dash)) xline(`mar18', lc(black)) xline(`jun22', lc(cyan)) xline(`jun22_liq', lc(green) lpat(dash)) xline(`jun22_blue', lc(blue) lpat(dash)) xtitle(Valor) ytitle(Probabilidad)
 *name(mecon2)/// (

*xline(`2017', lc(black)) 
*xline(`sep19', lc(black) lpat(dash))
*xline(`jan20', lc(red) lpat(dash))
*name(mecon)

******************* TCR FINANCIERO ******************* 

clear all
 import excel "/Users/tomasmarotta/Desktop/prueba3.xlsx", sheet("Serie TCR") firstrow



rename A year

sum TCR_Financiero if year<td(01aug2022) & year>td(01dec1957)
local m=r(mean)
local g=100
sum TCR_Financiero if year==td(01dec2001)
local dec01=r(mean)

sum TCR_Financiero if year==td(01sep2019)
local sep19=r(mean)
sum TCR_Financiero if year==td(01jan2020)
local jan20=r(mean)
sum TCR_Financiero if year==td(01mar2018)
local mar18=r(mean)
sum TCR_Financiero if year<td(01jan2018) & year>td(01dec2016)
local 2017=r(mean)

sum TCR_Financiero if year<td(01jan1990) & year>td(01dec1988)
local 1989=r(mean)
sum TCR_Financiero if year<td(01jan1981) & year>td(01dec1979)
local 1980=r(mean)

sum TCR_Financiero if year==td(01jul2022)
local jul22=r(mean)

* AGREGO LOS DISTINTOS TIPOS DE CAMBIO 

*sum TCR_Impo if year==td(01jul2022)
*local jun22_liq=r(mean)

*sum TCR_Impo if year==td(01aug2022)
*local jun22_blue=r(mean)

*sum TCR_Impo if year==td(01nov2021)
*local dec20_soli=r(mean)  
* No me pidió dólar solidario

twoway kdensity TCR_Financiero, fc(none) xline(`m', lc(blue)) xline(`g', lc(red)) xline(`1989', lc(dkorange)) xline(`1980', lc(magenta) lpat(dash)) xline(`mar18', lc(black)) xline(`jul22', lc(cyan)) xtitle(Valor) ytitle(Probabilidad)

*xline(`dec01', lc(green)) la borré porque es el año base y está en rojo
*xline(`jun22_liq', lc(green) lpat(dash)) xline(`jun22_blue', lc(blue) lpat(dash))
 *name(mecon2)/// (

*xline(`2017', lc(black)) 
*xline(`sep19', lc(black) lpat(dash))
*xline(`jan20', lc(red) lpat(dash))
*name(mecon)

    
