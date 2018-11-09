using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PIDashboard
{
    public partial class ListaUsuarios : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                usuario u = (usuario)Session["Usuario"];

                if (u.Tipo != 1)
                {
                    Response.Redirect("Default.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}