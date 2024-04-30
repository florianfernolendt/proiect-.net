<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="strg.aspx.cs" Inherits="proiect_ti.strg" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>&nbsp;</h2>
    <h2>&nbsp;</h2>
    <h2>&nbsp;</h2>
    <h2>&nbsp;</h2>
    <h2>&nbsp;</h2>
    <h2>Stergere angajati</h2>
    <div class="container">
        <p>
            <asp:TextBox ID="txtNumeCautat" runat="server" Width="280px" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            <asp:Button ID="cautare_angj" runat="server" Text="Cautare angajat" Width="128px" BackColor="#006600" BorderColor="White" Font-Bold="True" ForeColor="White" OnClick="cautare_angj_Click" />
        </p>
        <p>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNumeCautat" ErrorMessage="Caracterele folosite pentru introducerea numelui nu sunt valide." Font-Bold="true" ForeColor="Red" ValidationExpression="^([A-Za-z ,.'-]*)+$"></asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNumeCautat" ErrorMessage="Trebuie sa introduceti numele angajatului" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <div>
            <asp:GridView ID="GridView5" runat="server" OnSelectedIndexChanged="Grid_SelectedIndexChanged">
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Selectare" ShowHeader="True" Text="Select" />
                </Columns>
            </asp:GridView>
            <br />
            <div class="container">
                <asp:Button ID="btnstergeangajat" runat="server" Text="Sterge angajat" BackColor="#006600" Font-Bold="True" ForeColor="White" OnClick="btnstergeangajat_Click" />
            </div>
        </div>
    </div>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
</asp:Content>
