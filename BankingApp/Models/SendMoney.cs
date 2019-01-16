using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BankingApp.Models
{
    public class SendMoney
    {

        public string   SenderAccount{ get; set; }
        public string TargetAccount { get; set; }
        public string Amount { get; set; }
    }
}