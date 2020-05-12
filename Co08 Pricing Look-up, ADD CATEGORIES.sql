--Price Update History Lookup for Co08 SA Pricing (usa-datapool) 

SELECT [CO#],[ProductCategory], [PCC], [PRICE-LIST], [PART NUMBER] as 'PN#'
      ,[Description] as 'PRODUCT',[NEW PRICE(S)], [CHANGE DATE], [REASON]

FROM [EXTRON_EDWPROD].[Production].[dimProducts] c
     LEFT JOIN [MarketingAnalysis].[dbo].[PriceUpdateHistory] p on c.PartNumber=p.[PART NUMBER]
	 INNER JOIN [EXTRON_EDWPROD].[Production].dimProductCategories pc on c.PartNumber=pc.PARTNUMBER

WHERE [PRICE-LIST] = 'S3+' AND [CO#] = 'Co08'
       and [NEW PRICE(S)] = 63
 
       --and description like '%VM%'

ORDER BY [PCC], [PART NUMBER]
