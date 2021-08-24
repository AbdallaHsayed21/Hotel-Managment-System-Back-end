<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Admin/AdminMaster.master" %>
<%@import Namespace="System.Data.SqlClient" %>
<%@import Namespace="System.Data" %>

<script runat="server">

    protected void btnExcute_Click(object sender, EventArgs e)
    {
        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

        SqlCommand cmdSelect = new SqlCommand(txtQuery.Text, conn);

        DataTable tbl = new DataTable();

        conn.Open();

        tbl.Load(cmdSelect.ExecuteReader());

        gdvResult.DataSource = tbl;

        gdvResult.DataBind();

        conn.Close();
        
        
    }

   
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993399" Text="Enter Your SQL Statement : " Font-Underline="True"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="txtQuery" runat="server" Height="83px"  TextMode="MultiLine" Width="277px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnExcute" runat="server" BackColor="#993366" Font-Bold="True" Font-Size="Large" ForeColor="White" OnClick="btnExcute_Click" Text="Excute" BorderColor="#660066" BorderStyle="None" />
    </p>
<p>
        <asp:GridView ID="gdvResult" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="761px" BackColor="#FFCCFF">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#993399" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#993399" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFFCC" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

