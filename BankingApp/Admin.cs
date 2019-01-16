using BankingApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BankingApp
{
    public class Admin
    {
       public DataSet getDeposit()
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection();
            try
            {

                con.ConnectionString = Constants.connectionString;
                con.Open();
                string getDepositDetail = "SELECT * FROM getdeposits() where approved='no'";
                SqlCommand cmd = new SqlCommand(getDepositDetail, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
               
                da.Fill(ds);
            }
            finally
            {
                con.Close();
            }
            return ds;
        }
       public DataSet getDepositDetail()
       {
           DataSet ds = new DataSet();
           SqlConnection con = new SqlConnection();
           try
           {

               con.ConnectionString = Constants.connectionString;
               con.Open();
               string getDepositDetail = "SELECT * FROM getdeposits()";
               SqlCommand cmd = new SqlCommand(getDepositDetail, con);
               SqlDataAdapter da = new SqlDataAdapter(cmd);

               da.Fill(ds);
           }
           finally
           {
               con.Close();
           }
           return ds;
       }
        public DataSet GetLoans()
       {
           DataSet ds = new DataSet();
           SqlConnection con = new SqlConnection();
           try
           {

               con.ConnectionString = Constants.connectionString;
               con.Open();
               string getLoanDetail = "SELECT * from [view unapproved loans]";
               SqlCommand cmd = new SqlCommand(getLoanDetail, con);
               SqlDataAdapter da = new SqlDataAdapter(cmd);

               da.Fill(ds);
           }
           finally
           {
               con.Close();
           }
           return ds;
       }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public DataTable CloseAccountShowData()
        {
            SqlConnection con = new SqlConnection();
            DataTable ds = new DataTable();
            try
            {
                int rowCount = 0;
                con.ConnectionString = Constants.connectionString;
                con.Open();
                string getRowNo = "select count(*) from Customer";
                SqlCommand cmd = new SqlCommand(getRowNo, con);
                SqlDataReader data = cmd.ExecuteReader();
                if (data.Read())
                {
                    rowCount = Convert.ToInt32(data.GetValue(0));
                }
                data.Close();
                string getDetails = "select accountno,username,firstname,lastname,convert(varchar, dob,106) as dob,phoneno,email,aadhar_no,account_type,balance,address from customer";
                SqlDataAdapter Adp = new SqlDataAdapter(getDetails, con); 
                
               
                Adp.Fill(ds);
            }
            finally
            {
                con.Close();
            }
            return ds;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="cu"></param>
        public void CreateAccount(CreateUser cu)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Constants.connectionString;
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("AddAccount", con);
              // SqlCommand cmd1 = new SqlCommand("insert into Login(username,password,admin) values('" + cu.Username + "','" + cu.Password + "'," + cu.Admin + ");", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", cu.Username);
                //  cmd.Parameters.AddWithValue("@accountno", cu.AccountNumber);
                cmd.Parameters.AddWithValue("@firstname", cu.FirstName);
                cmd.Parameters.AddWithValue("@lastname", cu.LastName);
                cmd.Parameters.AddWithValue("@dob", cu.Dob);
                cmd.Parameters.AddWithValue("@phoneno", cu.Phoneno);
                cmd.Parameters.AddWithValue("@email", cu.Email);
                cmd.Parameters.AddWithValue("@aadhar_no", cu.AadharNumber);
                cmd.Parameters.AddWithValue("@account_type", cu.AccountType);
                cmd.Parameters.AddWithValue("@balance", cu.Balance);
                cmd.Parameters.AddWithValue("@address", cu.Address);
                cmd.Parameters.AddWithValue("@password", cu.Password);
                cmd.Parameters.AddWithValue("@admin", cu.Admin);
              //  cmd1.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }
        public DataSet AdminHomeGetData(string accno)
        {
            SqlConnection con = new SqlConnection();
            DataSet ds = new DataSet();
            try
            {

                con.ConnectionString = Constants.connectionString;
                con.Open();
                string getLoanDetail = "SELECT username,accountno,account_type,balance FROM Customer where accountno=" + accno;
                SqlCommand cmd = new SqlCommand(getLoanDetail, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
               
                da.Fill(ds);
                
            }
            finally
            {
                con.Close();
            }
            return ds;
        }
        public IList<AccountDetail> ViewUsers()
        {
            DataTable dt = this.AdminViewUsers();
            IList<AccountDetail> accountDetailList = new List<AccountDetail>();
            foreach (DataRow row in dt.Rows)
            {
                AccountDetail detail = new AccountDetail();
                detail.UserName = Convert.ToString(row["username"]);
                detail.AccountNumber = Convert.ToInt64(row["accountno"]);
                detail.FirstName = Convert.ToString(row["firstname"]);
                detail.LastName = Convert.ToString(row["lastname"]);
                detail.Dob = (Convert.ToString(row["dob"]));
               // detail.Dob = detail.Dob.Date;
               // string dateofbirth = detail.Dob.ToString("dd/MM/yyyy").Replace('-', '/');
               // detail.Dob = dateofbirth;
               // detail.Dob = detail.Dob.Date.ToString("dd/MM/yyyy").Replace('-', '/');
                detail.PhoneNumber = Convert.ToString(row["phoneno"]);
                detail.Email = Convert.ToString(row["email"]);
                detail.Aadhar = Convert.ToString(row["aadhar_no"]);
                detail.AccountType = Convert.ToString(row["account_type"]);
                detail.Balance = Convert.ToInt32(row["balance"]);
                detail.Address = Convert.ToString(row["address"]);
              //  detail.IsAdmin = Convert.ToBoolean(row["admin"]);
                accountDetailList.Add(detail);
            }
            return accountDetailList;
        }
        public DataTable AdminViewUsers()
        {
            SqlConnection con = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                int rowCount = 0;
                con.ConnectionString = Constants.connectionString;
                con.Open();
               
                string getRowNo = "select count(*) from Customer";
                SqlCommand cmd = new SqlCommand(getRowNo, con);
                SqlDataReader data = cmd.ExecuteReader();
                if (data.Read())
                {
                    rowCount = Convert.ToInt32(data.GetValue(0));
                }
                data.Close();
                string getDetails = "SELECT * FROM [view all users]";
                SqlCommand cmd1 = new SqlCommand(getDetails, con);
                SqlDataReader data1 = cmd1.ExecuteReader();
               
                dt.Columns.AddRange(new DataColumn[11] {new DataColumn("username",typeof(string)),
                    new DataColumn("accountno",typeof(double)),
                new DataColumn("firstname",typeof(string)),
                new DataColumn("lastname",typeof(string)),
                new DataColumn("dob",typeof(string)),
                new DataColumn("phoneno",typeof(string)),
                new DataColumn("email",typeof(string)),
                new DataColumn("aadhar_no",typeof(string)),
                 new DataColumn("account_type",typeof(string)),
                  new DataColumn("balance",typeof(double)),
                   new DataColumn("address",typeof(string))
                
                });
                while (data1.Read())
                {
                    dt.Rows.Add(data1.GetValue(0), data1.GetValue(1), data1.GetValue(2), data1.GetValue(3), data1.GetValue(4), data1.GetValue(5), data1.GetValue(6), data1.GetValue(7), data1.GetValue(8), data1.GetValue(9), data1.GetValue(10));
                    
                }
                data1.Close();

            }
            finally
            {
                con.Close();
            }
            return dt;
        }
        public DataTable GetLoanDetail(string fromdt,string todt)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection();
            try
            {

                con.ConnectionString = Constants.connectionString;
                con.Open();
                string getLoanDetail = "SELECT Id,dbo.fn_get_username(account_no) as username,LoanType,Income,account_no,loan_amount,convert(varchar, approved_time,103) as approved_time,Payslip,Photo,Signature,approved FROM LOAN where approved_time between '"+fromdt+"' and '"+todt+"'";
                SqlCommand cmd = new SqlCommand(getLoanDetail, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(dt);
            }
            finally
            {
                con.Close();
            }
            return dt;
        }

        public DataSet GetLoanDetail()
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection();
            try
            {

                con.ConnectionString = Constants.connectionString;
                con.Open();
                string getLoanDetail = "SELECT * FROM [view loans]";
                SqlCommand cmd = new SqlCommand(getLoanDetail, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(ds);
            }
            finally
            {
                con.Close();
            }
            return ds;
        }
        public void approveDeposits(ApproveDeposits ad)
        {
             SqlConnection con = new SqlConnection();
             con.ConnectionString = Constants.connectionString;
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("approvedeposits", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", ad.Id);
                 cmd.Parameters.AddWithValue("@accountno", ad.AccountNumber);
                 cmd.Parameters.AddWithValue("@bal", ad.Amount);
                 cmd.Parameters.AddWithValue("appAccountNo", ad.ApprovingAccountNumber);
                 cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }

        }
        public void approveLoans(ApproveLoans al)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Constants.connectionString;
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("approveloans", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", al.Id);
                cmd.Parameters.AddWithValue("@accountno", al.AccountNumber);
                cmd.Parameters.AddWithValue("@bal", al.Amount);
                cmd.Parameters.AddWithValue("@appAccountNo", al.ApprovingAccountNumber);
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }

        }
    }
}