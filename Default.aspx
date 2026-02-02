<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" 
Inherits="Site.Default" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dzutchaoz Softwares Co</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Code+Pro:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <!-- Tela do terminal -->
        <div class="terminal">
            <!-- Cabeçalho do terminal -->
            <div class="terminal-header">
                <div class="terminal-buttons">
                    <div class="terminal-btn close"></div>
                    <div class="terminal-btn minimize"></div>
                    <div class="terminal-btn maximize"></div>
                </div>
                <div class="terminal-title">
                    <i class="fas fa-terminal"></i> Terminal dZu v1.0
                </div>
                <div class="terminal-time" id="currentTime">--:--:--</div>
            </div>
            
            <!-- Conteúdo do terminal -->
            <div class="terminal-body">
                <div class="terminal-content">
                    <!-- Linha de comando inicial -->
                    <div class="terminal-line">
                        <span class="prompt">Dzutchaoz Softwares Co</span>
                    </div>
                    
                    <!-- Saída do sistema -->
                    <div class="terminal-line">
                        <span class="output">Fábrica de softwares e Outsourcing</span>
                    </div>
                    
                    <div class="terminal-line">
                        <span class="output"></span>
                    </div>
                    
                    <div class="terminal-line">
                        <span class="output"></span>
                    </div>
                    
                    <div class="terminal-line">
                        <span class="output">▌</span>
                    </div>
                    
                    <!-- Texto animado -->
                    <div class="terminal-line typing-container">
                        <span class="prompt">>></span>
                        <span class="typing-text" id="typed-text"></span>
                        <span class="cursor" id="cursor">█</span>
                    </div>
                    
                    <!-- Linhas adicionais que aparecem depois -->
                    <div class="terminal-line hidden" id="line1">
                        <span class="output success">✓ Fábrica de softwares</span>
                    </div>

                   <div class="terminal-line hidden" id="line2">
                        <span class="output success">✓ Outsourcing</span>
                    </div>

                    <div class="terminal-line hidden" id="line3">
                        <span class="output success">✓ Consultoria</span>
                    </div>

                    <div class="terminal-line hidden" id="line4">
                        <span class="output success">✓ Sustentação e melhorias</span>
                    </div>

                    <div class="terminal-line hidden" id="line5"><span class="output success">✓ <a href="Contato.aspx" class="command-link">Fale conosco.</a> Nos envie uma mensagem</span>
                        
                    </div>
                    
                    <!-- Link para contato 
                    <div class="terminal-line" style="margin-top: 40px;">
                        <span class="prompt">>></span>
                        <span class="output">
                            Contato <a href="Contato.aspx" class="command-link">Fale conosco.</a> Nos envie uma mensagem
                        </span>
                    </div>-->
                </div>
            </div>
            
            <!-- Status bar -->
            <div class="terminal-status">
                <div class="status-item">
                    <i class="fas fa-microchip"></i> <span id="cpuLoad">SYS</span>
                </div>
                <div class="status-item">
                    <i class="fas fa-memory"></i> <span id="memoryLoad">RAM</span>
                </div>
                <div class="status-item">
                    <i class="fas fa-bolt"></i> <span id="powerStatus">ONLINE</span>
                </div>
                <div class="status-item">
                    <i class="fas fa-keyboard"></i> <span>ASCII MODE</span>
                </div>
            </div>
        </div>
        
        <!-- Seção de contato -->
        <div class="contact-section">
           <div class="contact-link">
                <a href="Contato.aspx">
                    <i class="fas fa-envelope"></i> 
                    <span>contate-nos</span>
                </a>
            </div>
        </div>
    </div>
    
    <script src="js/script.js"></script>
</body>
</html>