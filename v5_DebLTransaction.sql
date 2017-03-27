USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[v5_DebLTransaction]    Script Date: 27.03.2017 13:27:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v5_DebLTransaction]
AS
SELECT     Medlemsregnskap.DebLTransaction.CustomerNo, Medlemsregnskap.DebLTransaction.VoucherNo, Medlemsregnskap.DebLTransaction.RestAmount, 
                      Medlemsregnskap.DebLTransaction.VoucherDate, Medlemsregnskap.DebLTransaction.ContraEntryNo, Medlemsregnskap.Customer.Password, 
                      Medlemsregnskap.DebLTransaction.LastDateReminder, Medlemsregnskap.DebLTransaction.PaymentCode, Medlemsregnskap.DebLTransaction.NumberOfReminders,
                       Medlemsregnskap.DebLTransaction.DueDate, Medlemsregnskap.DebLTransaction.DelayDate, COUNT(*) AS Expr1, Medlemsregnskap.DebLTransaction.Amount, 
                      Medlemsregnskap.DebLTransaction.VoucherTypeNo, Medlemsregnskap.DebLTransaction.DepNo
FROM         Medlemsregnskap.DebLTransaction LEFT OUTER JOIN
                      Medlemsregnskap.Customer ON Medlemsregnskap.DebLTransaction.CustomerNo = Medlemsregnskap.Customer.CustomerNo
GROUP BY Medlemsregnskap.DebLTransaction.CustomerNo, Medlemsregnskap.DebLTransaction.VoucherNo, Medlemsregnskap.DebLTransaction.RestAmount, 
                      Medlemsregnskap.DebLTransaction.VoucherDate, Medlemsregnskap.DebLTransaction.ContraEntryNo, Medlemsregnskap.Customer.Password, 
                      Medlemsregnskap.DebLTransaction.LastDateReminder, Medlemsregnskap.DebLTransaction.PaymentCode, Medlemsregnskap.DebLTransaction.NumberOfReminders,
                       Medlemsregnskap.DebLTransaction.DueDate, Medlemsregnskap.DebLTransaction.Amount, Medlemsregnskap.DebLTransaction.VoucherTypeNo, 
                      Medlemsregnskap.DebLTransaction.DepNo, Medlemsregnskap.DebLTransaction.DelayDate
HAVING      (Medlemsregnskap.DebLTransaction.RestAmount > (Select ZUsrBelopsgrense from Medlemsregnskap.Department where Medlemsregnskap.DebLTransaction.depno = Medlemsregnskap.Department.DepNo)) AND (Medlemsregnskap.DebLTransaction.NumberOfReminders = 2 OR
                      Medlemsregnskap.DebLTransaction.NumberOfReminders = 3) AND (Medlemsregnskap.DebLTransaction.VoucherTypeNo = 10012) AND 
                      (Medlemsregnskap.DebLTransaction.LastDateReminder <= GETDATE() - 1)




GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[7] 4[48] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DebLTransaction (Medlemsregnskap)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 306
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Customer (Medlemsregnskap)"
            Begin Extent = 
               Top = 6
               Left = 310
               Bottom = 298
               Right = 619
            End
            DisplayFlags = 280
            TopColumn = 39
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1725
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v5_DebLTransaction'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v5_DebLTransaction'
GO

