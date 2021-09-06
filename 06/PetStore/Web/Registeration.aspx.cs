using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Web
{
    public partial class Registeration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text;
            string email = TextBox2.Text;
            string username = TextBox4.Text;
            string password = TextBox5.Text;
            string zipcode = TextBox3.Text;
            string query = "CustomerRegistration";
            string selectCustId = "Select * from customer";
            string ConString = ConfigurationManager.ConnectionStrings["PetDbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(ConString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter;
                    parameter = command.Parameters.Add("@Name", SqlDbType.VarChar);
                    parameter.Value = name;
                    parameter = command.Parameters.Add("@Zipcode", SqlDbType.VarChar);
                    parameter.Value = zipcode;
                    parameter = command.Parameters.Add("@Email", SqlDbType.VarChar);
                    parameter.Value = email;
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            int custid = 0;
            using (SqlConnection connection1 = new SqlConnection(ConString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(selectCustId, connection1))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["email"].ToString() == email)
                        {
                            custid = Convert.ToInt32(row["id"]);
                        }
                    }
                }
                using (SqlCommand command = new SqlCommand("CustomerLogin", connection1))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter;
                    parameter = command.Parameters.Add("@CustomerId", SqlDbType.Int);
                    parameter.Value = custid;
                    parameter = command.Parameters.Add("@UserName", SqlDbType.VarChar);
                    parameter.Value = username;
                    parameter = command.Parameters.Add("@Password", SqlDbType.VarChar);
                    parameter.Value = password;
                    connection1.Open();
                    command.ExecuteNonQuery();
                    connection1.Close();
                }
            }
        }
        }
}