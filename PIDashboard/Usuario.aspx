<%@ Page Title="Usuário" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="PIDashboard.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            Dados do Usuário
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Nome</label>
                        <asp:HiddenField ID="hidID" runat="server" />
                        <asp:TextBox ID="txtNome" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Nome de Usuário</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-6">
                    <%
                        PIDashboard.usuario u = (PIDashboard.usuario)Session["Usuario"];

                        if (u.Tipo == 1)
                        {
                    %>
                            <div class="form-group">
                                <label>Tipo</label>
                                <asp:DropDownList
                                    ID="dpdTipoUsuario" CssClass="form-control" runat="server" DataSourceID="TipoUsuarioDataSource" DataTextField="Descricao" DataValueField="ID">
                                </asp:DropDownList>
                                <asp:EntityDataSource ID="TipoUsuarioDataSource" runat="server" ConnectionString="name=pi_ecommerceEntities" DefaultContainerName="pi_ecommerceEntities" EnableFlattening="False" EntitySetName="usuario_tipo" Select="it.[Descricao], it.[ID]">
                                </asp:EntityDataSource>
                            </div>
                    <%  
                        } 
                    %>
                    <div class="form-group">
                        <label>Senha</label>
                        <asp:TextBox ID="txtSenha" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <asp:Label ID="lblErro" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblSucesso" runat="server" Font-Bold="True" ForeColor="#00CC00"></asp:Label>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-6">
                    <asp:Button ID="btnSalvar" CssClass="btn btn-primary" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
                    <a href="ListaUsuarios.aspx" class="btn btn-danger">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
