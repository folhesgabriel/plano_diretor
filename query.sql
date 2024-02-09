-- 1.1--  query para gerar base de dados de empresas de interesse


with cnpj as (
SELECT * 
FROM basedosdados.br_me_cnpj.estabelecimentos
WHERE data = '2022-07-09' and
 id_municipio = '1501402'AND (cnae_fiscal_principal IN (
  '8112500', 
  '5510801', 
  '6422100', 
  '8531700', 
  '8541400', 
  '8513900', 
  '8610101', 
  '8610102',
  '4711302') OR
cnpj_basico IN ( 
  SELECT cnpj_basico 
  FROM basedosdados.br_me_cnpj.empresas where data = '2022-07-09' AND natureza_juridica IN ('2011', '3085', '1112', '1015', '3220')
  )
) 
)
SELECT *
FROM cnpj
INNER JOIN (SELECT * FROM basedosdados.br_me_cnpj.empresas where data = '2022-07-09') as cnpj2
ON cnpj.cnpj_basico = cnpj2.cnpj_basico

