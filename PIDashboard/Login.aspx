<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PIDashboard.Login" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login | E-commerce Dashboard</title>

    <link href="Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
    <link href="Assets/metisMenu/metisMenu.min.css" rel="stylesheet" type="text/css" /> 
    <link href="Assets/sb-admin-2/css/sb-admin-2.css" rel="stylesheet" type="text/css" />
    <link href="Assets/morrisjs/morris.css" rel="stylesheet" type="text/css" />
    <link href="Assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">E-commerce Dashboard</h3>
                        </div>
                        <div class="panel-body">
                            <fieldset>
                                <div class="form-group">
                                    <label>Nome de usuário</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Senha</label>
                                    <asp:TextBox ID="txtSenha" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>                                    
                                </div>
                                <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="btn btn-lg btn-success btn-block" />
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Assets/jquery/jquery.min.js" />
                <asp:ScriptReference Path="~/Assets/bootstrap/js/bootstrap.min.js" />
                <asp:ScriptReference Path="~/Assets/metisMenu/metisMenu.min.js" />
                <asp:ScriptReference Path="~/Assets/raphael/raphael.min.js" />
                <asp:ScriptReference Path="~/Assets/morrisjs/morris.min.js" />
                <asp:ScriptReference Path="~/Assets/data/morris-data.js" />
                <asp:ScriptReference Path="~/Assets/sb-admin-2/js/sb-admin-2.min.js" />
            </Scripts>
        </asp:ScriptManager>
    </form>
</body>
</html>
