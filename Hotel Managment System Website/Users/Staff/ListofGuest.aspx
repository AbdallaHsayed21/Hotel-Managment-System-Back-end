<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Staff/StaffMaster.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#990099" Text="List Of Guests :" Font-Underline="True"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Username" DataSourceID="SqlDataSource1" EnableModelValidation="True" GridLines="Horizontal" Width="689px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:TemplateField>
                    <ControlStyle Height="40px" Width="40px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                <asp:BoundField DataField="GuestType" HeaderText="GuestType" SortExpression="GuestType" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="Nationality" HeaderText="Nationality" SortExpression="Nationality" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                <asp:BoundField DataField="CreditCardNumber" HeaderText="CreditCardNumber" SortExpression="CreditCardNumber" />
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#993399" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Firstname], [Lastname], [GuestType], [Gender], [Nationality], [PhoneNumber], [CreditCardNumber], [Username], [Email] FROM [Guest]"></asp:SqlDataSource>
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
</asp:Content>

