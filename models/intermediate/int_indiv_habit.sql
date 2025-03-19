SELECT
    noind,
    --population,
    distributeur_sodas,
    restaurationrapide_freq,
    etiquette_message_nutri,
    etiquette_effets_benefiques,
    autoconsommation_type,
    consommation_bio,
    consommation_bio_type

FROM {{ ref('stg_sante_indiv_hab') }}