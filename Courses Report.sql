--Courses Report (usa-datapool)

SELECT co.Name as 'Course Name', cl.ClassLocation, 
	   con.ContactName, 
	   st.AKA as 'Certificate Name', 
	   cu.CompanyName,
	   UPPER(st.PoloSize) as 'Polo Size',
	   st.MailToAddress1+' '+st.MailToAddress2+' '+st.MailToAddress3 as 'Mail to Address', 
	   st.MailToCity+' '+st.MailToState+' '+st.MailToPostalCode+' '+st.MailToECC as 'City ST Zip',d3.DateId as 'Start Date', 
	   (d3.dateid + cl.TotalDays -1) as 'Complete Date'
         
FROM [EXTRON_EDWPROD].[training].[factStudentCourses] sc
       INNER JOIN [EXTRON_EDWPROD].[training].[dimCourses] co on sc.skCourseId=co.skCourseId
       INNER JOIN [EXTRON_EDWPROD].[training].[dimClasses] cl on sc.skClassId=cl.skClassId
       INNER JOIN [EXTRON_EDWPROD].[training].[dimInstitutes] ins on co.skInstituteId=ins.skInstituteId
       INNER JOIN [EXTRON_EDWPROD].[training].[dimStudents] st on sc.skStudentId=st.skStudentId
       INNER JOIN [EXTRON_EDWPROD].[Sales].[dimCustomerContacts] con on st.skContactId=con.skContactId
       INNER JOIN [EXTRON_EDWPROD].[Sales].[dimCustomers] cu on sc.skAccountId=cu.skAccountId
       INNER JOIN [EXTRON_EDWPROD].[Sales].[dimTerritories] t on cu.skShipToTerritoryId=t.skTerritoryId
       INNER JOIN [EXTRON_EDWPROD].[Sales].[dimPriceClasses] pr on cu.skShipToPriceClassId=pr.skPriceClassId
       INNER JOIN [EXTRON_EDWPROD].[common].dimDate d1 on sc.skDateEnrolledId=d1.skDateId
       INNER JOIN [EXTRON_EDWPROD].[common].dimDate d2 on sc.skDateCompletedId=d2.skDateId
       INNER JOIN [EXTRON_EDWPROD].[common].dimDate d3 on cl.skStartDateId=d3.skDateId

WHERE cl.ClassId = 1018877

ORDER BY con.ContactName
