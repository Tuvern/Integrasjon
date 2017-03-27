USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[ProgressReminderNoteView]    Script Date: 27.03.2017 13:26:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ProgressReminderNoteView]
AS
SELECT        t1.DepNo, t1.CustomerNo, t1.VoucherNo, t1.Amount, cast(t1.RestAmount+t1.ZUsrPurreGebyr as money) as RestAmount, t1.VoucherDate, (CASE WHEN t1.DelayDate > '1970-01-01' THEN t1.DelayDate ELSE t1.DueDate END) AS 'Frist', t1.NumberOfReminders, 
                         t1.LastDateReminder as LastDateReminder, t1.LastDateInterestCalculation, (
						 CASE WHEN DATEADD(day, - 1, CAST(getdate() AS date)) >= t1.DueDate AND t1.NumberOfReminders = 0 THEN 1 
						 WHEN t1.NumberOfReminders = 2 AND DATEADD(day, + 4, CAST(getdate() AS date)) < CAST(t1.LastDateReminder as date) THEN 2 
						 WHEN t1.NumberOfReminders = 2 AND DATEADD(day, + 4, CAST(getdate() AS date)) = CAST(t1.LastDateReminder as date) THEN 3 
						 WHEN t1.NumberOfReminders = 5 THEN 4 ELSE 0 END) AS 'TypeVarsel'
FROM            medlemsregnskap.DebLTransaction AS t1 INNER JOIN
                         medlemsregnskap.Department AS t2 ON t1.DepNo = t2.DepNo AND t1.RestAmount > t2.ZUsrBelopsgrense
WHERE        (DATEADD(day, - 1, CAST(GETDATE() AS date)) >= (CASE WHEN t1.DelayDate > '1970-01-01' THEN t1.DelayDate ELSE t1.DueDate END)) OR
                         (t1.NumberOfReminders = 2) OR
                         (t1.NumberOfReminders = 2) AND (DATEADD(day, +4, CAST(GETDATE() AS date)) = cast(t1.LastDateReminder as date)) OR
                         (t1.NumberOfReminders = 5)






GO

