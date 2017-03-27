USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[Purregebyr]    Script Date: 27.03.2017 13:27:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[Purregebyr]
AS
SELECT        TOP (100) PERCENT ContraEntryChainNo, SUM(Amount) AS Belop
FROM            Medlemsregnskap.DebLTransaction
WHERE        (VoucherTypeNo = 513)
GROUP BY ContraEntryChainNo
ORDER BY ContraEntryChainNo









GO

