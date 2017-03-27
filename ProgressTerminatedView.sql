USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[ProgressTerminatedView]    Script Date: 27.03.2017 13:26:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[ProgressTerminatedView]
AS

select a.CustomerNo, a.VoucherNo, b.OrderCopyNo, a.RestAmount, a.VoucherDate, a.ContraEntryNo, c.Password, a.LastDateReminder, a.PaymentCode, a.NumberOfReminders,a.DueDate, a.DelayDate, COUNT(*) AS Expr1, d.Amount, a.VoucherTypeNo, a.DepNo, a.LastDateInterestCalculation as oppsagt, (e.Fee*-1) as InvoiceFee
from medlemsregnskap.DebLTransaction a
inner join medlemsregnskap.CustomerOrderCopy b on a.customerno = b.customerno and a.VoucherNo = b.InvoiceNo
inner join medlemsregnskap.Customer c on a.CustomerNo = c.customerno
inner join dbo.ordresum d on b.invoiceno = d.invoiceno and b.OrderCopyNo = d.ordercopyno
inner join dbo.OrdreMedGebyr e on b.invoiceno = e.invoiceno and b.OrderCopyNo = e.ordercopyno
group by a.CustomerNo, a.VoucherNo,b.OrderCopyNo, a.RestAmount, a.VoucherDate, a.ContraEntryNo, c.Password, a.LastDateReminder, a.PaymentCode, a.NumberOfReminders,a.DueDate, a.DelayDate, d.Amount, a.VoucherTypeNo, a.DepNo, a.LastDateInterestCalculation,e.Fee
having a.VoucherTypeNo in (10012) AND (a.RestAmount > (Select ZUsrBelopsgrense from medlemsregnskap.Department where a.depno = medlemsregnskap.Department.DepNo)) and a.NumberOfReminders > 4 and LastDateInterestCalculation <= GETDATE() - 60 and LastDateInterestCalculation > '1970-01-01'






GO

