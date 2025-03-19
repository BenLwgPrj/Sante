select
    nomen,
    noind,
    ech,
    region_adm_12cl AS Region,
    sex_ps,
    tage_ps,
    situ_prof_5cl_interv,
    pcs_8cl_interv,
    tps_travail_interv,
    revenu,
    ruc_4cl,
    situ_alim_statut,
    ia_statut,
    imc,
    statnut,
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
    fume,
    bmr_kcal,
from {{ ref("stg_sante__indiv-desc") }}
