
use joi;
/*a) Listar os nomes dos assinantes, seguido dos dados do endereço e os telefones  correspondentes.*/
select a.nome as Nome ,e.ds_endereco as Descrição,e.bairro as Bairro,e.CEP as cep,e.complemento as complemento ,t.ddd as DDD,t.n_fone as numero
from assinante a inner join endereco e on a.cd_assinante = e.cd_assinante
inner join telefone t on  e.cd_endereco = t.cd_endereco;

/*b) Listar os nomes dos assinantes, seguido do seu ramo, ordenados por ramo e  posteriormente por nome.*/
select a.nome as nome,r.ds_ramo from assinante a inner join ramo r on r.cd_ramo = a.cd_ramo
order by r.ds_ramo asc ,a.nome asc ;

/*c) Listar os assinantes do município de Pelotas que são do tipo residencial.*/
select a.nome as nome,t.ds_tipo as descrição,m.ds_municipio as municipio 
from assinante a inner join tipo t on t.cd_tipo = a.cd_tipo
inner join endereco e on a.cd_assinante = e.cd_assinante
inner join municipio m on m.cd_municipio = e.cd_municipio 
where m.ds_municipio = 'Pelotas'
and t.ds_tipo = 'residencial';

/*d) Listar os nomes dos assinantes que possuem mais de um telefone.*/
select a.nome as Nome
from assinante a inner join endereco e on a.cd_assinante = e.cd_assinante
inner join telefone t on  e.cd_endereco = t.cd_endereco
group by a.cd_assinante,a.nome
HAVING COUNT(e.cd_assinante) > 1;

/*e) Listar os nomes dos assinantes seguido do número do telefone, tipo de assinante  comercial, com endereço em Natal ou João Câmara.*/
select a.nome,f.ddd as DDD ,f.n_fone as telefone,t.ds_tipo as tipo ,e.ds_endereco as endereco
from assinante a inner join tipo t on t.cd_tipo = a.cd_tipo
inner join endereco e on a.cd_assinante = e.cd_assinante
inner join municipio m on m.cd_municipio = e.cd_municipio
inner join telefone f on e.cd_endereco = f.cd_endereco
where t.ds_tipo = 'comercial'
and (m.ds_municipio = 'Natal' or m.ds_municipio = 'João Câmara');