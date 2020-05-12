-- Open Sales Orders NAV (usa-datapool)

SELECT soli.SalesOrderId as 'SO#',
	   c.AccountId as 'Acct#', 
	   c.CompanyName as 'Company',
	   (spc.SalesPostingCode + ' - ' + SPCDescription) as 'SPC', 
	   t.TerritoryId as 'Terr', 
	   pc.PriceClass,
	   p.PartNumber as 'PN#', 
	   p.Description as 'Product', 
	   stat.SalesOrderStatus as 'Status', 
	   soli.OrderQuantity as 'Qty',
	   soli.ExtendedPrice as 'Ext Price'

FROM [EXTRON_EDWPROD].[Sales].[factSalesOrderLineItems] soli
       INNER JOIN [EXTRON_EDWPROD].[Production].dimProducts p on soli.skPartNumberId=p.skPartNumberId
       INNER JOIN [EXTRON_EDWPROD].[Sales].[dimPostingCodes] spc on soli.skSalesPostingCodeId=spc.skSalesPostingCodeId
       INNER JOIN [EXTRON_EDWPROD].[Sales].[dimSalesOrderStatus] stat on soli.skLineItemStatusId=stat.skSalesOrderStatusId
       INNER JOIN [EXTRON_EDWPROD].[Sales].[dimSalesOrders] so on soli.SalesOrderId=so.SalesOrderId
       INNER JOIN [EXTRON_EDWPROD].[Sales].dimCustomers c on so.skAccountId = c.skAccountId
       INNER JOIN [EXTRON_EDWPROD].[Sales].[dimTerritories] t on c.skShipToTerritoryId=t.skTerritoryId
       INNER JOIN [EXTRON_EDWPROD].[Sales].[dimPriceClasses] pc on c.skShipToPriceClassId = pc.skPriceClassId
       INNER JOIN [EXTRON_EDWPROD].[Sales].[dimSalesOrderStatus] lis on soli.skLineItemStatusId=lis.skSalesOrderStatusId

WHERE p.PartNumber in ('60-1525-01','60-1525-03','60-1525-12','60-1525-14','60-1534-01','60-1572-01','60-1572-02','60-1572-07','60-1572-08','60-1572-15','60-1572-16','60-1572-19','60-1572-20')
       and stat.SalesOrderStatus <> 'Invoiced'
       
ORDER BY soli.SalesOrderId