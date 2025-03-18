SELECT
    --POPULATION,
    NOMEN,
    choix_aliment_origine,
    choix_aliment_prix,
    choix_aliment_facilite_prepa,
    choix_aliment_mode_prod,
    choix_aliment_compo_nutri,
    choix_aliment_raison_sante,
    lieu_achat_fruits_frais+lieu_achat_legumes_frais AS lieu_achat_fruits_leg,
    lieu_achat_pain+lieu_achat_patisseries AS lieu_achat_boulangerie,
    lieu_achat_viandes,
    lieu_achat_poissons_frais
 FROM {{ ref('stg_sante__men-habitudes') }}
 --GROUP BY POPULATION,NOMEN,choix_aliment_origine,choix_aliment_prix,choix_aliment_facilite_prepa,choix_aliment_mode_prod,choix_aliment_compo_nutri,choix_aliment_raison_sante,lieu_achat_viandes,lieu_achat_poissons_frais