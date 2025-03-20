SELECT  
    *
FROM {{ ref('int_indiv-descrip') }} 
INNER JOIN {{ ref('int_actphys-sedent') }} 
  USING (NOIND)
INNER JOIN {{ ref('int_indiv_habit') }} 
  USING(NOIND)
INNER JOIN {{ ref('int_men_habitudes') }} 
  USING (NOMEN)
INNER JOIN {{ ref('int_conso_gpe_inca3') }} 
  USING (NOIND)

