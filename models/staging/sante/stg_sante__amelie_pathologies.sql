with 

source as (

    select * from {{ source('sante', 'amelie_pathologies') }}

),

renamed as (

    select
        annee,
        patho_niv1,
        patho_niv2,
        patho_niv3,
        --top, -- not interesting
        cla_age_5,
        sexe,
        libelle_sexe,
        -- region,  -- codification is different from INCA3 [] Must be recoded 
        dept,
        ntop,
        npop,        
        --prev,  --dropped to be recalculated in VIZ
        --`niveau prioritaire`,
        libelle_classe_age, 
        --tri

    from source

)

select * from renamed
