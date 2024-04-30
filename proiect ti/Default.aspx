<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="proiect_ti._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Start</h2>
            <p>
                Aici sunt toti salariatii</p>
            <p>
                &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NR_CRT" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="NR_CRT" HeaderText="NR_CRT" ReadOnly="True" SortExpression="NR_CRT" />
                        <asp:BoundField DataField="NUME" HeaderText="NUME" SortExpression="NUME" />
                        <asp:BoundField DataField="PRENUME" HeaderText="PRENUME" SortExpression="PRENUME" />
                        <asp:BoundField DataField="FUNCTIE" HeaderText="FUNCTIE" SortExpression="FUNCTIE" />
                        <asp:BoundField DataField="SALAR_BAZA" HeaderText="SALAR_BAZA" SortExpression="SALAR_BAZA" />
                        <asp:BoundField DataField="SPOR" HeaderText="SPOR" SortExpression="SPOR" />
                        <asp:BoundField DataField="PREMII_BRUTE" HeaderText="PREMII_BRUTE" SortExpression="PREMII_BRUTE" />
                        <asp:BoundField DataField="TOTAL_BRUT" HeaderText="TOTAL_BRUT" SortExpression="TOTAL_BRUT" />
                        <asp:BoundField DataField="BRUT_IMPZ" HeaderText="BRUT_IMPZ" SortExpression="BRUT_IMPZ" />
                        <asp:BoundField DataField="IMPOZIT" HeaderText="IMPOZIT" SortExpression="IMPOZIT" />
                        <asp:BoundField DataField="CAS" HeaderText="CAS" SortExpression="CAS" />
                        <asp:BoundField DataField="CASS" HeaderText="CASS" SortExpression="CASS" />
                        <asp:BoundField DataField="RETINERI" HeaderText="RETINERI" SortExpression="RETINERI" />
                        <asp:BoundField DataField="VIRAT_CARD" HeaderText="VIRAT_CARD" SortExpression="VIRAT_CARD" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM &quot;SALARII&quot;"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SALARII&quot;"></asp:SqlDataSource>
            </p>
        </div>
    </div>

</asp:Content>
