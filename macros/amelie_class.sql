{% macro classify_libelle_sexe (value) %}
    CASE 
        WHEN {{ value }}  = 'hommes' THEN 'Homme'
        WHEN {{ value }}  = 'femmes' THEN 'Femme'
        ELSE 'NON-DEFINI'
    END
{% endmacro %} 

{% macro classify_cla_age_5 (value) %}
    case 
        when {{ value }}  in ('00-04', '05-09') then '1-Enfant'
        when {{ value }}  in ('10-14', '15-19') then '2-Ado'
        when {{ value }}  in ('80-84','90-94','95et+') then '4-Senior'
        else '3-Adulte'
    end 
{% endmacro %} 

{% macro classify_cla_age_5_wo_senior (value) %}
    case 
        when {{ value }}  in ('00-04', '05-09') then '1-Enfant'
        when {{ value }}  in ('10-14', '15-19') then '2-Ado'
        else '3-Adulte'
    end 
{% endmacro %} 

{% macro classify_region (value) %}
    CASE 
        WHEN {{ value }} IN ('75', '77', '78', '91', '92', '93', '94', '95') THEN 'Ile-de-France'
        WHEN {{ value }} IN ('14', '27', '50', '61', '76') THEN 'Normandie'
        WHEN {{ value }} IN ('18', '28', '36', '37', '41', '45') THEN 'Centre-Val de Loire'
        WHEN {{ value }} IN ('44', '49', '53', '72', '85') THEN 'Pays de la Loire'
        WHEN {{ value }} IN ('22', '29', '35', '56') THEN 'Bretagne'
        WHEN {{ value }} IN ('02', '59', '60', '62', '80') THEN 'Hauts-de-France'
        WHEN {{ value }} IN ('08', '10', '51', '52', '54', '55', '57', '67', '68', '88') THEN 'Grand Est'
        WHEN {{ value }} IN ('21', '25', '39', '58', '70', '71', '89', '90') THEN 'Bourgogne-Franche-Comté'
        WHEN {{ value }} IN ('01', '03', '07', '15', '26', '38', '42', '43', '63', '69', '73', '74') THEN 'Auvergne-Rhône-Alpes'
        WHEN {{ value }} IN ('04', '05', '06', '13', '83', '84') THEN "Provence-Alpes-Côte d'Azur"
        WHEN {{ value }} IN ('09', '11', '12', '30', '31', '32', '34', '46', '48', '65', '66', '81', '82') THEN 'Occitanie-Pyrénées-Méditerranée'
        WHEN {{ value }} IN ('16', '17', '19', '23', '24', '33', '40', '47', '64', '79', '86', '87') THEN 'Nouvelle-Aquitaine'
        ELSE '0-Corse et DOM-TOM'
    END 
{% endmacro %} 
