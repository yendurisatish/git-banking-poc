using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace BankingApp
{
    public static class Constants
    {
        public const string path = "~\\Files\\";
        public const string lnAppliedLabel = "loan applied...waiting for approval.";
        public const string alertLoanAppliedSuccess = "<script>alert('Inserted successfully!')</script>";
        public const string CreatedAccountAlert = "<script>alert('successfully registered');</script>";
        public const string ApprovedDepositAlert = "<script>alert('deposit successfully approved');</script>";
        public const string ApprovedLoanAlert = "<script>alert('loan successfully approved');</script>";
        public static string AccountNumber;
        public static string openedPageName = null;
        public static string[] adminPages = { "AdminHome.aspx", "AapproveDeposits.aspx", "AapproveLoans.aspx", "AcloseAccount.aspx", "AcreateAccount.aspx", "Aupdateaccount.aspx", "Aviewdeposits.aspx", "AviewLoans.aspx", "AviewUsers.aspx" };
        public static string[] userPages = { "CustomerHome.aspx", "ApplyLoan.aspx", "CapplyDeposits.aspx", "CsendMoney.aspx", "CtransHis.aspx", "CviewDeposits.aspx", "CviewLoans.aspx" };
        public static string Username;
        public static double Balance;
        public static bool isloggedIn = false;
        public static string loginstatus = "no";
        public static string pageRedirect = "";
        public const string TransactionSuccessfulAlert = "<script>alert('Transaction successful');</script>";
        public const string DepositAppliedAlert = "<script>alert('deposit successfully applied');</script>";
        public static string connectionString = ConfigurationManager.ConnectionStrings["BankManagmentConn"].ConnectionString;
    }
}