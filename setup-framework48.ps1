# setup-framework48.ps1 - Configura ambiente .NET Framework 4.8
Write-Host "=== CONFIGURANDO .NET FRAMEWORK 4.8 ===" -ForegroundColor Cyan

# 1. Verifica instalação do .NET Framework 4.8
Write-Host "`n1. Verificando .NET Framework 4.8..." -ForegroundColor Yellow
$netfxPath = "C:\Windows\Microsoft.NET\Framework\v4.0.30319"

if (Test-Path $netfxPath) {
    Write-Host "✅ .NET Framework encontrado em: $netfxPath" -ForegroundColor Green
} else {
    Write-Host "❌ .NET Framework 4.8 não encontrado!" -ForegroundColor Red
    Write-Host "Instale o Developer Pack:" -ForegroundColor Yellow
    Write-Host "https://dotnet.microsoft.com/download/dotnet-framework/net48" -ForegroundColor Blue
    exit 1
}

# 2. Configura variáveis de ambiente
Write-Host "`n2. Configurando variáveis de ambiente..." -ForegroundColor Yellow
$env:MSBuildExtensionsPath = "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild"
$env:MSBuildSDKsPath = "$env:MSBuildExtensionsPath\Sdks"
$env:MSBuildToolsPath = "$netfxPath"

# Adiciona ao PATH do usuário
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$netfxPath*") {
    [Environment]::SetEnvironmentVariable("Path", "$netfxPath;$userPath", "User")
    Write-Host "✅ Adicionado ao PATH do usuário" -ForegroundColor Green
}

# 3. Configura VS Code
Write-Host "`n3. Configurando VS Code..." -ForegroundColor Yellow

$vscodeSettings = @'
{
    "omnisharp.useModernNet": false,
    "omnisharp.msbuildDotnetPath": "C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319",
    "omnisharp.sdkAutoDetection": false,
    "omnisharp.useGlobalMono": "never",
    "csharp.suppressDotnetInstallWarning": true,
    "csharp.suppressDotnetRestoreNotification": true,
    "dotnet.defaultSolution": "Site.sln"
}
'@

# Cria pasta .vscode
if (-not (Test-Path ".vscode")) {
    New-Item -ItemType Directory -Path ".vscode" -Force | Out-Null
}

Set-Content -Path ".vscode/settings.json" -Value $vscodeSettings -Encoding UTF8
Write-Host "✅ settings.json configurado" -ForegroundColor Green

# 4. Cria tasks.json para build
Write-Host "`n4. Criando tasks de build..." -ForegroundColor Yellow

$tasksJson = @'
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Build .NET Framework 4.8",
            "type": "shell",
            "command": "C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\MSBuild.exe",
            "args": [
                "Site.csproj",
                "/p:Configuration=Release",
                "/p:Platform=\"Any CPU\"",
                "/verbosity:minimal"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher": "$msCompile",
            "presentation": {
                "reveal": "always"
            }
        },
        {
            "label": "Clean",
            "type": "shell",
            "command": "C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\MSBuild.exe",
            "args": [
                "Site.csproj",
                "/t:Clean"
            ],
            "group": "build"
        }
    ]
}
'@

Set-Content -Path ".vscode/tasks.json" -Value $tasksJson -Encoding UTF8
Write-Host "✅ tasks.json configurado" -ForegroundColor Green

# 5. Cria script de build simples
Write-Host "`n5. Criando scripts de build..." -ForegroundColor Yellow

$buildCmd = @'
@echo off
echo Compilando com .NET Framework 4.8...
echo.

set MSBUILD="C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"

%MSBUILD% Site.csproj /p:Configuration=Release /verbosity:minimal

if %errorlevel% equ 0 (
    echo.
    echo ✅ Compilacao bem-sucedida!
    echo.
    echo Arquivos gerados em: bin\Release\
) else (
    echo.
    echo ❌ Falha na compilacao
)

pause
'@

Set-Content -Path "build.cmd" -Value $buildCmd -Encoding ASCII
Write-Host "✅ build.cmd criado" -ForegroundColor Green

# 6. Testa configuração
Write-Host "`n6. Testando configuração..." -ForegroundColor Yellow

# Testa MSBuild
try {
    $msbuildTest = & "$netfxPath\MSBuild.exe" /version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ MSBuild funcionando" -ForegroundColor Green
    } else {
        Write-Host "⚠️  MSBuild com problemas" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ MSBuild não funcionou: $_" -ForegroundColor Red
}

Write-Host "`n=== CONFIGURAÇÃO COMPLETA! ===" -ForegroundColor Green
Write-Host "`nPróximos passos:" -ForegroundColor Cyan
Write-Host "1. Feche e reabra o VS Code" -ForegroundColor Yellow
Write-Host "2. Pressione Ctrl+Shift+P -> 'Developer: Reload Window'" -ForegroundColor Yellow
Write-Host "3. Pressione Ctrl+Shift+B para compilar" -ForegroundColor Yellow
Write-Host "4. Ou execute .\build.cmd no terminal" -ForegroundColor Yellow
Write-Host "`nSe tiver problemas, execute Ctrl+Shift+P -> 'OmniSharp: Restart OmniSharp'" -ForegroundColor Magenta