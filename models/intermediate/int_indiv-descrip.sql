select
    nomen,
    noind,
    ech,
    region_adm_12cl AS Region,
    {{ classify_format_region_adm12cl ('region_adm_12cl') }} AS region_text,
--    sex_ps,
    {{ classify_sex_ps('sex_ps') }} AS class_sexe,
--    tage_ps,
    {{ classify_tage_ps('tage_ps') }} AS class_age,
    situ_prof_5cl_interv,
    pcs_8cl_interv,
    tps_travail_interv,
--    revenu,
    {{ classify_revenu('revenu') }} AS class_revenue,
    ruc_4cl,
    situ_alim_statut,
    ia_statut,
    imc,
    {{ classify_IMC('imc') }} AS class_IMC,
    statnut,
    CASE 
        WHEN (veget_viande = 1
        OR veget_prodmer = 1
        OR veget_prodlait = 1
        OR veget_oeuf = 1
        OR veget_miel = 1
        OR veget_autre_alim = 1)
        THEN 1
        ELSE 0
    END AS vegetarien,
    poids_modif,
--    fume,
    {{ classify_fumeur('fume') }} AS class_fumeur,
    bmr_kcal

from {{ ref("stg_sante__indiv-desc") }}
