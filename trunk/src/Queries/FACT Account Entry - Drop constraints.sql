
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_AccountEntryDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_AccountEntryDetails]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_AccountingPlan]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_AccountingPlan]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_Company]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_Company]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_EntryDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_EntryDate]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_FifthAnalyticalCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_FifthAnalyticalCode]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_FifthReportPlan]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_FifthReportPlan]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_FirstAnalyticalCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_FirstAnalyticalCode]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_FirstReportPlan]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_FirstReportPlan]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_FourthAnalyticalCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_FourthAnalyticalCode]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_FourthReportPlan]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_FourthReportPlan]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_ImputationDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_ImputationDate]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_MaturityDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_MaturityDate]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_SecondAnalyticalCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_SecondAnalyticalCode]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_SecondReportPlan]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_SecondReportPlan]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_SixthReportPlan]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_SixthReportPlan]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_SpecificAccountingPlan]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_SpecificAccountingPlan]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_ThirdAnalyticalCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdAnalyticalCode]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_ThirdParty]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdParty]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACT_AccountEntry_DIM_ThirdReportPlan]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACT_AccountEntry]'))
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdReportPlan]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_FACT_AccountEntry_AccountEntryAmountD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FACT_AccountEntry] DROP CONSTRAINT [DF_FACT_AccountEntry_AccountEntryAmountD]
END

GO