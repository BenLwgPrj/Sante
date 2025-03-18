select
        --population,
        noind,
        transport_personnel,
        transport_ecole,
        tv_duree,
        jvideo_duree,
        ordi_duree,
        jeux_pleinair_nbjours,
        eps_duree,
        club_nbjours,
        club_nb,
        activite_musculation_nbjours,
        activite_moderee_nbjours,
        activite_intense_nbjours,
        emploi_4sem,
        travail_freq_semaine,
        travail_duree,        
        travail_score,
        --regrouper transport
        COALESCE(transport_voiture_score, 0) + COALESCE(transport_public_score, 0) AS transport_motorise,
        COALESCE(transport_velo_score, 0) + COALESCE(transport_pied_score, 0) AS transport_actif,
        activite_total_duree,
        activite_total_score,
        nap,
        profil_activite,
        sedentarite,
        sedentarite_duree
from {{ ref('stg_sante__actphys') }}