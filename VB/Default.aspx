<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
	<title>Sample</title>
	<style type="text/css">
		tr.cw-hide {
			display: none;
		}
		.cw-Search-input{
			width: 99%;
		}
    </style>
    <script src="AppClientCode.js"></script>
    <script type="text/javascript">
		function click() {
		    grid.ShowCustomizationWindow();
		}
		function onInit(s, e) {
			columnFilterExtension.init();
		}
		function onEndCallback(s, e) {
			columnFilterExtension.init();
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxButton ID="btn" runat="server" AutoPostBack="false" Text="Show">
				<ClientSideEvents Click="click" />
			</dx:ASPxButton>

			<dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False" DataSourceID="AccessDataSource1">
				<Columns>
					<dx:GridViewDataTextColumn FieldName="ShipName" VisibleIndex="0" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ShipAddress" VisibleIndex="1" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ShipCity" VisibleIndex="2" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ShipRegion" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ShipPostalCode" VisibleIndex="4" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ShipCountry" VisibleIndex="5" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="CustomerID" VisibleIndex="6" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Customers.CompanyName" VisibleIndex="7" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="8" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="City" VisibleIndex="9" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Region" VisibleIndex="10" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="PostalCode" VisibleIndex="11" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Country" VisibleIndex="12"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Salesperson" ReadOnly="True" VisibleIndex="13" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="OrderID" VisibleIndex="14" Visible="false">
						<EditFormSettings Visible="False"></EditFormSettings>
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataDateColumn FieldName="OrderDate" VisibleIndex="15" Visible="false"></dx:GridViewDataDateColumn>
					<dx:GridViewDataDateColumn FieldName="RequiredDate" VisibleIndex="16" Visible="false"></dx:GridViewDataDateColumn>
					<dx:GridViewDataDateColumn FieldName="ShippedDate" VisibleIndex="17" Visible="false"></dx:GridViewDataDateColumn>
					<dx:GridViewDataTextColumn FieldName="Shippers.CompanyName" VisibleIndex="18"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ProductID" VisibleIndex="19"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="20"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="21" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="22" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Discount" VisibleIndex="23" Visible="false"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ExtendedPrice" ReadOnly="True" Visible="false" VisibleIndex="24"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Freight" VisibleIndex="25" Visible="false"></dx:GridViewDataTextColumn>
				</Columns>
				<SettingsBehavior EnableCustomizationWindow="true" />
				<SettingsPopup>
					<CustomizationWindow Width="300" Height="200" />
				</SettingsPopup>
				<StylesPopup>
					<CustomizationWindow>
						<MainArea CssClass="customizationWindowContent"></MainArea>
					</CustomizationWindow>
				</StylesPopup>
				<ClientSideEvents Init="onInit" EndCallback="onEndCallback" />
			</dx:ASPxGridView>
			<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
				SelectCommand="SELECT * FROM [Invoices]"></asp:AccessDataSource>
		</div>
	</form>
</body>
</html>
