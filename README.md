🌐 Dzutchaoz Softwares Co - Terminal Website
https://img.shields.io/badge/.NET%2520Framework-4.8-512BD4?logo=dotnet
https://img.shields.io/badge/ASP.NET-Web%2520Forms-5C2D91?logo=asp.net
https://img.shields.io/badge/license-Proprietary-blue
https://img.shields.io/badge/status-Production%2520Ready-brightgreen

Fábrica de softwares e outsourcing com uma interface inspirada em terminais de linha de comando

https://via.placeholder.com/800x450/0a0a0a/20c20e?text=Dzutchaoz+Softwares+Co+Terminal+Interface

✨ Características
🎨 Tema Terminal Hacker - Interface inspirada em terminais com efeitos visuais

📧 Formulário de Contato Funcional - Envio de e-mails com validação

⚡ Performance Otimizada - Compilado com .NET Framework 4.8

📱 Responsivo - Adaptável a dispositivos móveis e desktop

🔒 Seguro - Validação de entrada e proteção contra ataques básicos

🎭 Efeitos Visuais - Texto animado, brilho e cursor piscante

🚀 Começando
Pré-requisitos
Windows 10/11 ou Server 2016+

.NET Framework 4.8 Developer Pack

IIS Express ou IIS Local

Git (para versionamento)

Instalação Rápida
powershell

# 1. Clone o repositório

git clone https://github.com/dzutchaoz/site-terminal.git
cd site-terminal

# 2. Compile o projeto

.\build.cmd

# 3. Inicie o servidor local

.\start-iis.cmd
Acesse: http://localhost:8080/Default.aspx

🏗️ Estrutura do Projeto

site/
├── 📁 .vscode/ # Configurações do VS Code
├── 📁 bin/ # Binários compilados
│ ├── Site.dll ✅ Versionado
│ └── Site.pdb ✅ Versionado
├── 📁 css/ # Estilos
│ └── styles.css # Tema terminal
├── 📁 js/ # Scripts
│ └── script.js # Animações e lógica
├── 📁 publish/ # Build para produção
├── 📄 Default.aspx # Página principal
├── 📄 Contato.aspx # Formulário de contato
├── 📄 Site.csproj # Projeto .NET
├── 📄 Web.config # Configurações
├── 📄 build.cmd # Script de compilação
├── 📄 start-iis.cmd # Iniciar servidor
└── 📄 README.md # Este arquivo

🔧 Desenvolvimento
Compilação
powershell

# Compilar em modo Release

.\build.cmd

# Ou usar MSBuild diretamente

msbuild Site.csproj /p:Configuration=Release
Execução Local
powershell

# Opção 1: Usando script (recomendado)

.\start-iis.cmd

# Opção 2: IIS Express manual

& "C:\Program Files\IIS Express\iisexpress.exe" /path:"publish" /port:8080
URLs de Desenvolvimento
Página Principal: http://localhost:8080/Default.aspx

Formulário: http://localhost:8080/Contato.aspx

API de Contato: Processamento via Contato.aspx.cs

📧 Funcionalidade de Contato
O formulário de contato inclui:

✅ Validação de campos obrigatórios

✅ Validação de formato de e-mail

✅ Envio via SMTP com SSL/TLS

✅ Feedback visual ao usuário

✅ Proteção contra spam básico

Configuração de E-mail
Edite Web.config para configurar seu servidor SMTP:

xml
<appSettings>
<add key="SmtpServer" value="smtp.seuservidor.com" />
<add key="SmtpPort" value="587" />
<add key="SmtpUsername" value="seu@email.com" />
<add key="SmtpPassword" value="sua_senha" />
<add key="EmailTo" value="contato@dzutchaoz.com.br" />
</appSettings>
🎨 Personalização
Cores do Tema Terminal
css
:root {
--terminal-green: #20c20e; /_ Verde principal _/
--terminal-green-light: #4cd137; /_ Verde claro _/
--terminal-green-dark: #0fa015; /_ Verde escuro _/
--terminal-bg: #0a0a0a; /_ Fundo preto _/
--terminal-text: #20c20e; /_ Texto verde _/
}
Efeitos Disponíveis
Digitação Animada - Texto aparece caractere por caractere

Brilho Neon - Efeito glow em links e texto importante

Cursor Piscante - Cursor estilo terminal

Scanlines - Efeito de monitor CRT (opcional)

🐛 Solução de Problemas
Erros Comuns
Problema Solução
"Could not load type 'Site.Default'" Recompile com .\build.cmd e reinicie IIS
Erro de certificado SMTP Configure ValidationSettings:UnobtrusiveValidationMode ou instale certificado
Acentos mal renderizados Verifique encoding UTF-8 no Web.config
Formulário não envia Confira configurações SMTP no Web.config
Comandos de Depuração
powershell

# Verificar compilação

.\build.cmd

# Limpar e recompilar

msbuild Site.csproj /t:Clean,Rebuild

# Testar servidor SMTP (PowerShell)

Test-NetConnection smtp.seuservidor.com -Port 587
📦 Deploy para Produção
Método 1: IIS Local
powershell

# 1. Compilar para produção

.\build.cmd

# 2. Copiar para pasta do IIS

Copy-Item -Path "publish\*" -Destination "C:\inetpub\wwwroot\dzutchaoz\" -Recurse
Método 2: Hospedagem Windows
Compacte a pasta publish\

Faça upload via FTP/Plesk

Configure pool de aplicação para .NET 4.8

Aponte para Default.aspx como documento padrão

🤝 Contribuição
Este é um projeto proprietário da Dzutchaoz Softwares Co. Para relatar bugs ou sugerir melhorias:

Verifique os issues existentes

Crie um novo issue com detalhes do problema

Para contribuições internas, siga o fluxo de branching da empresa

📄 Licença
Copyright © 2024 Dzutchaoz Softwares Co. Todos os direitos reservados.

Este software é de propriedade da Dzutchaoz Softwares Co e não pode ser redistribuído, modificado ou comercializado sem autorização expressa.

📞 Contato
Dzutchaoz Softwares Co
📧 contato@dzutchaoz.com.br
🌐 https://dzutchaoz.com.br

"Transformando linhas de código em soluções de negócio" 🚀

Última atualização: $(Get-Date -Format 'dd/MM/yyyy')
