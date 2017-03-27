USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[ProgressReminderView]    Script Date: 27.03.2017 13:26:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[ProgressReminderView]
AS
SELECT     Medlemsregnskap.DebLTransaction.CustomerNo, Medlemsregnskap.DebLTransaction.VoucherNo, Medlemsregnskap.CustomerOrderCopy.OrderCopyNo, Medlemsregnskap.DebLTransaction.RestAmount, 
                      Medlemsregnskap.DebLTransaction.VoucherDate, Medlemsregnskap.DebLTransaction.ContraEntryNo, Medlemsregnskap.Customer.Password, 
                      Medlemsregnskap.DebLTransaction.LastDateReminder, Medlemsregnskap.DebLTransaction.PaymentCode, Medlemsregnskap.DebLTransaction.NumberOfReminders,
                       Medlemsregnskap.DebLTransaction.DueDate, Medlemsregnskap.DebLTransaction.DelayDate, COUNT(*) AS Expr1, dbo.ordresum.Amount, 
                      Medlemsregnskap.DebLTransaction.VoucherTypeNo, Medlemsregnskap.DebLTransaction.DepNo
FROM         Medlemsregnskap.DebLTransaction 
LEFT OUTER JOIN Medlemsregnskap.Customer ON Medlemsregnskap.DebLTransaction.CustomerNo = Medlemsregnskap.Customer.CustomerNo
LEFT OUTER JOIN Medlemsregnskap.CustomerOrderCopy ON Medlemsregnskap.DebLTransaction.VoucherNo = Medlemsregnskap.CustomerOrderCopy.InvoiceNo
LEFT OUTER JOIN dbo.OrdreSum ON Medlemsregnskap.CustomerOrderCopy.Invoiceno = dbo.OrdreSum.InvoiceNo and Medlemsregnskap.CustomerOrderCopy.OrderCopyNo = dbo.ordresum.ordercopyno  
GROUP BY Medlemsregnskap.DebLTransaction.CustomerNo, Medlemsregnskap.DebLTransaction.VoucherNo, Medlemsregnskap.CustomerOrderCopy.OrderCopyNo, Medlemsregnskap.DebLTransaction.RestAmount, 
                      Medlemsregnskap.DebLTransaction.VoucherDate, Medlemsregnskap.DebLTransaction.ContraEntryNo, Medlemsregnskap.Customer.Password, 
                      Medlemsregnskap.DebLTransaction.LastDateReminder, Medlemsregnskap.DebLTransaction.PaymentCode, Medlemsregnskap.DebLTransaction.NumberOfReminders,
                       Medlemsregnskap.DebLTransaction.DueDate, dbo.ordresum.Amount, Medlemsregnskap.DebLTransaction.VoucherTypeNo, 
                      Medlemsregnskap.DebLTransaction.DepNo, Medlemsregnskap.DebLTransaction.DelayDate
HAVING      (Medlemsregnskap.DebLTransaction.RestAmount > (Select ZUsrBelopsgrense from Medlemsregnskap.Department where Medlemsregnskap.DebLTransaction.depno = Medlemsregnskap.Department.DepNo)) AND (Medlemsregnskap.DebLTransaction.NumberOfReminders = 0) AND 
                       ((CASE WHEN Medlemsregnskap.DebLTransaction.DelayDate > '1970-01-01' then Medlemsregnskap.DebLTransaction.DelayDate ELSE Medlemsregnskap.DebLTransaction.DueDate END)<= DATEADD(day,-14, cast(getdate() as date))) AND (Medlemsregnskap.DebLTransaction.VoucherTypeNo = 10012)









GO

