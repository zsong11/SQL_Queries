--- SALES ORDER DETAILS REPORT (INVOICED) (usa-datapool)

SELECT i.SalesOrderId as 'SO#', d.DateId as 'Inv Date', ds.DateId as 'SO Date'
      ,c.AccountId as 'ShipToAcct', c.CompanyName, c.BillToAccountId
	  ,p.PartNumber, p.Description, il.ShipQuantity, il.ExtendedPrice, t.TerritoryName
	  ,(pc.ProductClass + ' (' + pc.ProductClassCode + ')') as 'PCC_Desc'
	  ,i.InvoiceId, c.CompanyNo, pl.PriceListId, ps.PriceClass, p.PartNumber
	  ,(p.Description + ' (' + p.PartNumber + ')') as "PN_Desc"
	  ,c.address1, c.address2 ,c.address3
	  ,geo.city, geo.StateProv, geo.PostalCode, geo.Country
	  --,st.[SHIP-TO NAME] working with jim hawking

FROM [EXTRON_EDWPROD].[Sales].[dimInvoices] i	
      inner join [EXTRON_EDWPROD].[Sales].factInvoiceLineItems il on i.InvoiceRecordID=il.invoiceREcordId	
      inner join [EXTRON_EDWPROD].[Production].dimProducts p on il.skPartNumberId=p.skPartNumberId
	  inner join [EXTRON_EDWPROD].[Production].dimProductClasses pc on p.skProductClassCodeId=pc.skProductClassId
	  left join [EXTRON_EDWPROD].[Sales].dimCustomers c on i.skAccountId = c.skAccountId
	  inner join [EXTRON_EDWPROD].[Sales].[dimTerritories] t on c.skShipToTerritoryId=t.skTerritoryId
	  inner join [EXTRON_EDWPROD].[Sales].[dimPriceLists] pl on i.skSaleOrderPriceListId=pl.skPriceListId
	  inner join [EXTRON_EDWPROD].[Sales].[dimPriceClasses] ps on i.skPriceClassId = ps.skPriceClassId
	  inner join [EXTRON_EDWPROD].[common].[dimDate] d on i.skInvoiceDateId=d.skDateId
	  inner join [EXTRON_EDWPROD].[common].[dimDate] ds on i.skSalesOrderDateId=ds.skDateId
	  LEFT JOIN [EXTRON_EDWPROD].[common].[dimGeography] geo on c.skShipToGeographyId=geo.skGeographyId
	  --left join [usa-sqldev3].[dbERP].[dbo].[SOShipTo] st on i.SalesOrderId=STR(st.[so number], 18, 0)

WHERE 	
	  p.PartNumber like '60-111%'
	  and IsStandardSale = 1

ORDER BY d.DateId DESC