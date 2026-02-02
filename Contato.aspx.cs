using System;
using System.Net.Mail;
using System.Web.UI;

namespace Site
{
    public partial class Contato : Page
    {
        // Propriedades para mensagens
        public string Message { get; set; }
        public string MessageClass { get; set; }
        public string MessageIcon { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicializar página
                Message = "";
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string nome = txtNome.Text.Trim();
                    string email = txtEmail.Text.Trim();
                    string assunto = ddlAssunto.SelectedValue;
                    string mensagem = txtMensagem.Text.Trim();

                    // Enviar email
                    bool enviado = EnviarEmail(nome, email, assunto, mensagem);

                    if (enviado)
                    {
                        Message = "Mensagem enviada com sucesso! Entraremos em contato em breve.";
                        MessageClass = "success";
                        MessageIcon = "fa-check-circle";

                        // Limpar formulário
                        LimparFormulario();
                    }
                    else
                    {
                        Message = "Erro ao enviar mensagem. Tente novamente mais tarde.";
                        MessageClass = "error";
                        MessageIcon = "fa-exclamation-circle";
                    }
                }
                catch (Exception ex)
                {
                    Message = @"Erro: " + ex.Message;
                    MessageClass = "error";
                    MessageIcon = "fa-exclamation-circle";
                }
            }
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            LimparFormulario();
            Message = "";
        }

        private bool EnviarEmail(string nome, string email, string assunto, string mensagem)
        {
            try
            {
                // Configurações do Web.config
                string smtpServer = System.Configuration.ConfigurationManager.AppSettings["SmtpServer"];
                int smtpPort = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["SmtpPort"]);
                string smtpUsername = System.Configuration.ConfigurationManager.AppSettings["SmtpUsername"];
                string smtpPassword = System.Configuration.ConfigurationManager.AppSettings["SmtpPassword"];
                string emailTo = System.Configuration.ConfigurationManager.AppSettings["EmailTo"];
                string emailFrom = System.Configuration.ConfigurationManager.AppSettings["EmailFrom"];
                bool enableSsl = Convert.ToBoolean(System.Configuration.ConfigurationManager.AppSettings["EnableSsl"]);

                // Criar mensagem
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(emailFrom, "Site Dzutchaoz");
                mail.To.Add(emailTo);
                mail.Subject = @"Contato Site: " + assunto + " - " + nome;

                mail.Body = @"
                <html>
                <body style='font-family: Arial, sans-serif;'>
                    <h3>Novo contato recebido do site Dzutchaoz</h3>
                    <table border='0' cellpadding='5' cellspacing='0'>
                        <tr>
                            <td><strong>Nome:</strong></td>
                            <td>{nome}</td>
                        </tr>
                        <tr>
                            <td><strong>Email:</strong></td>
                            <td>{email}</td>
                        </tr>
                        <tr>
                            <td><strong>Assunto:</strong></td>
                            <td>{assunto}</td>
                        </tr>
                        <tr>
                            <td><strong>Data/Hora:</strong></td>
                            <td>{DateTime.Now:dd/MM/yyyy HH:mm}</td>
                        </tr>
                        <tr>
                            <td colspan='2'><strong>Mensagem:</strong></td>
                        </tr>
                        <tr>
                            <td colspan='2'>{mensagem}</td>
                        </tr>
                    </table>
                    <hr>
                    <p style='color: #666; font-size: 12px;'>
                        Mensagem enviada automaticamente pelo site Dzutchaoz Softwares Co
                    </p>
                </body>
                </html>";

                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.Normal;

                // Configurar SMTP
                SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort);
                smtpClient.Credentials = new System.Net.NetworkCredential(smtpUsername, smtpPassword);
                smtpClient.EnableSsl = enableSsl;
                smtpClient.Timeout = 10000; // 10 segundos

                // Enviar email
                smtpClient.Send(mail);

                return true;
            }
            catch (Exception ex)
            {
                // Log do erro (você pode adicionar logging aqui)
                System.Diagnostics.Debug.WriteLine(@"Erro ao enviar email: " + ex.Message);
                throw;
            }
        }

        private void LimparFormulario()
        {
            txtNome.Text = "";
            txtEmail.Text = "";
            ddlAssunto.SelectedIndex = 0;
            txtMensagem.Text = "";
        }
    }
}