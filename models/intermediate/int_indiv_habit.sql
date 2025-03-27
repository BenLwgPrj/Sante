--with tab as (
    SELECT
        noind,
        --population,
        distributeur_sodas,
        restaurationrapide_freq,
        etiquette_message_nutri,
        etiquette_effets_benefiques,
        autoconsommation_type,
        CASE 
            WHEN consommation_bio = 1 THEN 1
            ELSE 0
        END AS consommation_bio,
        consommation_bio_type

    FROM {{ ref('stg_sante_indiv_hab') }}
-- )
-- select *
-- from tab
-- where consommation_bio = 1