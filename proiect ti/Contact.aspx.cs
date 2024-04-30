using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proiect_ti
{
    public partial class Contact : Page
    {
        OracleConnection conn;
        OracleDataAdapter da;
        DataSet ds;
        string str;
        string connString = "User Id=STUDENT;Password=student;Data Source=localhost:1521/XE;Persist Security Info=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    conn = new OracleConnection(connString);
                    conn.Open();
                    string str = "SELECT * FROM salarii";

                    da = new OracleDataAdapter(str, conn);
                    ds = new DataSet();
                    da.Fill(ds, "salarii");

                    GridView1.DataSource = ds.Tables["salarii"].DefaultView;
                    GridView1.DataBind();
                    conn.Close();
                    
                }
                catch
                {
                   
                }
            }
        }

        protected void txtNume_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtNumeCautat_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnCautare_Click1(object sender, EventArgs e)
        {
            char[] sep = { ' ', ',', '-' };
            string[] split = txtNumeCautat.Text.Split(sep);
            if (split.Length > 1)
            {
                conn = new OracleConnection(connString);
                conn.Open();
                string str = "SELECT * FROM salarii";

                da = new OracleDataAdapter(str, conn);
                ds = new DataSet();
                da.Fill(ds, "salarii");

                ds.Tables["salarii"].DefaultView.RowFilter = "nume LIKE '*" + split[0] + "*' OR prenume LIKE '*" + split[1] + "*'";

                // ** Afişează datele                  
                GridView1.DataSource = ds.Tables["salarii"].DefaultView;
                GridView1.DataBind();
                conn.Close();
            }
            else// if (split.Length == 1)
            {
                conn = new OracleConnection(connString);
                conn.Open();
                string str = "SELECT * FROM salarii";

                da = new OracleDataAdapter(str, conn);
                ds = new DataSet();
                da.Fill(ds, "salarii");

                ds.Tables["salarii"].DefaultView.RowFilter = "nume LIKE '*" + split[0] + "*' OR prenume LIKE '*" + split[0] + "*'";

                // ** Afişează datele                  
                GridView1.DataSource = ds.Tables["salarii"].DefaultView;
                GridView1.DataBind();
                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string command = "";


            try
            {
                conn = new OracleConnection(connString);
                conn.Open();
                command = "UPDATE salarii set nume='" + txtNume.Text + "', prenume='" + txtPrenume.Text + "', functie='" + txtFunctie.Text + "', salar_baza=" + txtSalarBaza.Text +
                     ", spor=" + txtSpor.Text + ", premii_brute=" + txtPremiiBrute.Text + ", retineri=" + txtRetineri.Text + " where nr_crt=" +
                     GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
                OracleCommand comm = new OracleCommand(command, conn);
                comm.ExecuteNonQuery();
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Actualizare realizata cu succes')</SCRIPT>");
                HttpContext.Current.Response.Write("Actualizare realizata cu succes");

            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Eroare la actualizare')</SCRIPT>");
            }

            RefreshGrid();
        }

        private void RefreshGrid()
        {
            conn = new OracleConnection(connString);
            conn.Open();
            string str = "SELECT * FROM salarii";

            da = new OracleDataAdapter(str, conn);
            ds = new DataSet();
            da.Fill(ds, "salarii");

            GridView1.DataSource = ds.Tables["salarii"].DefaultView;
            GridView1.DataBind();
            conn.Close();
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            try
            {

                string getCommand = "";
                conn = new OracleConnection(connString);
                conn.Open();
                getCommand = "SELECT nr_crt, nume,prenume, functie, salar_baza, spor, premii_brute, retineri FROM salarii WHERE nr_Crt=" + GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
                var cmd = new OracleCommand(getCommand, conn);
                var reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();

                    txtNume.Text = reader.GetValue(1).ToString();
                    txtPrenume.Text = reader.GetValue(2).ToString();
                    txtFunctie.Text = reader.GetValue(3).ToString();
                    txtSalarBaza.Text = reader.GetValue(4).ToString();
                    txtSpor.Text = reader.GetValue(5).ToString();
                    txtPremiiBrute.Text = reader.GetValue(6).ToString();
                    txtRetineri.Text = reader.GetValue(7).ToString();
                }
                conn.Close();
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "ErrorSelectedIndex");
            }
        }
    }
}