/* Clean Database */ 
--delete from "Conditions";
--delete from "ConfigFeedVersions";
--delete from "Devices";
--delete from "Diagnostics";
--delete from "DriverChanges";
--delete from "DutyStatusAvailabilities";
--delete from "DVIRDefectRemarks";
--delete from "DVIRDefects";
--delete from "DVIRDefectUpdates";
--delete from "DVIRLogs";
--delete from "ExceptionEvents";
--delete from "FailedDVIRDefectUpdates";
--delete from "FaultData";
--delete from "Groups";
--delete from "LogRecords";
--delete from "MyGeotabVersionInfo";
--delete from "Rules";
--delete from "StatusData";
--delete from "Trips";
--delete from "Users";
--delete from "Zones";
--delete from "ZoneTypes";

/* Check counts */
select 'Conditions' as "TableName", count(0) as "RecordCount" from "Conditions"
union all
select 'ConfigFeedVersions', count(0) from "ConfigFeedVersions"
union all
select 'Devices', count(0) from "Devices"
union all
select 'Diagnostics', count(0) from "Diagnostics"
union all
select 'DriverChanges', count(0) from "DriverChanges"
union all
select 'DutyStatusAvailabilities', count(0) from "DutyStatusAvailabilities"
union all
select 'DVIRDefectRemarks', count(0) from "DVIRDefectRemarks"
union all
select 'DVIRDefects', count(0) from "DVIRDefects"
union all
select 'DVIRDefectUpdates', count(0) from "DVIRDefectUpdates"
union all
select 'DVIRLogs', count(0) from "DVIRLogs"
union all
select 'ExceptionEvents', count(0) from "ExceptionEvents"
union all
select 'FailedDVIRDefectUpdates', count(0) from "FailedDVIRDefectUpdates"
union all
select 'FaultData', count(0) from "FaultData"
union all
select 'Groups', count(0) from "Groups"
union all
select 'LogRecords', count(0) from "LogRecords"
union all
select 'MyGeotabVersionInfo', count(0) from "MyGeotabVersionInfo"
union all
select 'Rules', count(0) from "Rules"
union all
select 'StatusData', count(0) from "StatusData"
union all
select 'Trips', count(0) from "Trips"
union all
select 'Users', count(0) from "Users"
union all
select 'Zones', count(0) from "Zones"
union all
select 'ZoneTypes', count(0) from "ZoneTypes"
order by "TableName";