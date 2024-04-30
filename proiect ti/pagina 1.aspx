<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pagina 1.aspx.cs" Inherits="proiect_ti.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table id="Table1">
        <tr>
            <th>Nume</th>
            <th>
                <asp:TextBox ID="txtNume" runat="server"></asp:TextBox>
            </th>
            <th>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNume" ErrorMessage="Caracterele folosite pentru introducerea numelui nu sunt valide." Font-Bold="true" ForeColor="Red" ValidationExpression="^([A-Za-z ,.'-]*)+$">
                </asp:RegularExpressionValidator>
            </th>
            <th>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNume" ErrorMessage="Trebuie sa introduceti numele angajatului" ForeColor="Red"></asp:RequiredFieldValidator>
            </th>
            <th>
                <asp:Label ID="lblNume" runat="server" Text="           "></asp:Label>
            </th>
        </tr>
        <tr>
            <th></th>
        </tr>
        <tr>
            <th>Prenume</th>
            <th>
                <asp:TextBox ID="txtPrenume" runat="server" Style="margin-bottom: 0px"></asp:TextBox>
            </th>
            <th>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrenume" ErrorMessage="Caracterele folosite pentru introducerea prenumelui nu sunt valide." Font-Bold="true" ForeColor="Red" ValidationExpression="^([A-Za-z ,.'-]*)+$"></asp:RegularExpressionValidator>
            </th>
            <th>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrenume" ErrorMessage="Trebuie sa introduceti prenumele angajatului" ForeColor="Red"></asp:RequiredFieldValidator>
            </th>
            <th>
                <asp:Label ID="lblPrenume" runat="server" Text="           "></asp:Label>
            </th>
        </tr>
        <tr>
            <th></th>
        </tr>
        <tr>
            <th>Functie</th>
            <th>
                <asp:TextBox ID="txtFunctie" runat="server" Style="margin-bottom: 0px"></asp:TextBox>
            </th>
            <th>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtFunctie" ErrorMessage="Caracterele folosite pentru introducerea functiei nu sunt valide." Font-Bold="true" ForeColor="Red" ValidationExpression="^([A-Za-z ,.'-]*)+$"></asp:RegularExpressionValidator>
            </th>
            <th>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFunctie" ErrorMessage="Trebuie sa introduceti functia angajatului" ForeColor="Red"></asp:RequiredFieldValidator>
            </th>
            <th>
                <asp:Label ID="lblFunctie" runat="server" Text="           "></asp:Label>
            </th>
        </tr>
        <tr>
            <th></th>
        </tr>
        <tr>
            <th>Salar Baza</th>
            <th>
                <asp:TextBox ID="txtSalarBaza" runat="server" Style="margin-bottom: 0px"></asp:TextBox>
            </th>
            <th>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtSalarBaza" ErrorMessage="Salariul de baza trebuie sa fie un numar" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </th>
            <th>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtSalarBaza" ErrorMessage="Salarul de baza trebuie sa fie in intervalul 2080 - 1000000" ForeColor="Red" MaximumValue="1000000" MinimumValue="2080" Type="Integer"></asp:RangeValidator>
            </th>
            <th>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSalarBaza" ErrorMessage="Trebuie sa introduceti salarul de baza" ForeColor="Red"></asp:RequiredFieldValidator>
            </th>
        </tr>
        <tr>
            <th></th>
        </tr>
        <tr>
            <th>Spor</th>
            <th>
                <asp:TextBox ID="txtSpor" runat="server" Style="margin-bottom: 0px">0</asp:TextBox>
            </th>
            <th>
                <asp:RegularExpressionValidator ID="revSpor" runat="server" ControlToValidate="txtSpor" ErrorMessage="Sporul trebuie sa fie un numar" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </th>
            <th>
                <asp:RangeValidator ID="rvSpor" runat="server" ControlToValidate="txtSpor" ErrorMessage="Valoarea sporului trebuie sa fie un numar cuprins in intervalului 0-100." ForeColor="Red" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator>
            </th>
            <th>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSpor" ErrorMessage="Trebuie sa introduceti o valoare pentru spor. (inclusiv 0)" ForeColor="Red"></asp:RequiredFieldValidator>
            </th>
        </tr>
        <tr>
            <th></th>
        </tr>
        <tr>
            <th>Premii</th>
            <th>
                <asp:TextBox ID="txtPremiiBrute" runat="server" Style="margin-bottom: 0px">0</asp:TextBox>
            </th>
            <th>
                <asp:RegularExpressionValidator ID="revPremii" runat="server" ControlToValidate="txtPremiiBrute" ErrorMessage="Valoarea premiilor trebuie sa fie un numar" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </th>
            <th>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtPremiiBrute" ErrorMessage="Valoarea premiilor brute trebuie sa fie un numar, cuprins in intervalul 0-1000000" ForeColor="Red" MaximumValue="1000000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
            </th>
            <th>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPremiiBrute" ErrorMessage="Trebuie sa introduceti o valoare pentru premii. (inclusiv 0)" ForeColor="Red"></asp:RequiredFieldValidator>
            </th>
        </tr>
        <tr>
            <th></th>
        </tr>
        <tr>
            <th>Retineri</th>
            <th>
                <asp:TextBox ID="txtRetineri" runat="server" Style="margin-bottom: 0px">0</asp:TextBox>
            </th>
            <th>
                <asp:RegularExpressionValidator ID="revRetineri" runat="server" ControlToValidate="txtRetineri" ErrorMessage="Valoarea retinerilor trebuie sa fie un numar" ForeColor="Red" ValidationExpression="^\d+$" />
            </th>
            <th>
                <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtRetineri" ErrorMessage="Valoarea retinerilor trebuie sa fie un numar cuprins in intervalul 0-1000000." ForeColor="Red" MaximumValue="1000000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
            </th>
            <th>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtRetineri" ErrorMessage="Trebuie sa introduceti o valoare pentru retineri. (inclusiv 0)" ForeColor="Red"></asp:RequiredFieldValidator>
            </th>
        </tr>
    </table>
    <p>
    </p>
</asp:Content>
