{% macro classifify_format_statnut (value) %} -- return class_IMC
     CASE  
        WHEN  {{ value }} = 0 THEN '1-Maigreur'
        WHEN  {{ value }} = 1 THEN '2-Normal'
        WHEN  {{ value }} = 2 THEN '3-Risque de surpoids'
        WHEN  {{ value }} = 3 THEN '4-Surpoids'
        WHEN  {{ value }} = 4 THEN '5-Obésité'
        WHEN  {{ value }} = 5 THEN '6-Obésité morbide'
        ELSE '0-Valeur inconnue'
    END 
{% endmacro %} 

{% macro classifify_tage_ps (value) %} -- return class_age
    CASE
        WHEN {{ value }} = 1 THEN '1-Enfant'
        WHEN {{ value }} = 2 THEN '1-Enfant'
        WHEN {{ value }} = 3 THEN '1-Enfant'
        WHEN {{ value }} = 4 THEN '1-Enfant'
        WHEN {{ value }} = 5 THEN '2-Ado'
        WHEN {{ value }} = 6 THEN '2-Ado'
        WHEN {{ value }} = 7 THEN '3-Adulte'
        WHEN {{ value }} = 8 THEN '3-Adulte'
        WHEN {{ value }} = 9 THEN '3-Adulte'
        ELSE '0-Valeur inconnue'
    END 
{% endmacro %} 

{% macro classifify_IMC (value) %} -- return class_IMC
    CASE  
--        WHEN {{ value }}  < 16 THEN '1-anorexie ou dénutrition'
--        WHEN {{ value }} >= 16.5 AND {{ value }} < 18.5 THEN '2-état de maigreur'
        WHEN {{ value }} < 18.5 THEN '2-état de maigreur'
        WHEN {{ value }} >= 18.5 AND {{ value }} < 25 THEN '3-corpulence normale'
        WHEN {{ value }} >= 25 AND {{ value }} < 30 THEN '4-surpoids'
        WHEN {{ value }} >= 30 THEN '5-obésité'
--        WHEN {{ value }} >= 30 AND {{ value }} < 35 THEN '5-obésité modérée de classe 1'
--        WHEN {{ value }} >= 35 AND {{ value }} <= 40 THEN '6-obésité sévère de classe 2'
--        WHEN {{ value }} > 40 THEN '7-obésité morbide ou massive'
        ELSE '0-Valeur inconnue'
    END 
{% endmacro %} 

{% macro classifify_fumeur (value) %} -- return class_fumeur
    CASE
        WHEN {{ value }} = 1 THEN 'Fumeur'
        WHEN {{ value }} = 2 THEN 'Fumeur'
--        WHEN {{ value }} = 3 THEN 'Non_fumeur'
--        WHEN {{ value }} = 4 THEN 'Non_fumeur'
        ELSE 'Non_fumeur'
    END
{% endmacro %} 

{% macro classifify_revenu (value) %} -- return class_revenue
    CASE
        WHEN {{ value }} >= 1 AND {{ value }} <= 7 THEN '1-Revenus_bas'
        WHEN {{ value }} > 7 AND {{ value }}  <= 11 THEN '2-Revenus_moyens'
        WHEN {{ value }} > 11 THEN '3-Revenus_eleves'
        ELSE '0-Valeur inconnue'
    END 
{% endmacro %} 

{% macro classifify_sex_ps (value) %} -- return class_sexe
    CASE 
        WHEN {{ value }} = 1 THEN 'Homme'
        ELSE 'Femme'
    END
{% endmacro %} 