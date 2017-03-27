USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[ProgressTerminatorView]    Script Date: 27.03.2017 13:26:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[ProgressTerminatorView]
AS
SELECT     medlemsregnskap.DebLTransaction.CustomerNo, medlemsregnskap.DebLTransaction.VoucherNo, medlemsregnskap.DebLTransaction.RestAmount, 
                      medlemsregnskap.DebLTransaction.VoucherDate, medlemsregnskap.DebLTransaction.ContraEntryNo, medlemsregnskap.Customer.Password, 
                      medlemsregnskap.DebLTransaction.LastDateReminder, medlemsregnskap.DebLTransaction.PaymentCode, medlemsregnskap.DebLTransaction.NumberOfReminders,
                       medlemsregnskap.DebLTransaction.DueDate, medlemsregnskap.DebLTransaction.DelayDate, COUNT(*) AS Expr1, medlemsregnskap.DebLTransaction.Amount, 
                      medlemsregnskap.DebLTransaction.VoucherTypeNo, medlemsregnskap.DebLTransaction.DepNo, medlemsregnskap.CustomerOrderCopy.OrderCopyNo
FROM         medlemsregnskap.DebLTransaction 
LEFT OUTER JOIN medlemsregnskap.Customer ON medlemsregnskap.DebLTransaction.CustomerNo = medlemsregnskap.Customer.CustomerNo
LEFT OUTER JOIN medlemsregnskap.CustomerOrderCopy ON medlemsregnskap.DebLTransaction.VoucherNo = medlemsregnskap.CustomerOrderCopy.InvoiceNo
GROUP BY medlemsregnskap.DebLTransaction.CustomerNo, medlemsregnskap.DebLTransaction.VoucherNo, medlemsregnskap.DebLTransaction.RestAmount, 
                      medlemsregnskap.DebLTransaction.VoucherDate, medlemsregnskap.DebLTransaction.ContraEntryNo, medlemsregnskap.Customer.Password, 
                      medlemsregnskap.DebLTransaction.LastDateReminder, medlemsregnskap.DebLTransaction.PaymentCode, medlemsregnskap.DebLTransaction.NumberOfReminders,
                       medlemsregnskap.DebLTransaction.DueDate, medlemsregnskap.DebLTransaction.Amount, medlemsregnskap.DebLTransaction.VoucherTypeNo, 
                      medlemsregnskap.DebLTransaction.DepNo, medlemsregnskap.DebLTransaction.DelayDate, medlemsregnskap.CustomerOrderCopy.OrderCopyNo
HAVING      (medlemsregnskap.DebLTransaction.RestAmount > (Select ZUsrBelopsgrense from medlemsregnskap.Department where medlemsregnskap.DebLTransaction.depno = medlemsregnskap.Department.DepNo)) AND (medlemsregnskap.DebLTransaction.NumberOfReminders = 2 OR
                      medlemsregnskap.DebLTransaction.NumberOfReminders = 3) AND (medlemsregnskap.DebLTransaction.VoucherTypeNo = 10012) AND 
                      (medlemsregnskap.DebLTransaction.LastDateReminder <= GETDATE() - 1)






GO

