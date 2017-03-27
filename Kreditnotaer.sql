USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[Kreditnotaer]    Script Date: 27.03.2017 13:23:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





create VIEW [dbo].[Kreditnotaer]
AS
SELECT        TOP (100) PERCENT ContraEntryChainNo, COUNT(*) AS Antall
FROM            medlemsregnskap.DebLTransaction
WHERE        (VoucherTypeNo = 10013)
GROUP BY ContraEntryChainNo
ORDER BY ContraEntryChainNo





GO

