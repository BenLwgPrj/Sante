with 

source as (

    select * from {{ source('sante', 'amelie_pathologies') }}

),

renamed as (

    select
        annee,
        region,
        patho_niv1,
        patho_niv2,
        patho_niv3,
        prise_en_charge

    from source

)

select * from renamed
