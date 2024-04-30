using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using System.Data;

namespace proiect_ti
{
    public partial class strg : System.Web.UI.Page
    {   OracleConnection conn;
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
                GridView5.DataSource = ds.Tables["salarii"].DefaultView;
                GridView5.DataBind();
                conn.Close();
                txtNumeCautat.Text = "Nume cautat";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "Actualizare salariati");
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "Eroare Actualizare salariati");
            }
        }
    }

    private void RefreshGrid()
    {
        conn = new OracleConnection(connString);
        conn.Open();
        string str = "SELECT * FROM salarii";

        da = new OracleDataAdapter(str, conn);
        ds = new DataSet();
        da.Fill(ds, "salarii");
        GridView5.DataSource = ds.Tables["salarii"].DefaultView;
        GridView5.DataBind();
        conn.Close();
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }

    protected void cautare_angj_Click(object sender, EventArgs e)
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

            GridView5.DataSource = ds.Tables["salarii"].DefaultView;
            GridView5.DataBind();
            conn.Close();
        }
        else
        {
            conn = new OracleConnection(connString);
            conn.Open();
            string str = "SELECT * FROM salarii";

            da = new OracleDataAdapter(str, conn);
            ds = new DataSet();
            da.Fill(ds, "salarii");

            ds.Tables["salarii"].DefaultView.RowFilter = "nume LIKE '*" + split[0] + "*' OR prenume LIKE '*" + split[0] + "*'";

            GridView5.DataSource = ds.Tables["salarii"].DefaultView;
            GridView5.DataBind();
            conn.Close();
        }
    }

    protected void Grid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string getCommand = "";
            conn = new OracleConnection(connString);
            conn.Open();
            getCommand = "SELECT nr_crt, nume,prenume, functie, salar_baza, spor, premii_brute, retineri FROM salarii WHERE nr_Crt=" + GridView5.Rows[GridView5.SelectedIndex].Cells[1].Text;
            var cmd = new OracleCommand(getCommand, conn);
            var reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();

            }
            conn.Close();
            cmd.Dispose();


        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "ErrorSelectedIndex");
        }
    }

    protected void btnstergeangajat_Click(object sender, EventArgs e)
    {
        try
        {
            conn = new OracleConnection(connString);
            conn.Open();
            OracleParameter p = new OracleParameter();
            p.Value = GridView5.Rows[GridView5.SelectedIndex].Cells[1].Text;

            string command = "DELETE from salarii where nr_crt = :1";
            OracleCommand cmd = new OracleCommand(command, conn);

            cmd.Parameters.Add(p);
            cmd.ExecuteNonQuery();
            conn.Close();
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Angajat sters cu succes.')</SCRIPT>");
            RefreshGrid();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Eroare stergere.Verificati daca ati selectat angajatul.')</SCRIPT>");
        }
    }
}
}