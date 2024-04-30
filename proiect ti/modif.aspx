<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="modif.aspx.cs" Inherits="proiect_ti.modif" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="170px"></asp:Panel>
    <h3><%: Title %>Modificare Procente</h3>

    <br />
    <br />
    <div>
        <table id="Table2" runat="server">

            <tr>
                <th>CAS</th>
                <th>
                    <asp:TextBox ID="txtCAS" runat="server" Style="margin-bottom: 0px"></asp:TextBox>
                </th>
                <th>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCAS" ErrorMessage="Trebuia introdusa valoare CAS" ForeColor="Red"></asp:RequiredFieldValidator></th>
            </tr>
            <tr><th></th></tr>
            <tr>
                <th>CASS</th>
                <th>
                    <asp:TextBox ID="txtCASS" runat="server" Style="margin-bottom: 0px"></asp:TextBox>
                </th>
                <th>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCASS" ErrorMessage="Trebuia introdusa valoare CASS " ForeColor="Red"></asp:RequiredFieldValidator></th>

            </tr>
             <tr><th></th></tr>
            <tr>
                <th>Impozit</th>
                <th>
                    <asp:TextBox ID="txtImpozit" runat="server" Style="margin-bottom: 0px"></asp:TextBox>
                </th>
                <th>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtImpozit" ErrorMessage="Trebuia introdusa valoare impozit" ForeColor="Red"></asp:RequiredFieldValidator></th>

            </tr>
             <tr><th></th></tr>
            <tr>
                <th>Parola</th>
                <th>
                    <asp:TextBox ID="txtParola" runat="server" Style="margin-bottom: 0px"
                        TextMode="Password"></asp:TextBox>
                    <th>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtImpozit" ErrorMessage="Trebuia introdusa parola" ForeColor="Red"></asp:RequiredFieldValidator></th>

                </th>
            </tr>
            </table>
        <br />

        <asp:Button ID="btnModificareProcente" runat="server" Text="Modificare Procente" BackColor="#1B655B" Font-Bold="True" ForeColor="White" Height="36px" Width="197px" OnClick="btnModificareProcente_Click" Font-Names="Arial Black"  />

        &nbsp;&nbsp;&nbsp;

        </div>
</asp:Content>