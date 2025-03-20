SELECT
    --population,
    noind,
    ROUND(conso_gpe1 + conso_gpe3 + conso_gpe4 + conso_gpe5 + conso_gpe2,1) as conso_cereales,
    ROUND(conso_gpe7 + conso_gpe8 + conso_gpe9 + conso_gpe44,1) as conso_produits_laitiers,
    ROUND(conso_gpe26,1) as conso_fruits_a_coque,
    ROUND(conso_gpe40 + conso_gpe43,1) as conso_plats_prepares,
    ROUND(conso_gpe12 + conso_gpe13,1) as conso_matieres_grasses_ajoutees,
    ROUND(conso_gpe15+conso_gpe20+conso_gpe36+conso_gpe14+conso_gpe16,1) as conso_viandes_et_oeufs,
    ROUND(conso_gpe17,1) as conso_charcuterie,
    ROUND(conso_gpe18 + conso_gpe19 + conso_gpe37,1) as conso_poissons_fruits_mer,
    ROUND(conso_gpe21 + conso_gpe38 + conso_gpe35 + conso_gpe41 + conso_gpe24 + conso_gpe25,1) as conso_fruits_legumes,
    ROUND(conso_gpe22 + conso_gpe23 + conso_gpe39 + conso_gpe42,1) as conso_legumineuses,
    ROUND(conso_gpe6 + conso_gpe10 + conso_gpe11 + conso_gpe27 + conso_gpe28,1) as conso_produits_sucres,
    ROUND(conso_gpe29 + conso_gpe30 + conso_gpe31 + conso_gpe32 + conso_gpe34,1) as conso_boissons_sans_alcool,
    ROUND(conso_gpe33,1) as conso_alcool

FROM {{ ref('stg_sante__conso-gpe-inca3') }} 