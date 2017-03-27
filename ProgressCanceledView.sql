USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[ProgressCanceledView]    Script Date: 27.03.2017 13:24:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















CREATE VIEW [dbo].[ProgressCanceledView]
AS

select a.CustomerNo, a.VoucherNo, a.RestAmount, a.VoucherDate, a.ContraEntryNo, c.Password, a.LastDateReminder, a.PaymentCode, a.NumberOfReminders,a.DueDate, a.LastDateInterestCalculation, COUNT(*) AS Expr1, a.Amount, a.VoucherTypeNo, a.DepNo, b.voucherdate as PayDate, Datediff(day,a.LastDateInterestCalculation,b.VoucherDate) as noofdays 
from Medlemsregnskap.DebLTransaction a
inner join medlemsregnskap.Customer c on a.CustomerNo = c.customerno
inner join (select b.ContraEntryChainNo, VoucherNo, VoucherTypeNo, Voucherdate, NumberOfReminders, amount, RestAmount from Medlemsregnskap.DebLTransaction b
group by ContraEntryChainNo, VoucherNo, VoucherTypeNo, VoucherDate, NumberOfReminders, Amount, RestAmount
having b.VoucherTypeNo in(10013)) b
on a.ContraEntryChainNo = b.contraentrychainno
group by a.CustomerNo, a.VoucherNo, a.RestAmount, a.VoucherDate, a.ContraEntryNo, c.Password, a.LastDateReminder, a.PaymentCode, a.NumberOfReminders,a.DueDate, a.LastDateInterestCalculation, a.Amount, a.VoucherTypeNo, a.DepNo, b.voucherdate
having a.VoucherTypeNo in (10012) AND a.RestAmount < 30 and a.NumberOfReminders > 4 and a.LastDateInterestCalculation < GETDATE () -30 and a.LastDateInterestCalculation > '1970-01-01'













GO

