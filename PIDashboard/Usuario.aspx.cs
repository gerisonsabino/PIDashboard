using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PIDashboard
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
            try
            {
                usuario u = (usuario)Session["Usuario"];

                if (Request["id"] != null)
                {
                    if (u.Tipo != 1)
                    {
                        Response.Redirect("Default.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        if (!IsPostBack)
                        {
                            int id = int.MinValue;
                            int.TryParse(Request["id"].ToString(), out id);
                            hidID.Value = id.ToString();

                            if (id > 0)
                            {
                                using (pi_ecommerceEntities db = new pi_ecommerceEntities())
                                {

                                    usuario usuario = db.usuario.First(x => x.ID == id);

                                    hidID.Value = usuario.ID.ToString();
                                    txtNome.Text = usuario.Nome;
                                    txtUsername.Text = usuario.Username;
                                    txtSenha.Text = usuario.Senha;
                                    txtSenha.Attributes["type"] = "password";

                                    dpdTipoUsuario.SelectedValue = usuario.Tipo.ToString();
                                }
                            }
                        }
                    }
                }
                else
                {
                    if (!IsPostBack)
                    {
                        using (pi_ecommerceEntities db = new pi_ecommerceEntities())
                        {

                            usuario usuario = db.usuario.First(x => x.ID == u.ID);

                            hidID.Value = usuario.ID.ToString();

                            txtNome.Text = usuario.Nome;
                            txtUsername.Text = usuario.Username;
                            txtSenha.Text = usuario.Senha;
                            txtSenha.Attributes["type"] = "password";
                        }
                    }
                }
            }
            catch
            {
                Response.Redirect("Default.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e) 
        {
            if (this.ValidarForm())
            {
                try 
                {
                    usuario u = (usuario)Session["Usuario"];

                    using (pi_ecommerceEntities db = new pi_ecommerceEntities())
                    {
                        int idUsuario = int.Parse(hidID.Value.ToString());
                        int idTipo = int.Parse(dpdTipoUsuario.SelectedValue);

                        usuario usuario = null;

                        if (u.Tipo == 1)
                        {
                            if (idUsuario > 0)
                                usuario = db.usuario.First(x => x.ID == idUsuario);
                            else
                                usuario = db.usuario.CreateObject();

                            usuario.usuario_tipo = db.usuario_tipo.First(x => x.ID == idTipo);
                        }
                        else
                        {
                            usuario = db.usuario.First(x => x.ID == u.ID);
                        }

                        usuario.Nome = txtNome.Text;
                        usuario.Senha = txtSenha.Text;
                        usuario.Username = txtUsername.Text;

                        if (usuario.ID == 0)
                            db.usuario.AddObject(usuario);
                        else
                            db.ObjectStateManager.ChangeObjectState(usuario, EntityState.Modified);

                        db.SaveChanges();

                        if (usuario.ID == u.ID)
                        {
                            Session["Usuario"] = usuario;
                            Session["TipoUsuario"] = usuario.usuario_tipo;
                        }

                        lblSucesso.Text = "Os dados do usuário foram salvos com sucesso.";
                    }
                }
                catch
                {
                    lblErro.Text = "Oops! Houve uma falha ao salvar.";
                }
            }
        }

        private bool ValidarForm()
        {
            bool b = true;

            if (string.IsNullOrEmpty(txtNome.Text))
            {
                txtNome.BorderColor = Color.Red;
                b = false;
            }

            if (string.IsNullOrEmpty(txtSenha.Text))
            {
                txtSenha.BorderColor = Color.Red;
                b = false;
            }

            if (string.IsNullOrEmpty(txtUsername.Text))
            {
                txtUsername.BorderColor = Color.Red;
                b = false;
            }

            return b;
        }
    }
}