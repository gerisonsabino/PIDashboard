using System;
using System.Data;
using System.Drawing;
using System.Linq;

namespace PIDashboard
{
    public partial class Produto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int id = int.MinValue;
                int.TryParse(Request["id"].ToString(), out id);

                game game = new game();

                hidID.Value = game.ID.ToString();

                if (id > 0)
                {
                    using (pi_ecommerceEntities db = new pi_ecommerceEntities())
                    {
                        game = db.game.FirstOrDefault(x => x.ID == id);
                        hidID.Value = game.ID.ToString();

                        if (!IsPostBack)
                        {
                            dpdDesenvolvedor.SelectedValue = game.IDDesenvolvedor.ToString();
                            dpdGenero.SelectedValue = game.IDGenero.ToString();
                            dpdPlataforma.SelectedValue = game.IDPlataforma.ToString();

                            imgCapa.ImageUrl = game.ImagemURL;

                            txtDescricao.Text = game.Descricao;
                            txtImagemURL.Text = game.ImagemURL;
                            txtLancamento.Text = game.Lancamento.ToShortDateString();
                            txtPreco.Text = game.Preco.ToString();
                            txtTitulo.Text = game.Titulo;
                        }
                    }
                }
            }
            catch
            {
                Response.Redirect("/ListaProdutos.aspx");
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
                        int idProduto = int.Parse(hidID.Value.ToString());
                        int idDesenvolvedor = int.Parse(dpdDesenvolvedor.SelectedValue);
                        int idGenero = int.Parse(dpdGenero.SelectedValue);
                        int idPlataforma = int.Parse(dpdPlataforma.SelectedValue);

                        game g = null;

                        if (idProduto > 0)
                            g = db.game.First(x => x.ID == idProduto);
                        else
                            g = db.game.CreateObject();

                        g.Descricao = txtDescricao.Text;
                        g.ImagemURL = txtImagemURL.Text;
                        g.Lancamento = DateTime.Parse(txtLancamento.Text);
                        g.Preco = decimal.Parse(txtPreco.Text);
                        g.Titulo = txtTitulo.Text;

                        g.game_desenvolvedor = db.game_desenvolvedor.First(x => x.ID == idDesenvolvedor);
                        g.game_genero = db.game_genero.First(x => x.ID == idGenero);
                        g.game_plataforma = db.game_plataforma.First(x => x.ID == idPlataforma);
                        g.usuario = db.usuario.First(x => x.ID == u.ID);

                        if (g.ID == 0)
                            db.game.AddObject(g);
                        else
                            db.ObjectStateManager.ChangeObjectState(g, EntityState.Modified);

                        db.SaveChanges();

                        lblSucesso.Text = "Os dados do produto foram salvos com sucesso.";
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

            if (string.IsNullOrEmpty(txtDescricao.Text))
            {
                txtDescricao.BorderColor = Color.Red;
                b = false;
            }

            if (string.IsNullOrEmpty(txtImagemURL.Text))
            {
                txtImagemURL.BorderColor = Color.Red;
                b = false;
            }

            if (string.IsNullOrEmpty(txtLancamento.Text))
            {
                txtLancamento.BorderColor = Color.Red;
                b = false;
            }

            try
            {
                double.Parse(txtPreco.Text);

                if (string.IsNullOrEmpty(txtPreco.Text))
                {
                    txtPreco.BorderColor = Color.Red;
                    b = false;
                }
            }
            catch
            {
                txtPreco.BorderColor = Color.Red;
                b = false;
            }

            if (string.IsNullOrEmpty(txtTitulo.Text))
            {
                txtTitulo.BorderColor = Color.Red;
                b = false;
            }

            return b;
        }
    }
}