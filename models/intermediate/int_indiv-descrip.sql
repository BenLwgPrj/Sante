select
    nomen,
    noind,
    ech,
    region_adm_12cl AS Region,
--    sex_ps,
    {{ classifify_sex_ps('sex_ps') }} AS class_sexe,
--    tage_ps,
    {{ classifify_tage_ps('tage_ps') }} AS class_age,
    situ_prof_5cl_interv,
    pcs_8cl_interv,
    tps_travail_interv,
--    revenu,
    {{ classifify_revenu('revenu') }} AS class_revenue,
    ruc_4cl,
    situ_alim_statut,
    ia_statut,
    imc,
    {{ classifify_IMC('imc') }} AS class_IMC,
    statnut,
    CASE 
        WHEN veget_viande IS NOT NULL 
        OR veget_prodmer IS NOT NULL 
        OR veget_prodlait IS NOT NULL 
        OR veget_oeuf IS NOT NULL 
        OR veget_miel IS NOT NULL 
        OR veget_autre_alim IS NOT NULL 
        THEN 1
        ELSE 0
    END AS vegetarien,
    poids_modif,
--    fume,
    {{ classifify_fumeur('fume') }} AS class_fumeur,
    bmr_kcal

from {{ ref("stg_sante__indiv-desc") }}
