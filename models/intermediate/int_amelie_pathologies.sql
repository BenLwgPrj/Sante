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
            else '3-Adulte'
        end as class_age,
        --sexe,
        --region, -- codification is different from INCA3 [TODO] Must be recoded 
        --dept,
        CASE 
            WHEN dept IN ('75', '77', '78', '91', '92', '93', '94', '95') THEN 'Ile-de-France'
            WHEN dept IN ('14', '27', '50', '61', '76') THEN 'Normandie'
            WHEN dept IN ('18', '28', '36', '37', '41', '45') THEN 'Centre-Val de Loire'
            WHEN dept IN ('44', '49', '53', '72', '85') THEN 'Pays de la Loire'
            WHEN dept IN ('22', '29', '35', '56') THEN 'Bretagne'
            WHEN dept IN ('02', '59', '60', '62', '80') THEN 'Hauts-de-France'
            WHEN dept IN ('08', '10', '51', '52', '54', '55', '57', '67', '68', '88') THEN 'Grand Est'
            WHEN dept IN ('21', '25', '39', '58', '70', '71', '89', '90') THEN 'Bourgogne-Franche-Comté'
            WHEN dept IN ('01', '03', '07', '15', '26', '38', '42', '43', '63', '69', '73', '74') THEN 'Auvergne-Rhône-Alpes'
            WHEN dept IN ('04', '05', '06', '13', '83', '84') THEN "Provence-Alpes-Côte d'Azur"
            WHEN dept IN ('09', '11', '12', '30', '31', '32', '34', '46', '48', '65', '66', '81', '82') THEN 'Occitanie-Pyrénées-Méditerranée'
            WHEN dept IN ('16', '17', '19', '23', '24', '33', '40', '47', '64', '79', '86', '87') THEN 'Nouvelle-Aquitaine'
            ELSE '0-Valeur inconnue'
        END AS region_text,
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
    CASE 
        WHEN libelle_sexe = 'hommes' THEN 'Homme'
        WHEN libelle_sexe = 'femmes' THEN 'Femme'
      END as class_sexe,
    region_text,
    sum(ntop) as nb_prise_en_charge,
    avg(prev) as avg_prevalence,
    sum(npop) as nb_individu_class
from refined_table
--where -- pour tester une class d'echantillon
--    patho_niv1 = 'Cancers'
--    and dept = '01'
--    and annee= 2015
group by annee, patho_niv1, patho_niv2, patho_niv3, class_age, class_sexe, region_text
order by annee
