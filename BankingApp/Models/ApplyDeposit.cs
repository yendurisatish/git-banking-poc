using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BankingApp.Models
{
    public class ApplyDeposit
    {
        public string AccountNumber { get; set; }
        public string DepositAmount { get; set; }
        public string Duration { get; set; }

    }
}