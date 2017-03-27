USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[OrdreMedGebyr]    Script Date: 27.03.2017 13:23:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[OrdreMedGebyr]
AS
select t1.CustomerNo, t1.OrderCopyNo, t1.InvoiceNo, t1.UniqueID, t1.ZUsrOECredit, DENSE_RANK() Over (Partition BY t1.invoiceno Order By t1.uniqueID) as radnr, 
CAST((CASE WHEN t2.ZUsrOECredit = 1 and t1.ZUsrOECredit = 0 and DENSE_RANK() Over (Partition BY t1.invoiceno Order By t1.uniqueID) = 1 then t2.InvoiceFee 
WHEN t2.ZUsrOECredit = 0 and t1.ZUsrOECredit = 0 and DENSE_RANK() Over (Partition BY t1.invoiceno Order By t1.uniqueID) = 1 then t2.InvoiceFee
ELSE 0 END)as decimal(9,2)) as Fee
from medlemsregnskap.CustomerOrderCopy as t1
inner join medlemsregnskap.customerordercopy as t2 on t1.customerno = t2.customerno and t1.invoiceno = t2.invoiceno and t2.totalamount <>0
inner join medlemsregnskap.DebLTransaction as t3 on t1.customerno = t3.customerno and t1.invoiceno = t3.VoucherNo
where t1.ZUsrOECredit = 0 and t3.NumberOfReminders > 4 and t3.VoucherTypeNo = 10012




GO

