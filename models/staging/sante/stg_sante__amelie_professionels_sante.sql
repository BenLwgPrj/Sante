with 

source as (

    select * from {{ source('sante', 'amelie_professionels_sante') }}

),

renamed as (

    select
        annee,
        libelle_region,
        profession_sante,
        effectif,
        is_group

    from source

)

select * from renamed
