<h1>Тестовое задание<h1>
<h2>Задание № 1 установка программы<h2>
<p>
<ul>
	<li>клонируйте репозиторий</li>
	<li>подтяните зависимости композера</li>
	<li>можно установить бд с тестовыми данными .\text_news.sql</li>
</ul>
</p>

<h2>Задание № 2<h2>
<p>
<strong>Задача 1:</strong>
Необходимо реализовать зависимость Многие ко многим с помошью промежуточной связующей таблицы
Например:
Таблица posts
id
name
text

Табица authors
id 
name

Связующая табица posts_authors
post_id
author_id

Пример Запроса всех авторов поста
SELECT a.id, a.name FROM posts p
JOIN posts_authors p_a ON p_a.post_id = p.id
JOIN AUTHORS a ON a.id = p_a.author_id
WHERE p.id = 1
</p>
<p>
<strong>Задача 2:</strong>
SELECT m.first_name, m.last_name, COUNT(*) claim_count, SUM(c.sum) claim_total_sum FROM manager m 
JOIN claim c ON c.manager_id = m.id
WHERE 1
GROUP BY m.id
</p>
<p>
<strong>Задача 3:</strong>
SELECT CONCAT(m.first_name, ' ', m.last_name) full_name, COUNT(c.id) claim_quantity FROM manager m
JOIN claim c ON c.manager_id = m.id 
GROUP BY m.id ORDER BY claim_quantity LIMIT 2
</p>
<p>
<strong>Задача 4:</strong>
SELECT m.first_name, m.chief_id
FROM manager m 
WHERE 
	(SELECT COUNT(*) FROM claim c WHERE c.manager_id = m.id ) > (SELECT COUNT(*) FROM claim c WHERE c.manager_id = m.chief_id )
	AND m.chief_id IS NOT NULL
</p>
<p>
<strong>Задача 5:</strong>
SELECT COUNT(*) 'claim_count', CONCAT(MONTHNAME(created_at), ' ', YEAR(created_at) ) 'month', SUM(SUM) 'claim_total_sum' FROM claim WHERE 1 GROUP BY MONTH(created_at)
</p>
<p>
<strong>Задача 6:</strong>
SELECT *, AVG(`sum`) 'avg', COUNT(*) FROM manager m
JOIN claim c ON c.manager_id = m.id
WHERE MONTH(created_at) = 7 AND YEAR(created_at) = 2013
GROUP BY m.id ORDER BY AVG DESC
<br>* хочу сделать поправочку, что для денег лучше DECIMAL
</p>
