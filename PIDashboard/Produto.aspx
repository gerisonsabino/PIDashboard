<%@ Page Title="Produto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Produto.aspx.cs" Inherits="PIDashboard.Produto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            Dados do Produto
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Título</label>
                        <asp:HiddenField ID="hidID" runat="server" />
                        <asp:TextBox ID="txtTitulo" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Descrição</label>
                        <asp:TextBox ID="txtDescricao" TextMode="multiline" Columns="50" Rows="5" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Preço</label>
                        <div class="input-group">
                            <span class="input-group-addon">R$</span>
                            <asp:TextBox ID="txtPreco" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Data de Lançamento</label>
                        <asp:TextBox ID="txtLancamento" CssClass="form-control" runat="server" data-provider="datepicker"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Plataforma</label>
                        <asp:DropDownList
                            ID="dpdPlataforma" CssClass="form-control" runat="server" 
                            DataSourceID="PlataformaDataSource" DataTextField="Nome" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:EntityDataSource ID="PlataformaDataSource" runat="server" 
                            ConnectionString="name=pi_ecommerceEntities" 
                            DefaultContainerName="pi_ecommerceEntities" EnableFlattening="False" 
                            EntitySetName="game_plataforma">
                        </asp:EntityDataSource>
                    </div>
                    <div class="form-group">
                        <label>Gênero</label>
                        <asp:DropDownList
                            ID="dpdGenero" CssClass="form-control" runat="server" DataSourceID="GeneroDataSource" 
                            DataTextField="Descricao" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:EntityDataSource ID="GeneroDataSource" runat="server" 
                            ConnectionString="name=pi_ecommerceEntities" 
                            DefaultContainerName="pi_ecommerceEntities" EnableFlattening="False" 
                            EntitySetName="game_genero">
                        </asp:EntityDataSource>
                    </div>
                    <div class="form-group">
                        <label>Desenvolvedor</label>
                        <asp:DropDownList
                            ID="dpdDesenvolvedor" CssClass="form-control" runat="server" 
                            DataSourceID="DesenvolvedorDataSource" DataTextField="Nome" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:EntityDataSource ID="DesenvolvedorDataSource" runat="server" 
                            ConnectionString="name=pi_ecommerceEntities" 
                            DefaultContainerName="pi_ecommerceEntities" EnableFlattening="False" 
                            EntitySetName="game_desenvolvedor">
                        </asp:EntityDataSource>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">                    
                        <label>Imagem de Capa (URL)</label>
                        <asp:TextBox ID="txtImagemURL" CssClass="form-control" runat="server" TextMode="Url"></asp:TextBox>
                    </div>
                    <div class="form-group" id="preview-img">
                        <label>Pré-visualização da imagem</label>
                        <br />                 
                        <asp:Image ID="imgCapa" Width="285px" Height="380px" runat="server" />
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
                    <a href="ListaProdutos.aspx" class="btn btn-danger">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
    <script src="Scripts/Views/produto.js" type="text/javascript"></script>
</asp:Content>
