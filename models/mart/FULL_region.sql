SELECT  
    inca.*,
    patho_niv1, patho_niv2, patho_niv3, 
    avg_prise_en_charge, avg_prevalence, avg_nb_individu_class
FROM {{ ref('INCA_region') }} as inca
INNER JOIN {{ ref('AMELIE_pathologies_7y_avg') }} as patho
  on  inca.region_text = patho.region_text
  and inca.class_sexe = patho.class_sexe
  and inca.class_age = patho.class_age
