--Product Family Lookup (usa-datapool)

SELECT p.PartNumber as 'PN#', p.Description, pc.ProductClassCode as 'PCC', pc.ProductClass as 'Product Class'
         ,pf.ProductFamily, pf.Category1 as 'Category1', p.Phase

FROM [EXTRON_EDWPROD].[Production].dimProducts p 
         inner join [EXTRON_EDWPROD].[Production].dimProductClasses pc on p.skProductClassCodeId=pc.skProductClassId
         inner join [EXTRON_EDWPROD].[common].dimDate d on p.skLastActivityDateId=d.skDateId
         left join [MarketingAnalysis].[dbo].[ProductFamily] pf on pf.PartNumber=p.[PartNumber]

WHERE p.PartNumber like '79-%'
       and pf.Category1 = 'linklicense'
ORDER BY pf.ProductFamily, pf.category1, p.PartNumber
