with 

source as (

    select * from {{ source('sante', 'conso-gpe-inca3') }}

),

renamed as (

    select
        population,
        noind,
        conso_gpe1,
        conso_gpe2,
        conso_gpe3,
        conso_gpe4,
        conso_gpe5,
        conso_gpe6,
        conso_gpe7,
        conso_gpe8,
        conso_gpe9,
        conso_gpe10,
        conso_gpe11,
        conso_gpe12,
        conso_gpe13,
        conso_gpe14,
        conso_gpe15,
        conso_gpe16,
        conso_gpe17,
        conso_gpe18,
        conso_gpe19,
        conso_gpe20,
        conso_gpe21,
        conso_gpe22,
        conso_gpe23,
        conso_gpe24,
        conso_gpe25,
        conso_gpe26,
        conso_gpe27,
        conso_gpe28,
        conso_gpe29,
        conso_gpe30,
        conso_gpe31,
        conso_gpe32,
        conso_gpe33,
        conso_gpe34,
        conso_gpe35,
        conso_gpe36,
        conso_gpe37,
        conso_gpe38,
        conso_gpe39,
        conso_gpe40,
        conso_gpe41,
        conso_gpe42,
        conso_gpe43,
        conso_gpe44

    from source

)

select * from renamed
