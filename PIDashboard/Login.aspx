<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PIDashboard.Login" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login | This.Game - Painel de Controle</title>

    <link href="Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
    <link href="Assets/metisMenu/metisMenu.min.css" rel="stylesheet" type="text/css" /> 
    <link href="Assets/sb-admin-2/css/sb-admin-2.css" rel="stylesheet" type="text/css" />
    <link href="Assets/morrisjs/morris.css" rel="stylesheet" type="text/css" />
    <link href="Assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div>
                        <div class="text-center" style="padding-top: 100px; padding-bottom: 10px;">
                            <img src="Imagens/tg.png" />
                        </div>
                        <div class="panel-body">
                            <fieldset>
                                <div class="form-group">
                                    <label>Nome de Usuário</label>
                                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Senha</label>
                                    <asp:TextBox ID="txtSenha" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>                                    
                                </div>
                                <div class="text-center">
                                    <asp:Label ID="lblErro" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                                <br />
                                <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="btn btn-lg btn-warning btn-block" OnClick="btnEntrar_Click" />
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Assets/jquery/jquery.min.js" />
                <asp:ScriptReference Path="~/Assets/bootstrap/js/bootstrap.min.js" />
                <asp:ScriptReference Path="~/Assets/metisMenu/metisMenu.min.js" />
                <asp:ScriptReference Path="~/Assets/sb-admin-2/js/sb-admin-2.min.js" />
            </Scripts>
        </asp:ScriptManager>
    </form>
</body>
</html>

