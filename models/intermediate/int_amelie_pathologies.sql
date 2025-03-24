-- Remove lines that gather sub-totals and generate redundancy counts 
-- excludes tous-sexes, tous_ages and sub-total on patho_niv1&2
with class_age_table as (
    select 
        annee,
        patho_niv1,
        patho_niv2,
        patho_niv3,
        case 
            when cla_age_5 in ('00-04', '05-09') then '1-Enfant'
            when cla_age_5 in ('10-14', '15-19') then '2-Ado'
            when cla_age_5 in ('75-79', '80-84','90-94','95et+') then '4-Senior'
            else '3-Adulte'
        end as class_age,
        CASE 
            WHEN libelle_sexe = 'hommes' THEN 'Homme'
            WHEN libelle_sexe = 'femmes' THEN 'Femme'
            ELSE 'NON-DEFINI'
        END as class_sexe,
        {{ classifify_region('dept') }} as region_text,
        dept,
        ntop,
        npop

    from {{ ref('stg_sante__amelie_pathologies') }}
    where
        libelle_sexe != 'tous sexes' 
        and libelle_classe_age != 'tous âges'
        and patho_niv3 is not null
),
-- !!! npop gives pop values for a concerned class. 
-- calculate nb_individu_class in a class for each segment
nb_indiv_windows as (
    select
        *,
        sum(npop) OVER (
            PARTITION BY annee, 
                region_text,
                class_sexe,
                class_age,
                patho_niv1,
                patho_niv2,
                patho_niv3
        ) as nb_individu_class
    from class_age_table
),
-- regroup data by class_age and region 
agg_age_region_table as (
    select
        annee,
        region_text,
        class_sexe,
        class_age,
        --npop,
        max(nb_individu_class) as nb_individu_class, -- takes the max npop of concerned individu in class
        patho_niv1,
        patho_niv2,
        patho_niv3,
        sum(ntop) as nb_prise_en_charge
    from nb_indiv_windows
    group by
        annee,
        region_text,
        class_sexe,
        class_age,
        patho_niv1,
        patho_niv2,
        patho_niv3
)
select *
from agg_age_region_table
WHERE  region_text != '0-Corse et DOM-TOM'  --excluded in INCA study
-- pour tester une class d'echantillon
--    and patho_niv3 = 'Accident vasculaire cérébral aigu'
order by annee, region_text, class_sexe, class_age
-- select 
--     annee,
--     patho_niv1,
--     patho_niv2,
--     patho_niv3,
--     class_age,
--     class_sexe,
--     region_text,
--     sum(nb_prise_en_charge) as nb_prise_en_charge,
--     sum(nb_individu_class) as nb_individu_class
-- from agg_age_table
-- pour tester une class d'echantillon
--     patho_niv3 = 'Accident vasculaire cérébral aigu'
--     and region_text = 'Auvergne-Rhône-Alpes'
--     and annee= 2015
-- group by annee, patho_niv1, patho_niv2, patho_niv3, class_age, class_sexe , region_text

