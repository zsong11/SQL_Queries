USe dbweblogs
SELECT     logDateTime, 
		   serverip, 
		   requestmethod, 
		   uristem, uriquery, 
		   username, 
		   clientip, 
		   useragent, 
		   httpreferer, 
		   hostname
FROM       dbo.view_logData
WHERE     (uriStem LIKE '%/company/article.aspx%') and (uriquery like 'id=%') AND (requestMethod LIKE '%get%') 
AND (clientIp NOT LIKE '10.%') 
--AND (logdate between '2008-01-01' and '2008-01-31')
--AND (logdate between '2008-02-01' and '2008-02-29')
--AND (logdate between '2008-03-01' and '2008-03-31')
--AND (logdate between '2008-04-01' and '2008-04-30')
--AND (logdate between '2008-05-01' and '2008-05-31')
--AND (logdate between '2008-06-01' and '2008-06-30')
AND (logDateTime between '11/1/2009' and '11/16/2009')
order by logdatetime
