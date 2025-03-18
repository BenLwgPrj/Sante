SELECT  
  *
FROM {{ ref('int_indiv-descrip') }} AS indiv
INNER JOIN {{ ref('int_actphys-sedent') }} AS actphys
  USING (NOIND)
INNER JOIN {{ ref('int_indiv_habit') }} AS habits_indiv
  USING(NOIND)
INNER JOIN {{ ref('int_men_habitudes') }} AS men_habitudes
  USING (NOMEN)
INNER JOIN {{ ref('int_conso_gpe_inca3') }} AS conso
  USING (NOIND)