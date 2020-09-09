USE [geotabadapterdb]
GO
/****** Object:  Table [dbo].[Conditions]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conditions](
	[Id] [nvarchar](50) NOT NULL,
	[ParentId] [nvarchar](50) NULL,
	[RuleId] [nvarchar](50) NULL,
	[ConditionType] [nvarchar](50) NOT NULL,
	[DeviceId] [nvarchar](50) NULL,
	[DiagnosticId] [nvarchar](100) NULL,
	[DriverId] [nvarchar](50) NULL,
	[Value] [float] NULL,
	[WorkTimeId] [nvarchar](50) NULL,
	[ZoneId] [nvarchar](50) NULL,
	[EntityStatus] [int] NOT NULL,
	[RecordLastChangedUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rules]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rules](
	[Id] [nvarchar](50) NOT NULL,
	[ActiveFrom] [datetime2](7) NULL,
	[ActiveTo] [datetime2](7) NULL,
	[BaseType] [nvarchar](50) NULL,
	[Comment] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Version] [bigint] NOT NULL,
	[EntityStatus] [int] NOT NULL,
	[RecordLastChangedUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwRuleObject]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwRuleObject]
AS
SELECT r.Id, r.ActiveFrom, r.ActiveTo, r.BaseType, r.Comment, r.Name, r.Version, r.EntityStatus, r.RecordLastChangedUtc, c.Id AS Cond_Id, c.ParentId AS Cond_ParentId, c.RuleId AS Cond_RuleId, c.ConditionType AS Cond_ConditionType, 
                  c.DeviceId AS Cond_DeviceId, c.DiagnosticId AS Cond_DiagnosticId, c.Value AS Cond_Value, c.WorkTimeId AS Cond_WorkTimeId, c.ZoneId AS Cond_ZoneId, c.EntityStatus AS Cond_EntityStatus, 
                  c.RecordLastChangedUtc AS Cond_RecordLastChangedUtc
FROM     dbo.Rules AS r INNER JOIN
                  dbo.Conditions AS c ON r.Id = c.Id
GO
/****** Object:  Table [dbo].[ConfigFeedVersions]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigFeedVersions](
	[FeedTypeId] [nvarchar](50) NOT NULL,
	[LastProcessedFeedVersion] [bigint] NOT NULL,
	[RecordLastChangedUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[Id] [nvarchar](50) NOT NULL,
	[ActiveFrom] [datetime2](7) NULL,
	[ActiveTo] [datetime2](7) NULL,
	[DeviceType] [nvarchar](50) NOT NULL,
	[LicensePlate] [nvarchar](50) NULL,
	[LicenseState] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductId] [int] NULL,
	[SerialNumber] [nvarchar](12) NOT NULL,
	[VIN] [nvarchar](50) NULL,
	[EntityStatus] [int] NOT NULL,
	[RecordLastChangedUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnostics]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnostics](
	[Id] [nvarchar](100) NOT NULL,
	[ControllerId] [nvarchar](100) NULL,
	[DiagnosticCode] [int] NULL,
	[DiagnosticName] [nvarchar](255) NOT NULL,
	[DiagnosticSourceId] [nvarchar](50) NOT NULL,
	[DiagnosticSourceName] [nvarchar](255) NOT NULL,
	[DiagnosticUnitOfMeasureId] [nvarchar](50) NOT NULL,
	[DiagnosticUnitOfMeasureName] [nvarchar](255) NOT NULL,
	[OBD2DTC] [nvarchar](50) NULL,
	[EntityStatus] [int] NOT NULL,
	[RecordLastChangedUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DVIRDefectRemarks]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVIRDefectRemarks](
	[Id] [nvarchar](50) NOT NULL,
	[DVIRDefectId] [nvarchar](50) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[Remark] [nvarchar](max) NOT NULL,
	[RemarkUserId] [nvarchar](50) NULL,
	[EntityStatus] [int] NOT NULL,
	[RecordLastChangedUtc] [datetime2](7) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DVIRDefects]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVIRDefects](
	[Id] [nvarchar](50) NOT NULL,
	[DVIRLogId] [nvarchar](50) NOT NULL,
	[DefectListAssetType] [nvarchar](50) NULL,
	[DefectListId] [nvarchar](50) NULL,
	[DefectListName] [nvarchar](255) NULL,
	[PartId] [nvarchar](50) NULL,
	[PartName] [nvarchar](255) NULL,
	[DefectId] [nvarchar](50) NULL,
	[DefectName] [nvarchar](255) NULL,
	[DefectSeverity] [nvarchar](50) NULL,
	[RepairDateTime] [datetime2](7) NULL,
	[RepairStatus] [nvarchar](50) NULL,
	[RepairUserId] [nvarchar](50) NULL,
	[EntityStatus] [int] NOT NULL,
	[RecordLastChangedUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DVIRLogs]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVIRLogs](
	[Id] [nvarchar](50) NOT NULL,
	[CertifiedByUserId] [nvarchar](50) NULL,
	[CertifiedDate] [datetime2](7) NULL,
	[CertifyRemark] [nvarchar](max) NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[DeviceId] [nvarchar](50) NULL,
	[DriverId] [nvarchar](50) NULL,
	[DriverRemark] [nvarchar](max) NULL,
	[IsSafeToOperate] [bit] NULL,
	[LocationLatitude] [float] NULL,
	[LocationLongitude] [float] NULL,
	[LogType] [nvarchar](50) NULL,
	[RepairDate] [datetime2](7) NULL,
	[RepairRemark] [nvarchar](max) NULL,
	[RepairedByUserId] [nvarchar](50) NULL,
	[TrailerId] [nvarchar](50) NULL,
	[TrailerName] [nvarchar](255) NULL,
	[Version] [bigint] NOT NULL,
	[RecordCreationTimeUtc] [datetime2](7) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExceptionEvents]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExceptionEvents](
	[Id] [nvarchar](50) NOT NULL,
	[ActiveFrom] [datetime2](7) NULL,
	[ActiveTo] [datetime2](7) NULL,
	[DeviceId] [nvarchar](50) NULL,
	[Distance] [real] NULL,
	[DriverId] [nvarchar](50) NULL,
	[DurationTicks] [bigint] NULL,
	[RuleId] [nvarchar](50) NULL,
	[Version] [bigint] NULL,
	[RecordCreationTimeUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaultData]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaultData](
	[Id] [nvarchar](50) NOT NULL,
	[AmberWarningLamp] [bit] NULL,
	[ClassCode] [nvarchar](50) NULL,
	[ControllerId] [nvarchar](100) NOT NULL,
	[ControllerName] [nvarchar](255) NULL,
	[Count] [int] NOT NULL,
	[DateTime] [datetime2](7) NULL,
	[DeviceId] [nvarchar](50) NOT NULL,
	[DiagnosticId] [nvarchar](100) NOT NULL,
	[DismissDateTime] [datetime2](7) NULL,
	[DismissUserId] [nvarchar](50) NULL,
	[FailureModeCode] [int] NULL,
	[FailureModeId] [nvarchar](50) NOT NULL,
	[FailureModeName] [nvarchar](255) NULL,
	[FaultLampState] [nvarchar](50) NULL,
	[FaultState] [nvarchar](50) NULL,
	[MalfunctionLamp] [bit] NULL,
	[ProtectWarningLamp] [bit] NULL,
	[RedStopLamp] [bit] NULL,
	[Severity] [nvarchar](50) NULL,
	[SourceAddress] [int] NULL,
	[RecordCreationTimeUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogRecords]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogRecords](
	[Id] [nvarchar](50) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[DeviceId] [nvarchar](50) NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Speed] [real] NOT NULL,
	[RecordCreationTimeUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyGeotabVersionInfo]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyGeotabVersionInfo](
	[DatabaseName] [nvarchar](58) NOT NULL,
	[Server] [nvarchar](50) NOT NULL,
	[DatabaseVersion] [nvarchar](50) NOT NULL,
	[ApplicationBuild] [nvarchar](50) NOT NULL,
	[ApplicationBranch] [nvarchar](50) NOT NULL,
	[ApplicationCommit] [nvarchar](50) NOT NULL,
	[GoTalkVersion] [nvarchar](50) NOT NULL,
	[RecordCreationTimeUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusData]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusData](
	[Id] [nvarchar](50) NOT NULL,
	[Data] [float] NULL,
	[DateTime] [datetime2](7) NULL,
	[DeviceId] [nvarchar](50) NOT NULL,
	[DiagnosticId] [nvarchar](100) NOT NULL,
	[RecordCreationTimeUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trips]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trips](
	[Id] [nvarchar](50) NOT NULL,
	[DeviceId] [nvarchar](50) NOT NULL,
	[DriverId] [nvarchar](50) NOT NULL,
	[Distance] [real] NOT NULL,
	[DrivingDurationTicks] [bigint] NOT NULL,
	[NextTripStart] [datetime2](7) NOT NULL,
	[Start] [datetime2](7) NOT NULL,
	[Stop] [datetime2](7) NOT NULL,
	[StopDurationTicks] [bigint] NOT NULL,
	[StopPointX] [float] NULL,
	[StopPointY] [float] NULL,
	[RecordCreationTimeUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](50) NOT NULL,
	[ActiveFrom] [datetime2](7) NOT NULL,
	[ActiveTo] [datetime2](7) NOT NULL,
	[EmployeeNo] [nvarchar](50) NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[IsDriver] [bit] NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[EntityStatus] [int] NOT NULL,
	[RecordLastChangedUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zones]    Script Date: 2020-08-20 2:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zones](
	[Id] [nvarchar](100) NOT NULL,
	[ActiveFrom] [datetime2](7) NULL,
	[ActiveTo] [datetime2](7) NULL,
	[CentroidLatitude] [float] NULL,
	[CentroidLongitude] [float] NULL,
	[Comment] [nvarchar](255) NULL,
	[Displayed] [bit] NULL,
	[ExternalReference] [nvarchar](255) NULL,
	[MustIdentifyStops] [bit] NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Version] [bigint] NULL,
	[EntityStatus] [int] NOT NULL,
	[RecordLastChangedUtc] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LogRecords] ADD  DEFAULT ((0)) FOR [Latitude]
GO
ALTER TABLE [dbo].[LogRecords] ADD  DEFAULT ((0)) FOR [Longitude]
GO
ALTER TABLE [dbo].[LogRecords] ADD  DEFAULT ((0)) FOR [Speed]
GO