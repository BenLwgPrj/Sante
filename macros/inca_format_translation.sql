{% macro format_statnut (val) %} -- return IMC_categorie
     CASE  
        WHEN  {{ val }} = 0 THEN 'Maigreur'
        WHEN  {{ val }} = 1 THEN 'Normal'
        WHEN  {{ val }} = 2 THEN 'Risque de surpoids'
        WHEN  {{ val }} = 3 THEN 'Surpoids'
        WHEN  {{ val }} = 4 THEN 'Obésité'
        WHEN  {{ val }} = 5 THEN 'Obésité morbide'
        ELSE 'Valeur inconnue'
    END 
{% endmacro %} 

{% macro classifify_tage_ps (tage_ps) %} -- return class_age
    CASE
        WHEN val = 1 THEN "1-Enfant"
        WHEN val = 2 THEN "1-Enfant"
        WHEN val = 3 THEN "1-Enfant"
        WHEN val = 4 THEN "1-Enfant"
        WHEN val = 5 THEN "2-Ado"
        WHEN val = 6 THEN "2-Ado"
        WHEN val = 7 THEN "3-Adulte"
        WHEN val = 8 THEN "3-Adulte"
        WHEN val = 9 THEN "3-Adulte"
    END 
{% endmacro %} 


