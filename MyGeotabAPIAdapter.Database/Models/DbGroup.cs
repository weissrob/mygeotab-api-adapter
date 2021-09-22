﻿using Dapper.Contrib.Extensions;
using System;

namespace MyGeotabAPIAdapter.Database.Models
{
    [Table("Groups")]
    public class DbGroup
    {
        [Key]
        public long id { get; set; }
        public string GeotabId { get; set; }
        public string ParentId { get; set; }
        public string Name { get; set; }
        public string Color { get; set; }
        public string Comments { get; set; }
        public string Reference { get; set; }
        public int EntityStatus { get; set; }
        public DateTime RecordLastChangedUtc { get; set; }
        [Write(false)]
        public Common.DatabaseWriteOperationType DatabaseWriteOperationType { get; set; }
    }
}