<%@ Page Title="Usuários" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaUsuarios.aspx.cs" Inherits="PIDashboard.ListaUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Lista de Usuários
            </div>
            <div class="panel-body">
                <asp:GridView ID="grdUsuarios" CssClass="table table-striped table-responsive set-datatable" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="UsuariosDataSource">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="#" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Nome" HeaderText="Nome" ReadOnly="True" SortExpression="Nome" />
                        <asp:BoundField DataField="Username" HeaderText="Usuário" ReadOnly="True" SortExpression="Username" />
                        <asp:BoundField HeaderText="Opções" ReadOnly="True" />
                    </Columns>
                </asp:GridView>
                <asp:EntityDataSource ID="UsuariosDataSource" runat="server" 
                    ConnectionString="name=pi_ecommerceEntities" 
                    DefaultContainerName="pi_ecommerceEntities" EnableFlattening="False" 
                    EntitySetName="usuario" Select="it.[ID], it.[Nome], it.[Username]">
                </asp:EntityDataSource>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            var i = 0;
            $("#MainContent_grdUsuarios tbody tr").each(function () {
                if (i == 0) {
                    $("#MainContent_grdUsuarios").prepend("<thead>");
                    $("#MainContent_grdUsuarios thead").append($(this));
                }
                var id = $($(this).find("td")[0]).text();
                var td = $(this).find("td")[3];
                
                $(td).html("<a href='/Usuario.aspx?id=" + id + "'><span class='fa fa-angle-right'></span> <span>Abrir</span></a>");

                i++;
            });

            dataTable("#MainContent_grdUsuarios");
        });

    </script>
</asp:Content>
