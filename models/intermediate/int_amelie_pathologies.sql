with refined_table as (
    select 
        annee,
        patho_niv1,
        patho_niv2,
        patho_niv3,
        --top, -- not interesting
        --cla_age_5,
        case 
            when cla_age_5 in ('00-04', '05-09') then '1-Enfant'
            when cla_age_5 in ('10-14', '15-19') then '2-Ado'
            when cla_age_5 in ('75-79', '80-84','90-94','95et+') then '4-Senior'
            else '3-Adult'
        end as class_age,
        --sexe,
        --region, -- codification is different from INCA3 [TODO] Must be recoded 
        dept,
        ntop,
        npop,
        prev,
        --`niveau prioritaire`,
        --libelle_classe_age, --redudant with `cla_age_5`
        libelle_sexe,
        --tri

    from {{ ref('stg_sante__amelie_pathologies') }}
    where  -- Remove lines that gather sub-totals and generate redundancy counts                                   
        libelle_sexe != 'tous sexes' 
        and libelle_classe_age != 'tous âges'
        and patho_niv3 is not null
)
select 
    annee,
    patho_niv1,
    patho_niv2,
    patho_niv3,
    class_age,
    libelle_sexe,
    dept,
    sum(ntop) as nb_prise_en_charge,
    avg(prev) as avg_prevalence,
    sum(npop) as nb_individu_class
from refined_table
--where -- pour tester une class d'echantillon
--    patho_niv1 = 'Cancers'
--    and dept = '01'
--    and annee= 2015
group by annee, patho_niv1, patho_niv2, patho_niv3, class_age, libelle_sexe, dept
order by annee
