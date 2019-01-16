using BankingApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankingApp 
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        ApplyLoan al = new ApplyLoan();
        User usr = new User();
      public void initialise()
        {
            al.AccountNumber = Convert.ToInt64(Session["account_no"]);
            al.EmpType = EmpType.Text;
            al.LoanType = LoanType.Text;
            al.LoanAmount = txtLoanAmount.Text;
            al.Payslip = Convert.ToString(SaveFile(uploadPayslip.PostedFile));
            al.Photo = Convert.ToString(SaveFile(uploadPhoto.PostedFile));
            al.Signature = Convert.ToString(SaveFile(uploadSignature.PostedFile));
            al.Income = txtIncome.Text;
            al.City = txtCity.Text;
        }
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
                Constants.openedPageName = this.GetType().BaseType.Name + ".aspx";
                Server.Transfer("Login.aspx");
            }

        }
      private void ClearControl( Control control )
        {
    var textbox = control as TextBox;
    if (textbox != null)
        textbox.Text = string.Empty;

    var dropDownList = control as DropDownList;
    if (dropDownList != null)
        dropDownList.SelectedIndex = 0;
   

    foreach( Control childControl in control.Controls )
          {
        ClearControl( childControl );
          }
       }
      
        
      protected void btnApplyLoan_Click(object sender, EventArgs e)
        {
            this.initialise();
            int i=usr.applyLoan(al);
            if(i==0)
                Response.Write(Constants.alertLoanAppliedSuccess);
            Successlbl.Visible = true;
            Successlbl.Text = Constants.lnAppliedLabel;
            // LoanType.ClearSelection();
            ClearControl(this);

          
        }

        string SaveFile(HttpPostedFile file)
        {
            // Specify the path to save the uploaded file to.
            string savePath = Constants.path;

            // Get the name of the file to upload.
            string fileName = file.FileName;

            // Create the path and file name to check for duplicates.
            string pathToCheck = savePath + fileName;

            // Create a temporary file name to use for checking duplicates.
            string tempfileName = "";

            // Check to see if a file already exists with the
            // same name as the file to upload.        
            if (System.IO.File.Exists(pathToCheck))
            {
                int counter = 2;
                while (System.IO.File.Exists(pathToCheck))
                {
                    // if a file with this name already exists,
                    // prefix the filename with a number.
                    tempfileName = counter.ToString() + fileName;
                    pathToCheck = savePath + tempfileName;
                    counter++;
                }

                fileName = tempfileName;

                // Notify the user that the file name was changed.
                //UploadStatusLabel.Text = "A file with the same name already exists." +
                //   "<br />Your file was saved as " + fileName;
            }
            else
            {
                // Notify the user that the file was saved successfully.
               // UploadStatusLabel.Text = "Your file was uploaded successfully.";
            }

            // Append the name of the file to upload to the path.
            savePath += fileName;

            // Call the SaveAs method to save the uploaded
            // file to the specified directory.
            file.SaveAs(Server.MapPath(savePath));
            return savePath;

        }

        [WebMethod]
        public static List<string> GetCity(string cityName)
        {
            List<string> cityResult = new List<string>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BankManagmentConn"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select Top 10 city from Loan where city LIKE ''+@SearchCityName+'%'";
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@SearchCityName", cityName);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        cityResult.Add(dr["city"].ToString());
                    }
                    con.Close();
                    return cityResult;
                }
            }
        } 

    }
}