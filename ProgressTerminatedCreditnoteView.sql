USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[ProgressTerminatedCreditnoteView]    Script Date: 27.03.2017 13:26:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dbo].[ProgressTerminatedCreditnoteView]
AS

select a.CustomerNo, a.VoucherNo, a.RestAmount, a.VoucherDate, a.ContraEntryNo, c.Password, a.LastDateReminder, a.PaymentCode, a.NumberOfReminders,a.DueDate, a.DelayDate, COUNT(*) AS Expr1, a.Amount, a.VoucherTypeNo, a.DepNo, d.OrderCopyNo
from Medlemsregnskap.DebLTransaction a
inner join medlemsregnskap.Customer c on a.CustomerNo = c.customerno
inner join  (select * from medlemsregnskap.customerordercopy d where d.totalamount<> 0) d on a.VoucherNo = d.InvoiceNo 
inner join (select b.ContraEntryChainNo, VoucherNo, VoucherTypeNo, convert(varchar,VoucherDate,105) as Voucherdate, NumberOfReminders, amount, RestAmount from Medlemsregnskap.DebLTransaction b
group by ContraEntryChainNo, VoucherNo, VoucherTypeNo, VoucherDate, NumberOfReminders, Amount, RestAmount
having b.VoucherTypeNo in(10013)) b
on a.ContraEntryChainNo = b.contraentrychainno
group by a.CustomerNo, a.VoucherNo, a.RestAmount, a.VoucherDate, a.ContraEntryNo, c.Password, a.LastDateReminder, a.PaymentCode, a.NumberOfReminders,a.DueDate, a.DelayDate, a.Amount, a.VoucherTypeNo, a.DepNo, d.OrderCopyNo
having a.VoucherTypeNo in (10012) AND a.RestAmount <> 0 and a.NumberOfReminders > 4 












GO

