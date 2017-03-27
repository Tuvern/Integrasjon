USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[efakturastatus]    Script Date: 27.03.2017 13:18:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[efakturastatus]
AS
SELECT     CustomerNo, EinvoiceStatus, DepNo
FROM         medlemsregnskap.Customer
where EinvoiceStatus in (2,4) and LastUpdate between CONVERT(VARCHAR(10), GETDATE()-30,120) and CONVERT(datetime, GETDATE()+1,120)


GO


