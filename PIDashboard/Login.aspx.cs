using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PIDashboard
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            if (ValidarForm())
            {
                try
                {
                    using (pi_ecommerceEntities db = new pi_ecommerceEntities())
                    {
                        usuario usuario = new usuario();

                        usuario = db.usuario.FirstOrDefault(x =>
                            x.Username.Equals(txtUsuario.Text, StringComparison.CurrentCultureIgnoreCase) &&
                            x.Senha.Equals(txtSenha.Text)
                        );

                        if (usuario != null)
                        {
                            Session["Usuario"] = usuario;
                            Session["TipoUsuario"] = usuario.usuario_tipo;

                            Session.Timeout = 60;
                            Response.Redirect("Default.aspx");
                        }
                        else
                        {
                            lblErro.Text = "Nome de usuário incorreto ou senha inválida.";
                        }
                    }
                }
                catch { }
            }
            else
            {
                txtSenha.Text = string.Empty;
                txtUsuario.Text = string.Empty;

                lblErro.Text = "Oops! Informe o Nome de usuário e senha.";
            }
        }

        private bool ValidarForm()
        {
            if (string.IsNullOrEmpty(txtUsuario.Text))
                return false;
            else if (string.IsNullOrEmpty(txtSenha.Text))
                return false;

            return true;
        }
    }
}