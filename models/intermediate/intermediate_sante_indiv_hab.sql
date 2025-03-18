with 

source as (

    select * from {{ source('sante', 'indiv-hab') }}

),

renamed as (

    select
        noind,
        population,
        periode_reference,
        conso_bebe_sein,
        diversification_alim_bebe,
        etablissement_scolaire,
        cantine_freq,
        collation_freq,
        distributeur_sodas,
        restaurationrapide_freq,
        etiquette_message_nutri,
        etiquette_effets_benefiques,
        conso_plats_faits_maison,
        autoconsommation,
        autoconsommation_type,
        consommation_bio,
        consommation_bio_type

    from source

)

select * from renamed
