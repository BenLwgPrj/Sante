SELECT  
    *,
    {{ classifify_tage_ps('tage_ps') }} AS class_age,
    {{ classifify_fumeur('fume') }} AS class_fumeur,
    {{ classifify_IMC('IMC') }} AS class_IMC,
    {{ classifify_revenu('revenu') }} AS class_revenue,
    {{ classifify_sex_ps('sex_ps') }} AS class_sexe,

FROM {{ ref('int_indiv-descrip') }} 
INNER JOIN {{ ref('int_actphys-sedent') }} 
  USING (NOIND)
INNER JOIN {{ ref('int_indiv_habit') }} 
  USING(NOIND)
INNER JOIN {{ ref('int_men_habitudes') }} 
  USING (NOMEN)
INNER JOIN {{ ref('int_conso_gpe_inca3') }} 
  USING (NOIND)

