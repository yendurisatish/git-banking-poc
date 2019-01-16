using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BankingApp.Models
{
    public class CreateUser
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Admin { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime Dob { get; set; }
        public string Phoneno { get; set; }
        public string Email { get; set; }
        public string AadharNumber { get; set; }
        public string AccountType { get; set; }
        public string Balance { get; set; }
        public string Address { get; set; }

    }
}