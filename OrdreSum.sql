USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[Ordresum]    Script Date: 27.03.2017 13:23:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[Ordresum]
AS
SELECT     TOP (100) PERCENT SUM(Amount) AS Amount, Invoiceno, ordercopyno
FROM         Medlemsregnskap.CustomerOrderLineCopy
GROUP BY InvoiceNo, OrdercopyNo
ORDER BY InvoiceNo, OrderCopyNo



GO

