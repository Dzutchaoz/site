<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contato.aspx.cs" 
    Inherits="Site.Contato" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contato - Dzutchaoz Softwares Co</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Code+Pro:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .terminal-form {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .terminal-label {
            display: block;
            color: #20c20e;
            margin-bottom: 5px;
            font-weight: 600;
        }
        
        .terminal-input, .terminal-select, .terminal-textarea {
            background-color: #0a0a0a;
            border: 1px solid #333;
            color: #20c20e;
            font-family: 'Source Code Pro', monospace;
            padding: 10px 15px;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
            max-width: 100%;
        }
        
        .terminal-input:focus, .terminal-select:focus, .terminal-textarea:focus {
            outline: none;
            border-color: #20c20e;
            box-shadow: 0 0 10px rgba(32, 194, 14, 0.3);
        }
        
        .terminal-textarea {
            min-height: 150px;
            resize: vertical;
        }
        
        .terminal-btn-submit {
            background-color: #1a1a1a;
            color: #20c20e;
            border: 1px solid #333;
            padding: 12px 24px;
            border-radius: 4px;
            font-family: 'Source Code Pro', monospace;
            font-size: 16px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s;
        }
        
        .terminal-btn-submit:hover {
            background-color: #222;
            border-color: #4cd137;
            box-shadow: 0 0 15px rgba(76, 209, 55, 0.3);
        }
        
        .terminal-btn-submit:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }
        
        .message {
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            font-weight: 600;
        }
        
        .message.success {
            background-color: rgba(76, 209, 55, 0.1);
            border: 1px solid #4cd137;
            color: #4cd137;
        }
        
        .message.error {
            background-color: rgba(255, 95, 87, 0.1);
            border: 1px solid #ff5f57;
            color: #ff5f57;
        }
        
        .validation-error {
            color: #ff5f57;
            font-size: 14px;
            margin-top: 5px;
            display: block;
        }
        
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #20c20e;
            text-decoration: none;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="terminal">
            <div class="terminal-header">
                <div class="terminal-title">
                    <i class="fas fa-envelope"></i> Formulário de Contato
                </div>
                <div class="terminal-time" id="currentTime">--:--:--</div>
            </div>
            
            <div class="terminal-body">
                <div class="terminal-form">
                    <% if (!string.IsNullOrEmpty(Message))
                       { %>
                        <div class="message <%= MessageClass %>">
                            <i class="fas <%= MessageIcon %>"></i> <%= Message %>
                        </div>
                    <% } %>
                    
                    <form id="formContato" runat="server" method="post">
                        <div class="form-group">
                            <label class="terminal-label" for="txtNome">Nome:</label>
                            <asp:TextBox ID="txtNome" runat="server" CssClass="terminal-input" 
                                placeholder="Seu nome completo" required="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNome" runat="server" 
                                ControlToValidate="txtNome" ErrorMessage="Nome é obrigatório"
                                CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        
                        <div class="form-group">
                            <label class="terminal-label" for="txtEmail">Email:</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="terminal-input" 
                                placeholder="seu@email.com" TextMode="Email" required="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="Email é obrigatório"
                                CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                ControlToValidate="txtEmail" ErrorMessage="Email inválido"
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                CssClass="validation-error" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        
                        <div class="form-group">
                            <label class="terminal-label" for="ddlAssunto">Assunto:</label>
                            <asp:DropDownList ID="ddlAssunto" runat="server" CssClass="terminal-select">
                                <asp:ListItem Value="Contato via Site">Contato geral</asp:ListItem>
                                <asp:ListItem Value="Orçamento">Solicitar orçamento</asp:ListItem>
                                <asp:ListItem Value="Suporte">Suporte técnico</asp:ListItem>
                                <asp:ListItem Value="Parceria">Proposta de parceria</asp:ListItem>
                                <asp:ListItem Value="Outro">Outro assunto</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        
                        <div class="form-group">
                            <label class="terminal-label" for="txtMensagem">Mensagem:</label>
                            <asp:TextBox ID="txtMensagem" runat="server" CssClass="terminal-textarea" 
                                placeholder="Digite sua mensagem aqui..." TextMode="MultiLine" 
                                Rows="6" required="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMensagem" runat="server" 
                                ControlToValidate="txtMensagem" ErrorMessage="Mensagem é obrigatória"
                                CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        
                        <div class="form-group">
                            <asp:Button ID="btnEnviar" runat="server" Text="Enviar Mensagem" 
                                CssClass="terminal-btn-submit" OnClick="btnEnviar_Click" />
                            <asp:Button ID="btnLimpar" runat="server" Text="Limpar" 
                                CssClass="terminal-btn-submit" OnClick="btnLimpar_Click" 
                                CausesValidation="false" />
                        </div>
                        
                        <div class="form-group">
                            <a href="Default.aspx" class="back-link">
                                <i class="fas fa-arrow-left"></i> Voltar para o site
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script src="js/script.js"></script>
    <script>
        // Atualizar relógio
        function updateClock() {
            const now = new Date();
            const timeString = now.toLocaleTimeString('pt-BR', {hour12: false});
            const timeElement = document.getElementById('currentTime');
            if (timeElement) {
                timeElement.textContent = timeString;
            }
        }
        
        setInterval(updateClock, 1000);
        updateClock();
    </script>
</body>
</html>