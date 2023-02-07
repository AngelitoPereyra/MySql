select nombre from producto;
select nombre, precio from producto;
select * from producto;
select nombre, round(precio) from producto;
select f.codigo from fabricante f inner join producto p on p.codigo_fabricante = f.codigo group by f.codigo having count(p.codigo_fabricante) >= 1;
select distinct f.codigo from fabricante f inner join producto p on p.codigo_fabricante = f.codigo group by f.codigo;
select nombre from fabricante order by nombre asc;
INSERT INTO producto VALUES(12, 'Disco duro SATA3 1TB', 100, 5); select nombre, precio from producto order by nombre asc, precio asc;
select * from fabricante limit 5;
select nombre, precio from producto order by precio asc limit 1;
select nombre, precio from producto order by precio desc limit 1;
select nombre, precio from producto where precio <= 120 order by precio asc;
select nombre, precio from producto where precio between 60 and 200;
select * from producto where codigo_fabricante in(1, 3, 5);
select * from producto where nombre like "%Portátil%";
select p.codigo, p.nombre, f.codigo, f.nombre from producto p, fabricante f where f.codigo= p.codigo_fabricante;
select p.nombre, p.precio, f.nombre from producto p, fabricante f where f.codigo = p.codigo_fabricante order by f.nombre asc;
select p.nombre, p.precio, f.nombre from producto p, fabricante f where f.codigo = p.codigo_fabricante order by p.precio asc limit 1;
select p.nombre, f.nombre from producto p, fabricante f where f.codigo = p.codigo_fabricante and p.codigo_fabricante = 2;
select p.nombre, f.nombre from producto p, fabricante f where f.codigo = p.codigo_fabricante and p.codigo_fabricante = 6 and precio >= 200 order by precio desc;
select p.nombre, f.nombre from producto p, fabricante f where f.codigo = p.codigo_fabricante and f.nombre in("Asus", "Hewlett-Packard");
select p.nombre, p.precio, f.nombre from producto p, fabricante f where f.codigo = p.codigo_fabricante and p.precio >= 180 order by p.precio desc, p.nombre asc;
select f.nombre, p.nombre from fabricante f left join producto p on f.codigo = p.codigo_fabricante;
select f.nombre, p.nombre from fabricante f left join producto p on f.codigo = p.codigo_fabricante where p.codigo_fabricante is null;
select nombre from producto where codigo_fabricante = (select codigo from fabricante where nombre in ("Lenovo"));
select * from producto where precio in((select max(precio) from producto where codigo_fabricante = 2));
update producto set precio = 559 where codigo = 10;
select * from producto where codigo_fabricante=2 and precio=(select max(precio) from producto where codigo_fabricante=2);
select * from producto where codigo_fabricante = 2 and precio >(select avg(precio) from producto);
select p.nombre, p.codigo_fabricante from producto p where p.codigo_fabricante in (1,2,3,4,5,6,7)  order by codigo_fabricante asc;
select f.nombre from producto p, fabricante f where f.codigo in (8,9) group by f.nombre;

select f.nombre,  count(codigo_fabricante)"cantidad"
from fabricante f, producto p 
where f.codigo = p.codigo_fabricante 
group by f.nombre 
having count(codigo_fabricante) = 
(select count(codigo_fabricante) from producto where codigo_fabricante =2);


















/*
SELECT p.equipo_local, (sum(p.puntos_local) + sum(p.puntos_visitante)) / 2 as 'Media_de_puntos'
FROM partidos as p
INNER JOIN equipos as e
ON p.equipo_local = e.nombre
WHERE e.division = 'Pacific'
GROUP BY p.equipo_local;

*/