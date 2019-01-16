using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using BankingApp.Models;

namespace BankingApp
{
    public partial class AcreateAccount : System.Web.UI.Page
    {
        CreateUser cu = new CreateUser();
        Admin ad = new Admin();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Constants.isloggedIn)
            {
                if (!IsPostBack)
                {
                   

                }
            }
            else
            {
                Server.Transfer("Login.aspx");
            }
        }
        void initialiseCreateUser()
        {
            cu.Username = Usernametxt.Text;
            cu.Password = Passwordtxt.Text;
            cu.Admin = IsAdminDropDown.Text;
            cu.FirstName = Firstnametxt.Text;
            cu.LastName = Lastnametxt.Text;
            cu.Dob = DateTime.ParseExact(Dobtxt.Text, "dd/mm/yyyy", null);
            cu.Phoneno = Phonetxt.Text;
            cu.Email = Emailtxt.Text;
            cu.AadharNumber = Aadhartxt.Text;
            cu.AccountType = AccountTypeList.Text;
            cu.Balance = Balancetxt.Text;
            cu.Address = Addresstxt.Text;
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            
            //SqlConnection con = new SqlConnection();
            //con.ConnectionString = @"Data Source=HDDSAIVENKATAS\SQLEXPRESS;Initial Catalog=MyBank;User Id=sa;password=1234qwer$";
            //con.Open();
            //DateTime dob =DateTime.ParseExact(TextBox4.Text,"dd/mm/yyyy",null);
            //SqlCommand cmd1 = new SqlCommand("insert into Login(username,password,admin) values('" + TextBox1.Text + "','"+TextBox10.Text+"',"+DropDownList2.Text+");",con);
            //SqlCommand cmd = new SqlCommand("insert into customer(username,firstname,lastname,dob,phoneno,email,aadhar_no,account_type,balance,address,password,admin) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + dob + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + DropDownList1.Text + "','" + TextBox8.Text + "','" + TextBox9.Text + "','" + TextBox10.Text + "','" + DropDownList2.Text + "')", con);
            
            //int j = cmd1.ExecuteNonQuery();
            //int i = cmd.ExecuteNonQuery();
            //if (i > 0&& j>0)
            //{
               
            //    Response.Write("<script>alert('successfully registered');</script>");
            //}
                
            //con.Close();
            this.initialiseCreateUser();
            ad.CreateAccount(cu);
            Response.Write(Constants.CreatedAccountAlert);
            Server.Transfer("AdminHome.aspx");
            

        }
    }
}