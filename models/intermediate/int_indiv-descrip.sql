select
    nomen,
    noind,
    ech,
    pop1,
    zae,
    strate,
    region_adm_12cl AS Region,
    sex_ps,
    tage_ps,
    tage_ps_mois,
    situ_prof_5cl_interv,
    trav_nuit_interv,
    pcs_8cl_interv,
    tps_travail_interv,
    vacances_interv,
    soins,
    revenu,
    ruc_4cl,
    nbpers,
    nbadu,
    nbenf,
    situ_alim_statut,
    ia_statut,
    ia_score,
    taille_m,
    poids_m,
    imc,
    statnut,
    maladie_allergie_alim,
    intoall_confirm_med,
    CASE 
    WHEN veget_viande IS NOT NULL 
      OR veget_prodmer IS NOT NULL 
      OR veget_prodlait IS NOT NULL 
      OR veget_oeuf IS NOT NULL 
      OR veget_miel IS NOT NULL 
      OR veget_autre_alim IS NOT NULL 
    THEN '1'
    ELSE '0'
    END AS Vegetarien,
    poids_modif,
    poidsmax,
    age_poidsmax,
    poidsmin,
    age_poidsmin,
    enceinte,
    allaite,
    fume,
    bmr_kcal,
from {{ ref("stg_sante__indiv-desc") }}
