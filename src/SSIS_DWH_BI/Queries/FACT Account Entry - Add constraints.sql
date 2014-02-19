
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_AccountEntryDetails] FOREIGN KEY([AccountEntryDetailsSKFK])
REFERENCES [dbo].[DIM_AccountEntryDetails] ([AccountEntryDetailsSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_AccountEntryDetails]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_AccountingPlan] FOREIGN KEY([AccountEntryAccountingPlanSKFK])
REFERENCES [dbo].[DIM_AccountingPlan] ([AccountingPlanSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_AccountingPlan]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_Company] FOREIGN KEY([AccountEntryCompanySKFK])
REFERENCES [dbo].[DIM_Company] ([CompanySK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_Company]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_EntryDate] FOREIGN KEY([AccountEntryDateNumSKFK])
REFERENCES [dbo].[DIM_Time] ([DateSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_EntryDate]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_FifthAnalyticalCode] FOREIGN KEY([AccountEntryFifthAnalyticalCodeSKFK])
REFERENCES [dbo].[DIM_FifthAnalyticalCode] ([FifthAnalyticalCodeSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_FifthAnalyticalCode]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_FifthReportPlan] FOREIGN KEY([AccountEntryFifthReportPlanSKFK])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_FifthReportPlan]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_FirstAnalyticalCode] FOREIGN KEY([AccountEntryFirstAnalyticalCodeSKFK])
REFERENCES [dbo].[DIM_FirstAnalyticalCode] ([FirstAnalyticalCodeSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_FirstAnalyticalCode]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_FirstReportPlan] FOREIGN KEY([AccountEntryFirstReportPlanSKFK])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_FirstReportPlan]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_FourthAnalyticalCode] FOREIGN KEY([AccountEntryFourthAnalyticalCodeSKFK])
REFERENCES [dbo].[DIM_FourthAnalyticalCode] ([FourthAnalyticalCodeSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_FourthAnalyticalCode]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_FourthReportPlan] FOREIGN KEY([AccountEntryFourthReportPlaSKFK])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_FourthReportPlan]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_ImputationDate] FOREIGN KEY([AccountEntryImputationDateNumSKFK])
REFERENCES [dbo].[DIM_Time] ([DateSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_ImputationDate]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_MaturityDate] FOREIGN KEY([AccountEntryMaturityDateSKFK])
REFERENCES [dbo].[DIM_Time] ([DateSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_MaturityDate]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_SecondAnalyticalCode] FOREIGN KEY([AccountEntrySecondAnalyticalCodeSKFK])
REFERENCES [dbo].[DIM_SecondAnalyticalCode] ([SecondAnalyticalCodeSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_SecondAnalyticalCode]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_SecondReportPlan] FOREIGN KEY([AccountEntrySecondReportPlanSKFK])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_SecondReportPlan]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_SixthReportPlan] FOREIGN KEY([AccountEntrySixthReportPlanSKFK])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_SixthReportPlan]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_SpecificAccountingPlan] FOREIGN KEY([AccountEntrySpecificAccountingPlanSKFK])
REFERENCES [dbo].[DIM_SpecificAccountingPlan] ([SpecificAccountingPlanSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_SpecificAccountingPlan]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdAnalyticalCode] FOREIGN KEY([AccountEntryThirdAnalyticalCodeSKFK])
REFERENCES [dbo].[DIM_ThirdAnalyticalCode] ([ThirdAnalyticalCodeSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdAnalyticalCode]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdParty] FOREIGN KEY([AccountEntryThirdPartySKFK])
REFERENCES [dbo].[DIM_ThirdParty] ([ThirdPartySK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdParty]
GO

ALTER TABLE [dbo].[FACT_AccountEntry]  WITH NOCHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdReportPlan] FOREIGN KEY([AccountEntryThirdReportPlanSKFK])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSK])
GO

ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdReportPlan]
GO
