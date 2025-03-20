SELECT  
  *,
    CASE
        WHEN tage_ps = 1 THEN "1-Enfant"
        WHEN tage_ps = 2 THEN "1-Enfant"
        WHEN tage_ps = 3 THEN "1-Enfant"
        WHEN tage_ps = 4 THEN "1-Enfant"
        WHEN tage_ps = 5 THEN "2-Ado"
        WHEN tage_ps = 6 THEN "2-Ado"
        WHEN tage_ps = 7 THEN "3-Adulte"
        WHEN tage_ps = 8 THEN "3-Adulte"
        WHEN tage_ps = 9 THEN "3-Adulte"
    END AS class_age,
    CASE
        WHEN fume = 1 THEN "Fumeur"
        WHEN fume = 2 THEN "Fumeur"
        WHEN fume = 3 THEN "Non_fumeur"
        WHEN fume = 4 THEN "Non_fumeur"
    ELSE "Non_fumeur"
    END AS class_fumeur,
    CASE  
--        WHEN IMC < 16 THEN '1-anorexie ou dénutrition'
--        WHEN IMC >= 16.5 AND IMC < 18.5 THEN '2-état de maigreur'
        WHEN IMC < 18.5 THEN '2-état de maigreur'
        WHEN IMC >= 18.5 AND IMC < 25 THEN '3-corpulence normale'
        WHEN IMC >= 25 AND IMC < 30 THEN '4-surpoids'
        WHEN IMC >= 30 THEN '5-obésité'
--        WHEN IMC >= 30 AND IMC < 35 THEN '5-obésité modérée de classe 1'
--        WHEN IMC >= 35 AND IMC <= 40 THEN '6-obésité sévère de classe 2'
--        WHEN IMC > 40 THEN '7-obésité morbide ou massive'
        ELSE 'Valeur inconnue'
    END AS class_IMC,
    CASE
        WHEN revenu>= 1 AND revenu<= 7 THEN 'Revenus_bas'
        WHEN revenu> 7 AND revenu <= 11 THEN 'Revenus_moyens'
        WHEN revenu> 11 THEN 'Revenus_eleves'
        ELSE 'Unknown'
    END AS class_revenue,
    CASE 
        WHEN sex_ps=1 THEN 'Homme'
        ELSE 'Femme'
    END AS class_sexe
FROM {{ ref('int_indiv-descrip') }} AS indiv
INNER JOIN {{ ref('int_actphys-sedent') }} AS actphys
  USING (NOIND)
INNER JOIN {{ ref('int_indiv_habit') }} AS habits_indiv
  USING(NOIND)
INNER JOIN {{ ref('int_men_habitudes') }} AS men_habitudes
  USING (NOMEN)
INNER JOIN {{ ref('int_conso_gpe_inca3') }} AS conso
  USING (NOIND)

