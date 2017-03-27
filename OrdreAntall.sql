USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[OrdreAntall]    Script Date: 27.03.2017 13:23:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create VIEW [dbo].[OrdreAntall]
AS
Select TOP (100) PERCENT Customerno, Invoiceno, count(*) as Antall from medlemsregnskap.CustomerOrderCopy
where ZUsrOECredit = 0
group by Customerno, InvoiceNo
order by Customerno, InvoiceNo





GO

