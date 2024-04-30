using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using System.Data;
using System.Text.RegularExpressions;

namespace proiect_ti
{

    public partial class About : Page
    {
        OracleConnection conn;
        OracleDataAdapter da;

        DataSet ds, dsPass;
        OracleCommand cmd;
        string str;
        string connString = "User Id=STUDENT;Password=student;Data Source=localhost:1521/XE;Persist Security Info=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "Adaugare angajati");
            }
        }

        protected void btnAdaugaAngajat_Click(object sender, EventArgs e)
        {
            bool validStatus = true;

            if (!Regex.Match(txtNume.Text, "^([A-Za-z ,.'-]*)+$").Success)
            {

                lblNume.Text = "Caracterele folosite pentru nume nu sunt valide.";
                validStatus = false;
            }
            if (!Regex.Match(txtPrenume.Text, "^([A-Za-z ,.'-]*)+$").Success)
            {

                txtPrenume.Text = "Caracterele folosite pentru prenume nu sunt valide.";
                validStatus = false;
            }
            if (!Regex.Match(txtFunctie.Text, "^([A-Za-z ,.'-]*)+$").Success)
            {

                txtFunctie.Text = "Caracterele folosite pentru functie nu sunt valide.";
                validStatus = false;
            }

            if ((!Regex.Match(txtSalarBaza.Text, @"^\d+$").Success) || Convert.ToInt32(txtSalarBaza.Text) < 2080 || Convert.ToInt32(txtSalarBaza.Text) > 1000000)
            {
                txtSalarBaza.Text = "Salarul de baza trebuie sa fie un numar, cuprins in intervalul 2080 - 1000000.";
                validStatus = false;
            }

            if ((!Regex.Match(txtPremiiBrute.Text, @"^\d+$").Success) || Convert.ToInt32(txtPremiiBrute.Text) > 1000000 || Convert.ToInt32(txtPremiiBrute.Text) < 0)
            {
                txtPremiiBrute.Text = "Valoarea premiilor brute trebuie sa fie un numar, cuprins in intervalul 0-1000000.";
                validStatus = false;
            }

            if ((!Regex.Match(txtSpor.Text, @"^\d+$").Success) || Convert.ToInt32(txtSpor.Text) > 100 || Convert.ToInt32(txtSpor.Text) < 0)
            {
                txtSpor.Text = "Valoarea sporului trebuie sa fie un numar, cuprins in intervalului 0-100.";
                validStatus = false;
            }

            if ((!Regex.Match(txtRetineri.Text, @"^\d+$").Success) || Convert.ToInt32(txtRetineri.Text) > 1000000 || Convert.ToInt32(txtPremiiBrute.Text) < 0)
            {
                txtRetineri.Text = "Valoarea retinerilor trebuie sa fie un numar, cuprins in intervalul 0-1000000.";
                validStatus = false;
            }

            
            if (validStatus == true)
            {
                try
                {
                    conn = new OracleConnection(connString);
                    conn.Open();

                    string sqlString = "INSERT INTO salarii (nume,prenume,functie,salar_baza,spor,premii_brute,retineri) values ('"
                        + txtNume.Text + "','" + txtPrenume.Text + "','" + txtFunctie.Text + "'," + txtSalarBaza.Text + "," + txtSpor.Text + ","
                        + txtPremiiBrute.Text + "," + txtRetineri.Text + ")";
                    System.Diagnostics.Debug.WriteLine("\n\n\n"+ sqlString);
                    cmd = new OracleCommand(sqlString, conn);
                    int i = cmd.ExecuteNonQuery();
                    Reimprospatare();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "Adaugare cu succes");
                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Adaugare cu succes')</SCRIPT>");
                }
                catch (OracleException ex)
                {
                    conn = new OracleConnection(connString);
                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Eroare la adaugare')</SCRIPT>");
                }
                finally
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();
                }
            }
        }
        protected void btnReimprospatare_Click(object sender, EventArgs e)
        {
            Reimprospatare();
        }
        private void Reimprospatare()
        {
            txtNume.Text = "";
            txtPrenume.Text = "";
            txtFunctie.Text = "";
            txtSalarBaza.Text = "";
            txtSpor.Text = "0";
            txtPremiiBrute.Text = "0";
            txtRetineri.Text = "0";
        }
    }
    }