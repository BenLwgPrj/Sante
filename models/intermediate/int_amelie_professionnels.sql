select 
    annee,
    REPLACE(libelle_region, 'Occitanie-Pyrénées-Méditerranée', 'Occitanie') AS libelle_region,
    --libelle_region,
    profession_sante,
    sum(effectif) as effectif
from {{ ref('stg_sante__amelie_professionels_sante') }}
where libelle_region NOT IN ('Corse', 'Guadeloupe', 'Guyane', 'La Réunion', 'Martinique', 'Mayotte')
    and is_group = False 
group by 
    annee,
    libelle_region,
    profession_sante
order by libelle_region ASC