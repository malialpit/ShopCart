using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopCart
{
    public partial class AddBrand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrandRepeater();
            }
        }

        private void BindBrandRepeater()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopCart"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblBrands", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrBrands.DataSource = dt;
                        rptrBrands.DataBind();
                    }
                }
            }
        }

        protected void btnAddBrand_Click(object sender, EventArgs e)
        {
            if (txtBrand.Text != null && txtBrand.Text != "" && txtBrand.Text != string.Empty)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopCart"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Insert into tblBrands(Name) Values('" + txtBrand.Text + "')", con);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script> alert('Brand Added Successfully ');  </script>");
                    txtBrand.Text = string.Empty;

                    con.Close();                ;
                    txtBrand.Focus();


                }
            }
        }
        protected void txtID_TextChanged(object sender, EventArgs e)
        {
        }
        protected void btnUpdateBrand_Click(object sender, EventArgs e)
        {
            
        }
    }
}