using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace BankingApp
{
    /// <summary>
    /// Summary description for City
    /// </summary>
    public class City : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string term = context.Request["term"] ?? "";
            List<string> listCityNames = new List<string>();
            string cs = ConfigurationManager.ConnectionStrings["BankManagmentConn"].ConnectionString;
            using(SqlConnection con=new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetCity", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@term", term);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while(rdr.Read())
                {
                    listCityNames.Add(rdr["city"].ToString());
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            context.Response.Write(js.Serialize(listCityNames));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}