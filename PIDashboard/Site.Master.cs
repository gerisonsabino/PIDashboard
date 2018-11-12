using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PIDashboard
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                usuario u = (usuario)Session["Usuario"];
                usuario_tipo t = (usuario_tipo)Session["TipoUsuario"];

                lblUsuario.Text = u.Nome + " (" + t.Descricao +")";
            }
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}
