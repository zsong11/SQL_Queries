
--Digital Marketing

--Populating the additional customer fields; tabs: ‘User Details’ and ‘DownloadTrack’.


--SQL Contacts (usa-datapool)

SELECT con.contactid as 'ContactID', right(con.contactid, charindex('*', reverse(con.contactid)) - 1) as 'ContactID2', cus.AccountId as 'ShipTo Acct#'
       ,cus.CompanyName, pc.PriceClassId, pc.PriceClass, pl.PriceListCode, t.TerritoryId, con.ContactName, con.Title, con.Department, con.Email 
       ,cus.Address1, cus.Address2, cus.Address3, g.City, g.StateProv, g.PostalCode, g.Country

FROM [EXTRON_EDWPROD].[Sales].[dimCustomerContacts] con
  LEFT JOIN [EXTRON_EDWPROD].[Sales].[dimCustomers] cus ON con.[skAccountId]=cus.[skAccountId]
  LEFT JOIN [EXTRON_EDWPROD].[common].[dimGeography] g on cus.skShipToGeographyId=g.skGeographyId
  LEFT JOIN [EXTRON_EDWPROD].[Sales].[dimPriceClasses] pc on cus.skShipToPriceClassId=pc.skPriceClassId
  INNER JOIN [EXTRON_EDWPROD].[Sales].[dimTerritories] t on cus.skShipToTerritoryId=t.skTerritoryId
  INNER JOIN [EXTRON_EDWPROD].[Sales].[dimPriceLists] pl on cus.skShipToPriceListId=pl.skPriceListId

WHERE charindex('*', reverse(con.contactid))>0 and right(con.contactid, charindex('*', reverse(con.contactid)) - 1) 
	  in (' ')
	  AND cus.AccountId not like '%end999%'

WHERE con.Email in (' ')
      
