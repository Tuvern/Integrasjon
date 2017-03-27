USE [MedlemsregnskapGLOBALData]
GO

/****** Object:  View [dbo].[ReskontroSaldo]    Script Date: 27.03.2017 13:27:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW [dbo].[ReskontroSaldo]
AS
SELECT     Medlemsregnskap.CustomerSum.CustomerNo, Medlemsregnskap.customer.Name, Medlemsregnskap.CustomerSum.Balance as RestAmount, Medlemsregnskap.Customer.DepNo
FROM         Medlemsregnskap.CustomerSum
INNER JOIN Medlemsregnskap.Customer on Medlemsregnskap.CustomerSum.CustomerNo = Medlemsregnskap.customer.CustomerNo
INNER JOIN Medlemsregnskap.Department on Medlemsregnskap.customer.DepNo = Medlemsregnskap.Department.DepNo 
where Medlemsregnskap.CustomerSum.Balance > 0 and Medlemsregnskap.CustomerSum.Balance > Medlemsregnskap.Department.ZUsrBelopsgrense






GO

