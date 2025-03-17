with 

source as (

    select * from {{ source('sante', 'indiv-hab') }}

),

renamed as (

    select
        noind,
        periode_reference,
        conso_bebe_sein,
        diversification_alim_bebe,
        lait_plussouvent,
        etablissement_scolaire,
        lieu_repas_midi,
        cantine_freq,
        collation_freq,
        collation_aliment1,
        collation_aliment2,
        collation_aliment3,
        collation_aliment4,
        distributeur_freq,
        distributeur_sodas,
        distributeur_eaux,
        restaurationrapide_freq,
        etiquette_freq,
        etiquette_ingredients,
        etiquette_contenu_nutri,
        etiquette_message_nutri,
        etiquette_effets_benefiques,
        conso_cereales,
        conso_legumes_horspdt,
        conso_pdt,
        conso_riz_pates,
        conso_fruits,
        conso_yaourts,
        conso_autres_desserts,
        conso_fromage,
        conso_viande,
        conso_poisson,
        conso_jambon,
        conso_oeufs,
        conso_gateaux,
        conso_pain,
        conso_jus,
        conso_plats_faits_maison,
        autoconsommation,
        autoconsommation_type,
        conso_aliments_bio,
        consommation_bio,
        consommation_bio_type

    from source

)

select * from renamed
