select 
    annee,
    patho_niv1,
    patho_niv2,
    patho_niv3,
    --top, -- not interesting
    cla_age_5,
    --sexe,
    --region, -- codification is different from INCA3 [TODO] Must be recoded 
    dept,
    ntop,
    npop,
    prev,
    --`niveau prioritaire`,
    libelle_classe_age,
    libelle_sexe,
    --tri

from {{ ref('stg_sante__amelie_pathologies') }}
where libelle_sexe != 'tout sexe'
    and libelle_classe_age != 'tous âges'
order by annee, dept