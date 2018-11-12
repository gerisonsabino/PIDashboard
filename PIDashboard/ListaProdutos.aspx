<%@ Page Title="Produtos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaProdutos.aspx.cs" Inherits="PIDashboard.ListaProdutos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Lista de Produtos
            </div>
            <div class="panel-body">
                <asp:GridView ID="grdProdutos" CssClass="table table-striped table-responsive set-datatable" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="ProdutosDataSource">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="#" ReadOnly="True" 
                            SortExpression="ID" />
                        <asp:BoundField DataField="Titulo" HeaderText="Título" ReadOnly="True" 
                            SortExpression="Titulo" />
                        <asp:BoundField DataField="Preco" DataFormatString="{0:C}" HeaderText="Preço" ReadOnly="True" 
                            SortExpression="Preco" />
                        <asp:BoundField DataField="Lancamento" DataFormatString="{0:d}" HeaderText="Lançamento" ReadOnly="True" 
                            SortExpression="Lancamento" />
                        <asp:BoundField DataField="ID" HeaderText="Opções" ReadOnly="True" 
                            SortExpression="ID" />
                    </Columns>
                </asp:GridView>
                <asp:EntityDataSource ID="ProdutosDataSource" runat="server" 
                    ConnectionString="name=pi_ecommerceEntities" 
                    DefaultContainerName="pi_ecommerceEntities" EnableFlattening="False" 
                    EntitySetName="game" Select="it.[ID], it.[Titulo], it.[Preco], it.[Lancamento]">
                </asp:EntityDataSource>
            </div>
        </div>
    </div>
    <script src="Scripts/Views/lista-produtos.js" type="text/javascript"></script>
</asp:Content>