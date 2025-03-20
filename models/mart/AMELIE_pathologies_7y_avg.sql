SELECT
    patho_niv1,
    patho_niv2,
    patho_niv3,
    class_age,
    class_sexe,
    region_text,
    AVG(nb_prise_en_charge) AS avg_prise_en_charge,
    AVG(avg_prevalence) AS avg_prevalence,
    ROUND(AVG(nb_individu_class), 0) AS avg_nb_individu_class
FROM {{ ref('int_amelie_pathologies') }}
GROUP BY 
    patho_niv1,
    patho_niv2,
    patho_niv3,
    region_text,
    class_age,
    class_sexe