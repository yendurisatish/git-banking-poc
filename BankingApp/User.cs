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
    public class User
    {
       public int applyLoan(ApplyLoan al)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Constants.connectionString;
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("applyLoan", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@accountNumber", al.AccountNumber);
                cmd.Parameters.AddWithValue("@loanType", al.LoanType);
                cmd.Parameters.AddWithValue("@income", al.Income);
                cmd.Parameters.AddWithValue("@payslip", al.Payslip);
                cmd.Parameters.AddWithValue("@photo", al.Photo);
                cmd.Parameters.AddWithValue("@signature", al.Signature);
                cmd.Parameters.AddWithValue("@loanAmount", al.LoanAmount);
                cmd.Parameters.AddWithValue("@empType",al.EmpType);
                cmd.Parameters.AddWithValue("@city", al.City);
                cmd.ExecuteNonQuery();
            }
            finally
            {
               
                con.Close();
            }
            return 0;
        }
        public void applyDeposit(ApplyDeposit ad)
       {
           SqlConnection con = new SqlConnection();
           try
           {
               con.ConnectionString = Constants.connectionString;
               con.Open();
               SqlCommand cmd = new SqlCommand("applyDeposit", con);
               cmd.CommandType = CommandType.StoredProcedure;
               cmd.Parameters.AddWithValue("@accountNumber",ad.AccountNumber );
               cmd.Parameters.AddWithValue("@Amount",ad.DepositAmount );
               cmd.Parameters.AddWithValue("@duration",ad.Duration );
               cmd.ExecuteNonQuery();
              

           }
           finally
           {

               con.Close();
           }

       }
        public DataSet GetDetails()
       {
           SqlConnection con = new SqlConnection();
            DataSet ds = new DataSet();
           try
           {

               con.ConnectionString = Constants.connectionString;
               con.Open();
               string getLoanDetail = "SELECT username,accountno,account_type,balance FROM Customer where accountno=" + Constants.AccountNumber;
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
        public string sendMoney(SendMoney sm)
        {
            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString = Constants.connectionString;
                con.Open();
                SqlCommand cmd = new SqlCommand("sendmoney", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@targetaccount", sm.TargetAccount);
                cmd.Parameters.AddWithValue("@senderaccount", sm.SenderAccount);
                cmd.Parameters.AddWithValue("@bal", sm.Amount);
                cmd.Parameters.Add("@user", SqlDbType.NChar, 10);
                cmd.Parameters["@user"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                return cmd.Parameters["@user"].Value.ToString();

                
            }
            finally
            {

                con.Close();
            }

        }
        public DataTable TransHistory()
        {
            SqlConnection con = new SqlConnection();
            DataTable dt = new DataTable();
            try
            {
                int rowCount = 0;
                con.ConnectionString = Constants.connectionString;
                con.Open();
                string getRowNo = "use MyBank; select count(*) from [dbo].[Transaction]";
                SqlCommand cmd = new SqlCommand(getRowNo, con);
                SqlDataReader data = cmd.ExecuteReader();
                if (data.Read())
                {
                    rowCount = Convert.ToInt32(data.GetValue(0));
                }
                data.Close();
                string getDetails = "use MyBank; select transid,trans_account,amount,oth_account,convert(varchar, time, 103) as time from [dbo].[Transaction] where trans_account=" + Constants.AccountNumber + " or oth_account=" + Constants.AccountNumber;
                SqlCommand cmd1 = new SqlCommand(getDetails, con);
                SqlDataReader data1 = cmd1.ExecuteReader();
               
                dt.Columns.AddRange(new DataColumn[5] {
                    new DataColumn("trans id",typeof(int)),
                     new DataColumn("account number",typeof(double)),
                    new DataColumn("amount",typeof(float)),
                    new DataColumn("other account",typeof(double)),
               
               
                new DataColumn("time",typeof(string)),

               
                
                });
                while (data1.Read())
                {
                    dt.Rows.Add(data1.GetValue(0), data1.GetValue(1), data1.GetValue(2), data1.GetValue(3), data1.GetValue(4));
                    
                }
                data1.Close();

            }
            finally
            {

            }
            return dt;
        }
        public DataTable viewLoans()
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
                string getDetails = "select loan_id,account_no,loan_amount,convert(varchar,approved_time,103),approved from Loans where account_no=" + Constants.AccountNumber;
                SqlCommand cmd1 = new SqlCommand(getDetails, con);
                SqlDataReader data1 = cmd1.ExecuteReader();
               
                dt.Columns.AddRange(new DataColumn[5] {new DataColumn("loan id",typeof(int)),
                    new DataColumn("account number",typeof(double)),
                new DataColumn("loan amount",typeof(float)),
               // new DataColumn("duration",typeof(int)),
                new DataColumn("approved time",typeof(string)),
                new DataColumn("approved",typeof(string)),
               
                
                });
                while (data1.Read())
                {
                    dt.Rows.Add(data1.GetValue(0), data1.GetValue(1), data1.GetValue(2), data1.GetValue(3), data1.GetValue(4));
                    //GridView1.DataSource = dt;
                    //GridView1.DataBind();
                }
                data1.Close();

            }
            finally
            {

            }
            return dt;
        }
        public DataTable viewDeposits()
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
                string getDetails = "select deposit_id,accountno,deposit_amount,duration,convert(varchar,approved_time,103),approved from deposits where accountno=" + Constants.AccountNumber;
                SqlCommand cmd1 = new SqlCommand(getDetails, con);
                SqlDataReader data1 = cmd1.ExecuteReader();
               
                dt.Columns.AddRange(new DataColumn[6] {new DataColumn("deposit id",typeof(int)),
                    new DataColumn("account number",typeof(double)),
                new DataColumn("deposit amount",typeof(float)),
                new DataColumn("duration",typeof(int)),
                new DataColumn("approved time",typeof(string)),
                new DataColumn("approved",typeof(string)),
               
                
                });
                while (data1.Read())
                {
                    dt.Rows.Add(data1.GetValue(0), data1.GetValue(1), data1.GetValue(2), data1.GetValue(3), data1.GetValue(4), data1.GetValue(5));
                    //GridView1.DataSource = dt;
                    //GridView1.DataBind();
                }
                data1.Close();

            }
            finally
            {

            }
            return dt;
        }

    }
}