

-----------------------------------------------------------------------------------------
-- User defined function
-----------------------------------------------------------------------------------------


USE [master]
GO
/****** Object:  Database [DWH_BI]    Script Date: 07/16/2012 12:37:21 ******/
CREATE DATABASE [DWH_BI] ON  PRIMARY 
( NAME = N'CW_DWH', FILENAME = N'F:\Projects\L&Bee\01 - Bases de donnees\MS SQL 2008\DWH_BI.mdf' , SIZE = 869440KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CW_DWH_log', FILENAME = N'F:\Projects\L&Bee\01 - Bases de donnees\MS SQL 2008\DWH_BI_1.LDF' , SIZE = 427392KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [DWH_BI] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWH_BI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DWH_BI] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DWH_BI] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DWH_BI] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DWH_BI] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DWH_BI] SET ARITHABORT OFF
GO
ALTER DATABASE [DWH_BI] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DWH_BI] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DWH_BI] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DWH_BI] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DWH_BI] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DWH_BI] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DWH_BI] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DWH_BI] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DWH_BI] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DWH_BI] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DWH_BI] SET  DISABLE_BROKER
GO
ALTER DATABASE [DWH_BI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DWH_BI] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DWH_BI] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DWH_BI] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DWH_BI] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DWH_BI] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DWH_BI] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DWH_BI] SET  READ_WRITE
GO
ALTER DATABASE [DWH_BI] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DWH_BI] SET  MULTI_USER
GO
ALTER DATABASE [DWH_BI] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DWH_BI] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'DWH_BI', N'ON'
GO
USE [DWH_BI]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 07/16/2012 12:37:22 ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[NT AUTHORITY\NETWORK SERVICE]
GO
/****** Object:  User [BiRW]    Script Date: 07/16/2012 12:37:22 ******/
CREATE USER [BiRW] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ASPEX099\metrum_admin]    Script Date: 07/16/2012 12:37:22 ******/
CREATE USER [ASPEX099\metrum_admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [NT AUTHORITY\NETWORK SERVICE]    Script Date: 07/16/2012 12:37:22 ******/
CREATE SCHEMA [NT AUTHORITY\NETWORK SERVICE] AUTHORIZATION [BiRW]
GO
/****** Object:  Table [dbo].[sysdtslog90]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysdtslog90](
	[event] [varchar](50) NULL,
	[source] [varchar](50) NULL,
	[starttime] [datetime] NULL,
	[message] [varchar](500) NULL,
	[datacode] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REP_FinancialKPI]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REP_FinancialKPI](
	[YearMonthNum] [int] NULL,
	[AccountEntryCompanySkFk] [int] NULL,
	[OperatingResults] [numeric](18, 4) NULL,
	[TotalRevenus] [numeric](18, 4) NULL,
	[TotalCost] [numeric](18, 4) NULL,
	[TotalProfitsWithoutCapDev] [numeric](18, 4) NULL,
	[FinancialResults] [numeric](18, 4) NULL,
	[ExceptionalResults] [numeric](18, 4) NULL,
	[TotalProfitsBeforeTax]  AS (([OperatingResults]+[FinancialResults])+[ExceptionalResults]),
	[OperatingMargin] [numeric](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_ThirdParty]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_ThirdParty](
	[ThirdPartyCode] [nvarchar](50) NULL,
	[ThirdPartyAlias] [nvarchar](100) NULL,
	[ThirdPartyName] [nvarchar](200) NULL,
	[ThirdPartyAddress] [nvarchar](255) NULL,
	[ThirdPartyStreet] [nvarchar](50) NULL,
	[ThirdPartyZipCode] [nvarchar](50) NULL,
	[ThirdPartyCity] [nvarchar](50) NULL,
	[ThirdPartyCountryCD] [nvarchar](50) NULL,
	[ThirdPartyCountry] [nvarchar](50) NULL,
	[ThirdPartyTel1] [nvarchar](50) NULL,
	[ThirdPartyTel2] [nvarchar](50) NULL,
	[ThirdPartyTel3] [nvarchar](50) NULL,
	[ThirdPartyTel4] [nvarchar](50) NULL,
	[ThirdPartyFax] [nvarchar](50) NULL,
	[ThirdPartyEmail] [nvarchar](50) NULL,
	[ThirdPartyLanguage] [nvarchar](50) NULL,
	[ThidPartyContact] [nvarchar](50) NULL,
	[ThirdPartyWWW] [nvarchar](100) NULL,
	[ThirdPartyInfo] [nvarchar](253) NULL,
	[ThirdPartyVatNum] [nvarchar](50) NULL,
	[ThirdPartyVatLiable] [nvarchar](50) NULL,
	[ThirdPartyCurrencyCD] [nvarchar](50) NULL,
	[ThirdPartyNumber] [nvarchar](50) NULL,
	[ThirdPartySubNumber] [nvarchar](50) NULL,
	[ThirdPartyPayNumber] [nvarchar](50) NULL,
	[ThirdPartyPaySubNumber] [nvarchar](50) NULL,
	[ThirdPartyBankAccount] [nvarchar](50) NULL,
	[ThirdPartySwiftCode] [nvarchar](50) NULL,
	[ThirdPartyCardUse] [nvarchar](50) NULL,
	[ThirdPartyIsSupplier] [nvarchar](50) NULL,
	[ThirdPartyIsCustomer] [nvarchar](50) NULL,
	[ThirdPartyTraccAccount] [nvarchar](50) NULL,
	[ThirdPartyImputationAccount] [nvarchar](50) NULL,
	[ThirdPartyCompanyCD] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_SpecificAccountingPlan]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_SpecificAccountingPlan](
	[SpecificAccountNum] [nvarchar](50) NOT NULL,
	[SpecificAccountType] [nvarchar](50) NULL,
	[SpecificAccountLabel1] [nvarchar](255) NULL,
	[SpecificAccountLabel2] [nvarchar](255) NULL,
	[SpecificAccountLabelFR] [nvarchar](255) NULL,
	[SpecificAccountLabelEN] [nvarchar](255) NULL,
	[SpecificAccountLabelNL] [nvarchar](255) NULL,
	[SpecificAccountLabelDE] [nvarchar](255) NULL,
	[SpecificAccountIsInterco] [bit] NULL,
	[SpecificAccountIsImputable] [bit] NULL,
	[SpecificAccountCompanyCD] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_SecondAnalyticalCode]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_SecondAnalyticalCode](
	[SecondAnalyticalCode] [nvarchar](10) NULL,
	[SecondAnalyticalCodeLabel1] [nvarchar](50) NULL,
	[SecondAnalyticalCodeLabel2] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_ReportPlan]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_ReportPlan](
	[ReportPlanType] [int] NULL,
	[ReportPlanPathSk] [int] NOT NULL,
	[ReportPlanLevel0Num] [int] NULL,
	[ReportPlanLevel0Name] [nvarchar](100) NULL,
	[ReportPlanLevel1Num] [int] NULL,
	[ReportPlanLevel1Name] [nvarchar](100) NULL,
	[ReportPlanLevel2Num] [int] NULL,
	[ReportPlanLevel2Name] [nvarchar](100) NULL,
	[ReportPlanLevel3Num] [int] NULL,
	[ReportPlanLevel3Name] [nvarchar](100) NULL,
	[ReportPlanLevel4Num] [int] NULL,
	[ReportPlanLevel4Name] [nvarchar](100) NULL,
	[ReportPlanLevel5Num] [int] NULL,
	[ReportPlanLevel5Name] [nvarchar](100) NULL,
	[ReportPlanLevel6Num] [int] NULL,
	[ReportPlanLevel6Name] [nvarchar](100) NULL,
	[ReportPlanLevel7Num] [int] NULL,
	[ReportPlanLevel7Name] [nvarchar](100) NULL,
	[ReportPlanAccountNum] [nvarchar](50) NULL,
	[ReportPlanIsBalance] [bit] NULL,
	[ReportPlanTypeName] [nvarchar](100) NULL,
	[ReportPlanAnalyticalCode] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_GeneralAccount]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_GeneralAccount](
	[AccountNum] [nvarchar](50) NOT NULL,
	[AccountType] [nvarchar](50) NULL,
	[AccountLabel1] [nvarchar](255) NULL,
	[AccountLabel2] [nvarchar](255) NULL,
	[AccountLabelNL] [nvarchar](255) NULL,
	[AccountLabelFR] [nvarchar](255) NULL,
	[AccountLabelEN] [nvarchar](255) NULL,
	[AccountLabelDE] [nvarchar](255) NULL,
	[IsInterco] [bit] NULL,
	[IsImputable] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_FirstAnalyticalCode]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_FirstAnalyticalCode](
	[AnalyticalAccount] [nvarchar](50) NULL,
	[AnalyticalAccountLabel1] [nvarchar](100) NULL,
	[AnalyticalAccountLabel2] [nvarchar](100) NULL,
	[AnalyticalAccountLabelFR] [nvarchar](100) NULL,
	[AnalyticalAccountLabelNL] [nvarchar](100) NULL,
	[AnalyticalAccountLabelEN] [nvarchar](100) NULL,
	[AnalyticalAccountLabelDE] [nvarchar](100) NULL,
	[AnalyticalAccountType] [nvarchar](50) NULL,
	[CompanyCD] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_CurrencyExchangeRate]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_CurrencyExchangeRate](
	[Period] [int] NOT NULL,
	[StartCurrencyCode] [nvarchar](3) NULL,
	[EndCurrencyCode] [nvarchar](3) NULL,
	[ExchangeRate] [decimal](18, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_Country]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_Country](
	[CountryCD] [nvarchar](50) NOT NULL,
	[CountryNameFR] [nvarchar](100) NULL,
	[CountryNameEN] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_CompanySettings]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_CompanySettings](
	[CompanyCD] [nvarchar](5) NULL,
	[CompanyConnectionString] [nvarchar](100) NULL,
	[CompanyName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_Company]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_Company](
	[Name] [nvarchar](100) NULL,
	[NameAbrev] [nvarchar](100) NULL,
	[CompanyCD] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Street] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[CountryCD] [nvarchar](50) NULL,
	[PolitePhrase] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[Tel1] [nvarchar](50) NULL,
	[Tel2] [nvarchar](50) NULL,
	[Tel3] [nvarchar](50) NULL,
	[Tel4] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[WWW] [nvarchar](100) NULL,
	[VAT] [nvarchar](50) NULL,
	[BankAccount] [nvarchar](50) NULL,
	[CompanyCurrency] [nvarchar](3) NULL,
	[IsAdjustingCompany] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_Budget]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_Budget](
	[BudgetYear] [int] NULL,
	[BudgetMonth] [int] NULL,
	[BudgetYearMonth]  AS ([BudgetYear]*(100)+[BudgetMonth]),
	[AccountingPlanNum] [nvarchar](50) NULL,
	[AnalyticalPlanCode] [nvarchar](50) NULL,
	[Amount] [decimal](18, 4) NULL,
	[CompanyCD] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_AdjustingEntry]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_AdjustingEntry](
	[AdjustingEntryID] [nvarchar](50) NULL,
	[AdjustingEntryRemark] [nvarchar](150) NULL,
	[ReferingGeneralAccountNum] [nvarchar](50) NULL,
	[ReferingAnalyticalAccount] [nvarchar](50) NULL,
	[ReferingCompanyCD] [nvarchar](50) NULL,
	[AdjustingEntryCredit] [numeric](18, 4) NULL,
	[AdjustingEntryDebit] [numeric](18, 4) NULL,
	[AdjustingEntryDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_ActiveDirectory_Company_Mapping]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_ActiveDirectory_Company_Mapping](
	[UserID] [nvarchar](100) NULL,
	[Company] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IN_AccountEntry]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IN_AccountEntry](
	[AccountEntryID] [nvarchar](100) NOT NULL,
	[ImputationYear] [int] NULL,
	[ImputationMonth] [int] NULL,
	[FiscalYear] [int] NULL,
	[EntryDate] [datetime] NULL,
	[MaturityDate] [datetime] NULL,
	[Book] [nvarchar](50) NULL,
	[BookType] [int] NULL,
	[BookDate] [datetime] NULL,
	[Document] [nvarchar](50) NULL,
	[DocumentDate] [datetime] NULL,
	[Amount] [numeric](18, 4) NULL,
	[AmountDebit] [numeric](18, 4) NOT NULL,
	[AmountCredit] [numeric](18, 4) NULL,
	[AmountInEur] [numeric](18, 4) NULL,
	[AmountDebitInEur] [numeric](18, 4) NULL,
	[AmountCreditInEur] [numeric](18, 4) NULL,
	[Remarks] [nvarchar](500) NULL,
	[CurrencyCode] [nvarchar](50) NULL,
	[ThirdPartyCode] [nvarchar](50) NULL,
	[AccountNum] [nvarchar](50) NULL,
	[FirstAnalyticalCode] [nvarchar](50) NULL,
	[SecondAnalyticalCode] [nvarchar](50) NULL,
	[ThirdAnalyticalCode] [nvarchar](50) NULL,
	[FourthAnalyticalCode] [nvarchar](50) NULL,
	[CompanyCode] [nvarchar](50) NULL,
	[IsCredit] [bit] NULL,
	[IsDicharged] [bit] NULL,
	[InvoiceURL] [nvarchar](200) NULL,
	[BarCode] [nvarchar](100) NULL,
	[AnalyticalPercentage] [numeric](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Time]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Time](
	[DateSk] [int] NOT NULL,
	[Date_Time] [datetime] NULL,
	[Date_Name] [nvarchar](50) NULL,
	[Date_FullName] [nvarchar](50) NULL,
	[Date_FullName_FR] [nvarchar](50) NULL,
	[Year] [datetime] NULL,
	[Year_Name] [nvarchar](50) NULL,
	[Quarter] [datetime] NULL,
	[Quarter_Name] [nvarchar](50) NULL,
	[YearMonth] [int] NULL,
	[Month] [datetime] NULL,
	[Month_Name] [nvarchar](50) NULL,
	[Month_Name_FR] [nvarchar](50) NULL,
	[Week] [datetime] NULL,
	[Week_Name] [nvarchar](50) NULL,
	[Week_Name_FR] [nvarchar](50) NULL,
	[Day_Of_Year] [int] NULL,
	[Day_Of_Year_Name] [nvarchar](50) NULL,
	[Day_Of_Quarter] [int] NULL,
	[Day_Of_Quarter_Name] [nvarchar](50) NULL,
	[Day_Of_Month] [int] NULL,
	[Day_Of_Month_Name] [nvarchar](50) NULL,
	[Day_Of_Week] [int] NULL,
	[Day_Of_Week_Name] [nvarchar](50) NULL,
	[Day_Of_Week_Name_FR] [nvarchar](50) NULL,
	[Week_Of_Year] [int] NULL,
	[Week_Of_Year_Name] [nvarchar](50) NULL,
	[Month_Of_Year] [int] NULL,
	[Month_Of_Year_Name] [nvarchar](50) NULL,
	[Month_Of_Quarter] [int] NULL,
	[Month_Of_Quarter_Name] [nvarchar](50) NULL,
	[Quarter_Of_Year] [int] NULL,
	[Quarter_Of_Year_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_DIM_Time] PRIMARY KEY CLUSTERED 
(
	[DateSk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Date_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Date_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Date_FullName_FR'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Date_FullName_FR'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Week' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week_Name_FR'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Week_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week_Name_FR'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVTable', @value=N'DIM_Time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'Project', @value=N'b4be41f3-3134-4ed5-b186-7d4127476f86' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DIM_Time'
GO
/****** Object:  Table [dbo].[DIM_ThirdParty]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_ThirdParty](
	[ThirdPartySk] [int] IDENTITY(1,1) NOT NULL,
	[ThirdPartyCode] [nvarchar](50) NOT NULL,
	[ThirdPartyAlias] [nvarchar](100) NULL,
	[ThirdPartyName] [nvarchar](200) NULL,
	[ThirdPartyAddress] [nvarchar](500) NULL,
	[ThirdPartyStreet] [nvarchar](50) NULL,
	[ThirdPartyCity] [nvarchar](50) NULL,
	[ThirdPartyZipCode] [nvarchar](50) NULL,
	[ThirdPartyCountry] [nvarchar](50) NULL,
	[ThirdPartyCountryCode] [nvarchar](50) NULL,
	[ThirdPartyCompanyCode] [nvarchar](50) NOT NULL,
	[ThirdPartyTel1] [nvarchar](50) NULL,
	[ThirdPartyTel2] [nvarchar](50) NULL,
	[ThirdPartyTel3] [nvarchar](50) NULL,
	[ThirdPartyFax] [nvarchar](50) NULL,
	[ThirdPartyEmail] [nvarchar](50) NULL,
	[ThirdPartyWWW] [nvarchar](100) NULL,
	[ThirdPartyLanguage] [nvarchar](50) NULL,
	[ThirdPartyContact] [nvarchar](50) NULL,
	[ThirdPartyVatNum] [nvarchar](50) NULL,
	[ThirdPartyVatLiable] [nvarchar](50) NULL,
	[ThirdPartyInfo] [nvarchar](255) NULL,
	[ThirdPartyCurrencyCode] [nvarchar](50) NULL,
	[ThirdPartyNumber] [nvarchar](50) NULL,
	[ThirdPartySubNumber] [nvarchar](50) NULL,
	[ThirdPartyPayNumber] [nvarchar](50) NULL,
	[ThirdPartyPaySubNumber] [nvarchar](50) NULL,
	[ThirdPartyBankAccount] [nvarchar](50) NULL,
	[ThirdPartySwiftCode] [nvarchar](50) NULL,
	[ThirdPartyCardUse] [nvarchar](50) NULL,
	[ThirdPartyTraccAccount] [nvarchar](50) NULL,
	[ThirdPartyImputationAccount] [nvarchar](50) NULL,
	[ThirdPartyIsSupplier] [bit] NULL,
	[ThirdPartyIsCustomer] [bit] NULL,
 CONSTRAINT [PK_DIM_ThirdParty] PRIMARY KEY CLUSTERED 
(
	[ThirdPartySk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_SpecificAccountingPlan]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_SpecificAccountingPlan](
	[SpecificAccountPlanSk] [bigint] IDENTITY(1,1) NOT NULL,
	[SpecificAccountNum] [nvarchar](50) NULL,
	[SpecificAccountLevel1Num] [nvarchar](50) NULL,
	[SpecificAccountLevel1LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel1LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel1LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel1LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel2Num] [nvarchar](50) NULL,
	[SpecificAccountLevel2LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel2LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel2LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel2LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel3Num] [nvarchar](50) NULL,
	[SpecificAccountLevel3LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel3LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel3LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel3LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel4Num] [nvarchar](50) NULL,
	[SpecificAccountLevel4LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel4LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel4LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel4LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel5Num] [nvarchar](50) NULL,
	[SpecificAccountLevel5LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel5LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel5LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel5LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel6Num] [nvarchar](50) NULL,
	[SpecificAccountLevel6LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel6LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel6LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel6LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel7Num] [nvarchar](50) NULL,
	[SpecificAccountLevel7LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel7LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel7LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel7LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel8Num] [nvarchar](50) NULL,
	[SpecificAccountLevel8LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel8LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel8LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel8LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel9Num] [nvarchar](50) NULL,
	[SpecificAccountLevel9LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel9LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel9LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel9LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel10Num] [nvarchar](50) NULL,
	[SpecificAccountLevel10LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel10LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel10LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel10LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel11Num] [nvarchar](50) NULL,
	[SpecificAccountLevel11LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel11LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel11LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel11LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel12Num] [nvarchar](50) NULL,
	[SpecificAccountLevel12LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel12LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel12LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel12LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel13Num] [nvarchar](50) NULL,
	[SpecificAccountLevel13LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel13LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel13LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel13LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel14Num] [nvarchar](50) NULL,
	[SpecificAccountLevel14LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel14LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel14LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel14LabelDE] [nvarchar](100) NULL,
	[SpecificAccountLevel15Num] [nvarchar](50) NULL,
	[SpecificAccountLevel15LabelFR] [nvarchar](100) NULL,
	[SpecificAccountLevel15LabelEN] [nvarchar](100) NULL,
	[SpecificAccountLevel15LabelNL] [nvarchar](100) NULL,
	[SpecificAccountLevel15LabelDE] [nvarchar](100) NULL,
	[SpecificAccountCompanySkFk] [int] NULL,
	[SpecificAccountLabel] [nvarchar](100) NULL,
 CONSTRAINT [PK_DIM_SpecificAccountingPlan] PRIMARY KEY CLUSTERED 
(
	[SpecificAccountPlanSk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_SecondAnalyticalCode]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_SecondAnalyticalCode](
	[SecondAnalyticalCodeSK] [int] IDENTITY(1,1) NOT NULL,
	[SecondAnalyticalCode] [nvarchar](10) NULL,
	[SecondAnalyticalCodeLabel] [nvarchar](50) NULL,
 CONSTRAINT [PK_DIM_SecondaryAnalyticalAccount_1] PRIMARY KEY CLUSTERED 
(
	[SecondAnalyticalCodeSK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_ReportPlan]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_ReportPlan](
	[ReportPlanPathSk] [int] IDENTITY(1,1) NOT NULL,
	[ReportPlanType] [int] NULL,
	[ReportPlanTypeName] [nvarchar](100) NULL,
	[ReportPlanLevel0Num] [int] NULL,
	[ReportPlanLevel0Name] [nvarchar](100) NULL,
	[ReportPlanLevel1Num] [int] NULL,
	[ReportPlanLevel1Name] [nvarchar](100) NULL,
	[ReportPlanLevel2Num] [int] NULL,
	[ReportPlanLevel2Name] [nvarchar](100) NULL,
	[ReportPlanLevel3Num] [int] NULL,
	[ReportPlanLevel3Name] [nvarchar](100) NULL,
	[ReportPlanLevel4Num] [int] NULL,
	[ReportPlanLevel4Name] [nvarchar](100) NULL,
	[ReportPlanLevel5Num] [int] NULL,
	[ReportPlanLevel5Name] [nvarchar](100) NULL,
	[ReportPlanLevel6Num] [int] NULL,
	[ReportPlanLevel6Name] [nvarchar](100) NULL,
	[ReportPlanLevel7Num] [int] NULL,
	[ReportPlanLevel7Name] [nvarchar](100) NULL,
	[ReportPlanAccountNum] [nvarchar](50) NULL,
	[ReportPlanAnalyticalCode] [nvarchar](50) NULL,
	[ReportPlanIsBalance] [bit] NULL,
 CONSTRAINT [PK_DIM_ReportPlan] PRIMARY KEY CLUSTERED 
(
	[ReportPlanPathSk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_FirstAnalyticalCode]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_FirstAnalyticalCode](
	[FirstAnalyticalCodeSK] [int] IDENTITY(1,1) NOT NULL,
	[FirstAnalyticalCode] [nvarchar](50) NULL,
	[FirstAnalyticalCodeLabelFR] [nvarchar](100) NULL,
	[FirstAnalyticalCodeLabelEN] [nvarchar](100) NULL,
	[FirstAnalyticalCodeLabelNL] [nvarchar](100) NULL,
	[FirstAnalyticalCodeLabelDE] [nvarchar](100) NULL,
	[FirstAnalyticalCodeType] [int] NULL,
	[FirstAnalyticalCodeCompanyCD] [nvarchar](50) NULL,
 CONSTRAINT [PK_DIM_PrimaryAnalyticalAccount] PRIMARY KEY CLUSTERED 
(
	[FirstAnalyticalCodeSK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Country]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Country](
	[CountrySk] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [nvarchar](50) NULL,
	[CountryNameFR] [nvarchar](100) NULL,
	[CountryNameEN] [nvarchar](100) NULL,
 CONSTRAINT [PK_DIM_Country_1] PRIMARY KEY CLUSTERED 
(
	[CountrySk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_ActiveDirectory]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_ActiveDirectory](
	[ActiveDirectorySK] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](100) NULL,
 CONSTRAINT [PK_DIM_User] PRIMARY KEY CLUSTERED 
(
	[ActiveDirectorySK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_AccountingPlan]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_AccountingPlan](
	[AccountingPlanPathSK] [bigint] NOT NULL,
	[AccountingPlanNum] [nvarchar](50) NULL,
	[AccountLevel1Num] [nvarchar](50) NULL,
	[AccountLevel1LabelFR] [nvarchar](100) NULL,
	[AccountLevel1LabelEN] [nvarchar](100) NULL,
	[AccountLevel1LabelNL] [nvarchar](100) NULL,
	[AccountLevel1LabelDE] [nvarchar](100) NULL,
	[AccountLevel2Num] [nvarchar](50) NULL,
	[AccountLevel2LabelFR] [nvarchar](100) NULL,
	[AccountLevel2LabelEN] [nvarchar](100) NULL,
	[AccountLevel2LabelNL] [nvarchar](100) NULL,
	[AccountLevel2LabelDE] [nvarchar](100) NULL,
	[AccountLevel3Num] [nvarchar](50) NULL,
	[AccountLevel3LabelFR] [nvarchar](100) NULL,
	[AccountLevel3LabelEN] [nvarchar](100) NULL,
	[AccountLevel3LabelNL] [nvarchar](100) NULL,
	[AccountLevel3LabelDE] [nvarchar](100) NULL,
	[AccountLevel4Num] [nvarchar](50) NULL,
	[AccountLevel4LabelFR] [nvarchar](100) NULL,
	[AccountLevel4LabelEN] [nvarchar](100) NULL,
	[AccountLevel4LabelNL] [nvarchar](100) NULL,
	[AccountLevel4LabelDE] [nvarchar](100) NULL,
	[AccountLevel5Num] [nvarchar](50) NULL,
	[AccountLevel5LabelFR] [nvarchar](100) NULL,
	[AccountLevel5LabelEN] [nvarchar](100) NULL,
	[AccountLevel5LabelNL] [nvarchar](100) NULL,
	[AccountLevel5LabelDE] [nvarchar](100) NULL,
	[AccountLevel6Num] [nvarchar](50) NULL,
	[AccountLevel6LabelFR] [nvarchar](100) NULL,
	[AccountLevel6LabelEN] [nvarchar](100) NULL,
	[AccountLevel6LabelNL] [nvarchar](100) NULL,
	[AccountLevel6LabelDE] [nvarchar](100) NULL,
	[AccountLevel7Num] [nvarchar](50) NULL,
	[AccountLevel7LabelFR] [nvarchar](100) NULL,
	[AccountLevel7LabelEN] [nvarchar](100) NULL,
	[AccountLevel7LabelNL] [nvarchar](100) NULL,
	[AccountLevel7LabelDE] [nvarchar](100) NULL,
	[AccountLevel8Num] [nvarchar](50) NULL,
	[AccountLevel8LabelFR] [nvarchar](100) NULL,
	[AccountLevel8LabelEN] [nvarchar](100) NULL,
	[AccountLevel8LabelNL] [nvarchar](100) NULL,
	[AccountLevel8LabelDE] [nvarchar](100) NULL,
	[AccountLevel9Num] [nvarchar](50) NULL,
	[AccountLevel9LabelFR] [nvarchar](100) NULL,
	[AccountLevel9LabelEN] [nvarchar](100) NULL,
	[AccountLevel9LabelNL] [nvarchar](100) NULL,
	[AccountLevel9LabelDE] [nvarchar](100) NULL,
	[AccountLevel10Num] [nvarchar](50) NULL,
	[AccountLevel10LabelFR] [nvarchar](100) NULL,
	[AccountLevel10LabelEN] [nvarchar](100) NULL,
	[AccountLevel10LabelNL] [nvarchar](100) NULL,
	[AccountLevel10LabelDE] [nvarchar](100) NULL,
	[AccountLevel11Num] [nvarchar](50) NULL,
	[AccountLevel11LabelFR] [nvarchar](100) NULL,
	[AccountLevel11LabelEN] [nvarchar](100) NULL,
	[AccountLevel11LabelNL] [nvarchar](100) NULL,
	[AccountLevel11LabelDE] [nvarchar](100) NULL,
	[AccountLevel12Num] [nvarchar](50) NULL,
	[AccountLevel12LabelFR] [nvarchar](100) NULL,
	[AccountLevel12LabelEN] [nvarchar](100) NULL,
	[AccountLevel12LabelNL] [nvarchar](100) NULL,
	[AccountLevel12LabelDE] [nvarchar](100) NULL,
	[AccountLevel13Num] [nvarchar](50) NULL,
	[AccountLevel13LabelFR] [nvarchar](100) NULL,
	[AccountLevel13LabelEN] [nvarchar](100) NULL,
	[AccountLevel13LabelNL] [nvarchar](100) NULL,
	[AccountLevel13LabelDE] [nvarchar](100) NULL,
	[AccountLevel14Num] [nvarchar](50) NULL,
	[AccountLevel14LabelFR] [nvarchar](100) NULL,
	[AccountLevel14LabelEN] [nvarchar](100) NULL,
	[AccountLevel14LabelNL] [nvarchar](100) NULL,
	[AccountLevel14LabelDE] [nvarchar](100) NULL,
	[AccountLevel15Num] [nvarchar](50) NULL,
	[AccountLevel15LabelFR] [nvarchar](100) NULL,
	[AccountLevel15LabelEN] [nvarchar](100) NULL,
	[AccountLevel15LabelNL] [nvarchar](100) NULL,
	[AccountLevel15LabelDE] [nvarchar](100) NULL,
	[AccountIsInterco] [bit] NULL,
	[AccountLabel] [nvarchar](100) NULL,
 CONSTRAINT [PK_DIM_AccountingPlan_1] PRIMARY KEY CLUSTERED 
(
	[AccountingPlanPathSK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_AccountEntryDetails]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_AccountEntryDetails](
	[AccountEntryDetailsSK] [int] IDENTITY(1,1) NOT NULL,
	[AccountEntryID] [nvarchar](100) NULL,
	[AccountEntryBook] [nvarchar](50) NULL,
	[AccountEntryBookDate] [datetime] NULL,
	[AccountEntryDocument] [nvarchar](50) NULL,
	[AccountEntryDocumentDate] [datetime] NULL,
	[AccountEntryRemarks] [nvarchar](500) NULL,
	[AccountEntryCurrencyCode] [nvarchar](3) NULL,
	[AccountEntryFiscalYear] [int] NULL,
	[AccountEntryInvoiceURL] [nvarchar](200) NULL,
	[AccountEntryBarCode] [nvarchar](100) NULL,
	[AccountEntryLabelDetails] [nvarchar](700) NULL,
	[AccountEntryAnalyticalPercentage] [numeric](18, 4) NULL,
	[AccountEntryIsDicharged] [bit] NULL,
	[AccountEntryIsCredit] [bit] NULL,
 CONSTRAINT [PK_DIM_AccountEntryDetails_1] PRIMARY KEY CLUSTERED 
(
	[AccountEntryDetailsSK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WRK_AccountMapping]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WRK_AccountMapping](
	[SpecificAccountNum] [nvarchar](50) NULL,
	[SpecificAccountLabel] [nvarchar](255) NULL,
	[GeneralAccountNum] [nvarchar](50) NULL,
	[GeneralAccountLabel] [nvarchar](255) NULL,
	[CompanyCD] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WRK_AccountEntries]    Script Date: 07/16/2012 12:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WRK_AccountEntries](
	[AccountEntryID] [nvarchar](100) NULL,
	[Book] [nvarchar](50) NULL,
	[BookDate] [datetime] NULL,
	[Document] [nvarchar](50) NULL,
	[DocumentDate] [datetime] NULL,
	[FiscalYear] [int] NULL,
	[ImputationDate] [datetime] NULL,
	[EntryDate] [datetime] NULL,
	[MaturityDate] [datetime] NULL,
	[AmountDebit] [decimal](16, 4) NULL,
	[AmountCredit] [decimal](16, 4) NULL,
	[CurrencyCode] [nvarchar](3) NULL,
	[AmountDebitInEur] [decimal](16, 4) NULL,
	[AmountCreditInEur] [decimal](16, 4) NULL,
	[ExchangeRate] [decimal](18, 6) NULL,
	[Remarks] [nvarchar](500) NULL,
	[ReferingThirdPartyCode] [nvarchar](50) NULL,
	[ReferingGeneralAccount] [nvarchar](50) NULL,
	[ReferingSpecificAccount] [nvarchar](50) NULL,
	[ReferingFirstAnalyticalCode] [nvarchar](50) NULL,
	[ReferingSecondAnalyticalCode] [nvarchar](50) NULL,
	[ReferingThirdAnalyticalCode] [nvarchar](50) NULL,
	[ReferingFourthAnalyticalCode] [nvarchar](50) NULL,
	[ReferingCompanyCode] [nvarchar](50) NULL,
	[InvoiceURL] [nvarchar](200) NULL,
	[BarCode] [nvarchar](100) NULL,
	[AnalyticalPercentage] [numeric](18, 4) NULL,
	[IsDicharged] [bit] NULL,
	[IsCredit] [bit] NULL,
	[YearMonth]  AS (datepart(year,[EntryDate])*(100)+datepart(month,[EntryDate]))
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_ReportPlanSIG]    Script Date: 07/16/2012 12:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_ReportPlanSIG]
AS
SELECT     ReportPlanPathSk, ReportPlanLevel0Num, ReportPlanLevel0Name, ReportPlanLevel1Num, ReportPlanLevel1Name, ReportPlanLevel2Num, ReportPlanLevel2Name, 
                      ReportPlanLevel3Num, ReportPlanLevel4Num, ReportPlanLevel4Name, ReportPlanLevel3Name, ReportPlanLevel5Num, ReportPlanLevel5Name, 
                      ReportPlanLevel6Num, ReportPlanLevel6Name, ReportPlanLevel7Num, ReportPlanLevel7Name, ReportPlanAccountNum
FROM         dbo.DIM_ReportPlan
WHERE     (ReportPlanType = 2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
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
         Begin Table = "DIM_ReportPlan"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 285
               Right = 516
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5010
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEW_ReportPlanSIG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEW_ReportPlanSIG'
GO
/****** Object:  View [dbo].[VIEW_ReportPlanPLN]    Script Date: 07/16/2012 12:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_ReportPlanPLN]
AS
SELECT     ReportPlanType, ReportPlanPathSk, ReportPlanLevel0Num, ReportPlanLevel0Name, ReportPlanLevel1Num, ReportPlanLevel1Name, ReportPlanLevel2Num, 
                      ReportPlanLevel2Name, ReportPlanAccountNum
FROM         dbo.DIM_ReportPlan
WHERE     (ReportPlanType = 1) AND (ReportPlanLevel0Num IS NOT NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[11] 3) )"
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
         Begin Table = "DIM_ReportPlan"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 308
               Right = 667
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
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
      Begin ColumnWidths = 11
         Column = 1890
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEW_ReportPlanPLN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEW_ReportPlanPLN'
GO
/****** Object:  Table [dbo].[DIM_Company]    Script Date: 07/16/2012 12:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Company](
	[CompanySK] [int] IDENTITY(1,1) NOT NULL,
	[CompanyCode] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](100) NULL,
	[CompanySurname] [nvarchar](100) NULL,
	[CompanyCountrySkFk] [int] NOT NULL,
	[CompanyAddress] [nvarchar](50) NULL,
	[CompanyStreet] [nvarchar](50) NULL,
	[CompanyZipCode] [nvarchar](50) NULL,
	[CompanyCity] [nvarchar](50) NULL,
	[CompanyPolitePhrase] [nvarchar](50) NULL,
	[CompanyContact] [nvarchar](50) NULL,
	[CompanyTel1] [nvarchar](50) NULL,
	[CompanyTel2] [nvarchar](50) NULL,
	[CompanyTel3] [nvarchar](50) NULL,
	[CompanyFax] [nvarchar](50) NULL,
	[CompanyEmail] [nvarchar](50) NULL,
	[CompanyWWW] [nvarchar](100) NULL,
	[CompanyVAT] [nvarchar](50) NULL,
	[CompanyBankAccount] [nvarchar](50) NULL,
	[CompanyCurrencyCode] [nvarchar](3) NULL,
	[CompanyIsAdjustingCompany] [bit] NULL,
 CONSTRAINT [PK_DIM_Company_1] PRIMARY KEY CLUSTERED 
(
	[CompanySK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTLESS_ActiveDirectory]    Script Date: 07/16/2012 12:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTLESS_ActiveDirectory](
	[ActiveDirectoryGroupSkFk] [int] NOT NULL,
	[CompanySkFk] [int] NOT NULL,
	[PrimaryAnalyticalCodeSkFk] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_Budget]    Script Date: 07/16/2012 12:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_Budget](
	[BudgetAccountingPlanSkFk] [bigint] NOT NULL,
	[BudgetAnalyticalAccountSkFk] [int] NOT NULL,
	[BudgetYearMonthSkFk] [int] NOT NULL,
	[BudgetCompanySkFk] [int] NOT NULL,
	[BudgetAmount] [decimal](18, 4) NULL,
	[BudgetFirstReportPlanSkFk] [int] NULL,
	[BudgetSecondReportPlanSkFk] [int] NULL,
	[BudgetThirdReportPlanSkFk] [int] NULL,
	[BudgetFourthReportPlanSkFk] [int] NULL,
	[BudgetFifthReportPlanSkFk] [int] NULL,
	[BudgetSixthReportPlanSkFk] [int] NULL,
 CONSTRAINT [PK_FACT_Budget] PRIMARY KEY CLUSTERED 
(
	[BudgetAccountingPlanSkFk] ASC,
	[BudgetAnalyticalAccountSkFk] ASC,
	[BudgetYearMonthSkFk] ASC,
	[BudgetCompanySkFk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_AccountEntry]    Script Date: 07/16/2012 12:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_AccountEntry](
	[AccountEntryAccountingPlanSkFk] [bigint] NOT NULL,
	[AccountEntryDetailsSkFk] [int] NOT NULL,
	[AccountEntryDateNumSkFk] [int] NOT NULL,
	[AccountEntryImputationDateNumSkFk] [int] NOT NULL,
	[AccountEntryMaturityDateSkFk] [int] NULL,
	[AccountEntryAmountDebit] [decimal](16, 4) NULL,
	[AccountEntryAmountCredit] [decimal](16, 4) NULL,
	[AccountEntryBalance]  AS (abs([AccountEntryAmountCredit])-abs([AccountEntryAmountDebit])),
	[AccountEntryBalanceInverted]  AS ((abs([AccountEntryAmountCredit])-abs([AccountEntryAmountDebit]))*(-1)),
	[AccountEntryAmountDebitInEUR] [decimal](16, 4) NULL,
	[AccountEntryAmountCreditInEUR] [decimal](16, 4) NULL,
	[AccountEntryBalanceInEur]  AS (abs([AccountEntryAmountCreditInEUR])-abs([AccountEntryAmountDebitInEUR])),
	[AccountEntryBalanceInEurInverted]  AS ((abs([AccountEntryAmountCreditInEUR])-abs([AccountEntryAmountDebitInEUR]))*(-1)),
	[AccountEntryPrimaryAnalyticalAccountSkFk] [int] NOT NULL,
	[AccountEntrySecondaryAnalyticalAccountSkFk] [int] NULL,
	[AccountEntryCompanySkFk] [int] NOT NULL,
	[AccountEntryThirdPartySkFk] [int] NULL,
	[AccountEntrySpecificAccountingPlanSkFk] [bigint] NULL,
	[AccountEntryFirstReportPlanSkFk] [int] NULL,
	[AccountEntrySecondReportPlanSkFk] [int] NULL,
	[AccountEntryThirdReportPlanSkFk] [int] NULL,
	[AccountEntryFourthReportPlaSkFk] [int] NULL,
	[AccountEntryFifthReportPlanSkFk] [int] NULL,
	[AccountEntrySixthReportPlanSkFk] [int] NULL,
 CONSTRAINT [PK_FACT_AccountEntry] PRIMARY KEY CLUSTERED 
(
	[AccountEntryAccountingPlanSkFk] ASC,
	[AccountEntryDetailsSkFk] ASC,
	[AccountEntryDateNumSkFk] ASC,
	[AccountEntryPrimaryAnalyticalAccountSkFk] ASC,
	[AccountEntryCompanySkFk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_REP_FinancialKPI_OperatingResults]    Script Date: 07/16/2012 12:37:25 ******/
ALTER TABLE [dbo].[REP_FinancialKPI] ADD  CONSTRAINT [DF_REP_FinancialKPI_OperatingResults]  DEFAULT ((0)) FOR [OperatingResults]
GO
/****** Object:  Default [DF_REP_FinancialKPI_TotalRevenus]    Script Date: 07/16/2012 12:37:25 ******/
ALTER TABLE [dbo].[REP_FinancialKPI] ADD  CONSTRAINT [DF_REP_FinancialKPI_TotalRevenus]  DEFAULT ((0)) FOR [TotalRevenus]
GO
/****** Object:  Default [DF_REP_FinancialKPI_TotalCost]    Script Date: 07/16/2012 12:37:25 ******/
ALTER TABLE [dbo].[REP_FinancialKPI] ADD  CONSTRAINT [DF_REP_FinancialKPI_TotalCost]  DEFAULT ((0)) FOR [TotalCost]
GO
/****** Object:  Default [DF_REP_FinancialKPI_TotalProfitsWithoutCapDev]    Script Date: 07/16/2012 12:37:25 ******/
ALTER TABLE [dbo].[REP_FinancialKPI] ADD  CONSTRAINT [DF_REP_FinancialKPI_TotalProfitsWithoutCapDev]  DEFAULT ((0)) FOR [TotalProfitsWithoutCapDev]
GO
/****** Object:  Default [DF_REP_FinancialKPI_FinancialResults]    Script Date: 07/16/2012 12:37:25 ******/
ALTER TABLE [dbo].[REP_FinancialKPI] ADD  CONSTRAINT [DF_REP_FinancialKPI_FinancialResults]  DEFAULT ((0)) FOR [FinancialResults]
GO
/****** Object:  Default [DF_REP_FinancialKPI_ExceptionalResult]    Script Date: 07/16/2012 12:37:25 ******/
ALTER TABLE [dbo].[REP_FinancialKPI] ADD  CONSTRAINT [DF_REP_FinancialKPI_ExceptionalResult]  DEFAULT ((0)) FOR [ExceptionalResults]
GO
/****** Object:  Default [DF_FACT_AccountEntry_AccountEntryAmountD]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry] ADD  CONSTRAINT [DF_FACT_AccountEntry_AccountEntryAmountD]  DEFAULT ((0)) FOR [AccountEntryAmountDebit]
GO
/****** Object:  Default [DF_FACT_AccountEntry_AccountEntryAmountC]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry] ADD  CONSTRAINT [DF_FACT_AccountEntry_AccountEntryAmountC]  DEFAULT ((0)) FOR [AccountEntryAmountCredit]
GO
/****** Object:  ForeignKey [FK_DIM_Company_DIM_Country]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[DIM_Company]  WITH CHECK ADD  CONSTRAINT [FK_DIM_Company_DIM_Country] FOREIGN KEY([CompanyCountrySkFk])
REFERENCES [dbo].[DIM_Country] ([CountrySk])
GO
ALTER TABLE [dbo].[DIM_Company] CHECK CONSTRAINT [FK_DIM_Company_DIM_Country]
GO
/****** Object:  ForeignKey [FK_FACTLESS_ActiveDirectory_DIM_ActiveDirectory]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACTLESS_ActiveDirectory]  WITH CHECK ADD  CONSTRAINT [FK_FACTLESS_ActiveDirectory_DIM_ActiveDirectory] FOREIGN KEY([ActiveDirectoryGroupSkFk])
REFERENCES [dbo].[DIM_ActiveDirectory] ([ActiveDirectorySK])
GO
ALTER TABLE [dbo].[FACTLESS_ActiveDirectory] CHECK CONSTRAINT [FK_FACTLESS_ActiveDirectory_DIM_ActiveDirectory]
GO
/****** Object:  ForeignKey [FK_FACTLESS_ActiveDirectory_DIM_Company]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACTLESS_ActiveDirectory]  WITH CHECK ADD  CONSTRAINT [FK_FACTLESS_ActiveDirectory_DIM_Company] FOREIGN KEY([CompanySkFk])
REFERENCES [dbo].[DIM_Company] ([CompanySK])
GO
ALTER TABLE [dbo].[FACTLESS_ActiveDirectory] CHECK CONSTRAINT [FK_FACTLESS_ActiveDirectory_DIM_Company]
GO
/****** Object:  ForeignKey [FK_FACT_Budget_DIM_AccountingPlan]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_Budget]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Budget_DIM_AccountingPlan] FOREIGN KEY([BudgetAccountingPlanSkFk])
REFERENCES [dbo].[DIM_AccountingPlan] ([AccountingPlanPathSK])
GO
ALTER TABLE [dbo].[FACT_Budget] CHECK CONSTRAINT [FK_FACT_Budget_DIM_AccountingPlan]
GO
/****** Object:  ForeignKey [FK_FACT_Budget_DIM_Company]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_Budget]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Budget_DIM_Company] FOREIGN KEY([BudgetCompanySkFk])
REFERENCES [dbo].[DIM_Company] ([CompanySK])
GO
ALTER TABLE [dbo].[FACT_Budget] CHECK CONSTRAINT [FK_FACT_Budget_DIM_Company]
GO
/****** Object:  ForeignKey [FK_FACT_Budget_DIM_PrimaryAnalyticalAccount]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_Budget]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Budget_DIM_PrimaryAnalyticalAccount] FOREIGN KEY([BudgetAnalyticalAccountSkFk])
REFERENCES [dbo].[DIM_FirstAnalyticalCode] ([FirstAnalyticalCodeSK])
GO
ALTER TABLE [dbo].[FACT_Budget] CHECK CONSTRAINT [FK_FACT_Budget_DIM_PrimaryAnalyticalAccount]
GO
/****** Object:  ForeignKey [FK_FACT_Budget_DIM_ReportPlan]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_Budget]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan] FOREIGN KEY([BudgetFirstReportPlanSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_Budget] CHECK CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan]
GO
/****** Object:  ForeignKey [FK_FACT_Budget_DIM_ReportPlan1]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_Budget]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan1] FOREIGN KEY([BudgetSecondReportPlanSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_Budget] CHECK CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan1]
GO
/****** Object:  ForeignKey [FK_FACT_Budget_DIM_ReportPlan2]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_Budget]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan2] FOREIGN KEY([BudgetThirdReportPlanSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_Budget] CHECK CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan2]
GO
/****** Object:  ForeignKey [FK_FACT_Budget_DIM_ReportPlan3]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_Budget]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan3] FOREIGN KEY([BudgetFourthReportPlanSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_Budget] CHECK CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan3]
GO
/****** Object:  ForeignKey [FK_FACT_Budget_DIM_ReportPlan4]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_Budget]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan4] FOREIGN KEY([BudgetFifthReportPlanSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_Budget] CHECK CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan4]
GO
/****** Object:  ForeignKey [FK_FACT_Budget_DIM_ReportPlan5]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_Budget]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan5] FOREIGN KEY([BudgetSixthReportPlanSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_Budget] CHECK CONSTRAINT [FK_FACT_Budget_DIM_ReportPlan5]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_AccountEntryDetails]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_AccountEntryDetails] FOREIGN KEY([AccountEntryDetailsSkFk])
REFERENCES [dbo].[DIM_AccountEntryDetails] ([AccountEntryDetailsSK])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_AccountEntryDetails]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_AccountingPlan]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_AccountingPlan] FOREIGN KEY([AccountEntryAccountingPlanSkFk])
REFERENCES [dbo].[DIM_AccountingPlan] ([AccountingPlanPathSK])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_AccountingPlan]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_Company]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_Company] FOREIGN KEY([AccountEntryCompanySkFk])
REFERENCES [dbo].[DIM_Company] ([CompanySK])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_Company]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_FifthReportPlan]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_FifthReportPlan] FOREIGN KEY([AccountEntryFifthReportPlanSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_FifthReportPlan]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_FirstReportPlan]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_FirstReportPlan] FOREIGN KEY([AccountEntryFirstReportPlanSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_FirstReportPlan]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_FourthReportPlan]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_FourthReportPlan] FOREIGN KEY([AccountEntryFourthReportPlaSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_FourthReportPlan]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_PrimaryAnalyticalAccount]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_PrimaryAnalyticalAccount] FOREIGN KEY([AccountEntryPrimaryAnalyticalAccountSkFk])
REFERENCES [dbo].[DIM_FirstAnalyticalCode] ([FirstAnalyticalCodeSK])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_PrimaryAnalyticalAccount]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_SecondaryAnalyticalAccount]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_SecondaryAnalyticalAccount] FOREIGN KEY([AccountEntrySecondaryAnalyticalAccountSkFk])
REFERENCES [dbo].[DIM_SecondAnalyticalCode] ([SecondAnalyticalCodeSK])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_SecondaryAnalyticalAccount]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_SecondReportPlan]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_SecondReportPlan] FOREIGN KEY([AccountEntrySecondReportPlanSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_SecondReportPlan]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_SixthReportPlan]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_SixthReportPlan] FOREIGN KEY([AccountEntrySixthReportPlanSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_SixthReportPlan]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_SpecificAccountingPlan]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_SpecificAccountingPlan] FOREIGN KEY([AccountEntrySpecificAccountingPlanSkFk])
REFERENCES [dbo].[DIM_SpecificAccountingPlan] ([SpecificAccountPlanSk])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_SpecificAccountingPlan]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_ThirdParty]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdParty] FOREIGN KEY([AccountEntryThirdPartySkFk])
REFERENCES [dbo].[DIM_ThirdParty] ([ThirdPartySk])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdParty]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_ThirdReportPlan]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdReportPlan] FOREIGN KEY([AccountEntryThirdReportPlanSkFk])
REFERENCES [dbo].[DIM_ReportPlan] ([ReportPlanPathSk])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_ThirdReportPlan]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_Time]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_Time] FOREIGN KEY([AccountEntryMaturityDateSkFk])
REFERENCES [dbo].[DIM_Time] ([DateSk])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_Time]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_Time1]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_Time1] FOREIGN KEY([AccountEntryDateNumSkFk])
REFERENCES [dbo].[DIM_Time] ([DateSk])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_Time1]
GO
/****** Object:  ForeignKey [FK_FACT_AccountEntry_DIM_Time2]    Script Date: 07/16/2012 12:37:26 ******/
ALTER TABLE [dbo].[FACT_AccountEntry]  WITH CHECK ADD  CONSTRAINT [FK_FACT_AccountEntry_DIM_Time2] FOREIGN KEY([AccountEntryImputationDateNumSkFk])
REFERENCES [dbo].[DIM_Time] ([DateSk])
GO
ALTER TABLE [dbo].[FACT_AccountEntry] CHECK CONSTRAINT [FK_FACT_AccountEntry_DIM_Time2]
GO
