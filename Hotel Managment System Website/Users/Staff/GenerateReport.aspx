<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Staff/StaffMaster.master" %>
<%@ Import Namespace ="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">

    protected void btnSearch_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

        string strSelect = "SELECT * FROM [ReservationTransaction] "
            + " WHERE Username = '" + txtUsername.Text + "'";

        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);


        SqlDataReader reader;
        DataTable tbl = new DataTable();

        conn.Open();
        reader = cmdSelect.ExecuteReader();
        tbl.Load(reader);
        conn.Close();

        gdvReport.DataSource = tbl;
        gdvReport.DataBind();
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993399" Text="Report :" Font-Underline="True"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" ForeColor="#993399" Text="Enter Username :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtUsername" runat="server" Height="24px" Width="153px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" BackColor="#993399" BorderColor="#660066" BorderStyle="None" Font-Bold="True" ForeColor="White" Height="33px" OnClick="btnSearch_Click" Text="Search" Width="80px" />
    </p>
    <p>
        <asp:GridView ID="gdvReport" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" GridLines="Horizontal" Width="712px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        </asp:GridView>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

