SELECT
    {{ classify_patho_type('patho_niv3') }} as patho_type,
    patho_niv1,
    patho_niv2,
    patho_niv3,
    class_age,
    class_age_wo_senior,
    class_sexe,
    region_text,
    AVG(nb_prise_en_charge) AS avg_prise_en_charge,
    ROUND(AVG(nb_individu_class), 0) AS nb_individu_class
FROM {{ ref('int_amelie_pathologies') }}
GROUP BY 
    patho_niv1,
    patho_niv2,
    patho_niv3,
    region_text,
    class_age,
    class_age_wo_senior,
    class_sexe