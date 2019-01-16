using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BankingApp.Models
{
    public class ApproveLoans
    {
        public Int64 Id { get; set; }
        public string AccountNumber { get; set; }
        public Int32 Amount { get; set; }
        public string ApprovingAccountNumber { get; set; }
    }
}