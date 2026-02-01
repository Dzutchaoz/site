document.addEventListener('DOMContentLoaded', function() {
    // Configurações
    const targetText = "Bem vindo ao nosso site! Em que podemos ajudá-lo?";
    const typingSpeed = 150; // ms por caractere (padrão)
    let currentSpeed = typingSpeed;
    let isTyping = false;
    let isMatrixActive = false;
    let startTime;
    
    // Elementos
    const typedTextElement = document.getElementById('typed-text');
    const cursorElement = document.getElementById('cursor');
    const currentTimeElement = document.getElementById('currentTime');
    const executionTimeElement = document.getElementById('executionTime');
    const charCountElement = document.getElementById('charCount');
    const cpuLoadElement = document.getElementById('cpuLoad');
    const memoryLoadElement = document.getElementById('memoryLoad');
    const powerStatusElement = document.getElementById('powerStatus');
    
    // Botões
    const restartBtn = document.getElementById('restartBtn');
    const speedUpBtn = document.getElementById('speedUpBtn');
    const speedDownBtn = document.getElementById('speedDownBtn');
    const matrixBtn = document.getElementById('matrixBtn');
    
    // Linhas que aparecem depois
    const line1 = document.getElementById('line1');
    const line2 = document.getElementById('line2');
    const line3 = document.getElementById('line3');
    const line4 = document.getElementById('line4');
    
    // Atualizar relógio em tempo real
    function updateClock() {
        const now = new Date();
        const timeString = now.toLocaleTimeString('pt-BR', {hour12: false});
        currentTimeElement.textContent = timeString;
    }
    
    // Simular carga do sistema
    function updateSystemStats() {
        const loads = ['SYS', 'INIT', 'RUN', 'IDLE', 'LOAD'];
        const memories = ['64K', '128K', '256K', '512K', '1MB'];
        const statuses = ['ONLINE', 'STANDBY', 'ACTIVE'];
        
        // Alterar aleatoriamente a cada 3-8 segundos
        setInterval(() => {
            if (!isTyping) return;
            
            cpuLoadElement.textContent = loads[Math.floor(Math.random() * loads.length)];
            memoryLoadElement.textContent = memories[Math.floor(Math.random() * memories.length)];
            powerStatusElement.textContent = statuses[Math.floor(Math.random() * statuses.length)];
        }, 3000 + Math.random() * 5000);
    }
    
    // Efeito de digitação
    function typeText(text, speed) {
        if (isTyping) return;
        
        isTyping = true;
        startTime = new Date();
        
        // Resetar elementos
        typedTextElement.textContent = '';
        cursorElement.style.visibility = 'visible';
        
        // Esconder linhas extras
        [line1, line2, line3, line4].forEach(line => {
            line.classList.add('hidden');
            line.style.opacity = '0';
        });
        
        // Digitar caractere por caractere
        let charIndex = 0;
        
        function typeChar() {
            if (charIndex < text.length) {
                // Som de digitação (opcional - descomente se quiser)
                // playTypeSound();
                
                typedTextElement.textContent += text.charAt(charIndex);
                charIndex++;
                
                // Atualizar contador de caracteres
               // charCountElement.textContent = charIndex;
                
                // Delay para próximo caractere
                setTimeout(typeChar, speed);
            } else {
                // Texto completo
                finishTyping();
            }
        }
        
        // Iniciar digitação
        typeChar();
    }
    
    // Quando a digitação terminar
    function finishTyping() {
        isTyping = false;
        
        // Calcular tempo de execução
        const endTime = new Date();
        const elapsedTime = (endTime - startTime) / 1000;
       // executionTimeElement.textContent = elapsedTime.toFixed(2);
        
        // Mostrar linhas extras com atraso
        setTimeout(() => {
            line1.classList.remove('hidden');
            setTimeout(() => {
                line1.style.opacity = '1';
            }, 10);
        }, 500);
        
        setTimeout(() => {
            line2.classList.remove('hidden');
            setTimeout(() => {
                line2.style.opacity = '1';
            }, 10);
        }, 1000);
        
        setTimeout(() => {
            line3.classList.remove('hidden');
            setTimeout(() => {
                line3.style.opacity = '1';
            }, 10);
        }, 1500);
        
        setTimeout(() => {
            line4.classList.remove('hidden');
            setTimeout(() => {
                line4.style.opacity = '1';
            }, 10);
        }, 2000);
        
        // Efeito de brilho no texto completo
        typedTextElement.style.animation = 'glow 2s ease-in-out';
        setTimeout(() => {
            typedTextElement.style.animation = '';
        }, 2000);
    }
    
    // Som de digitação (simulado com Web Audio API)
    function playTypeSound() {
        try {
            const audioContext = new (window.AudioContext || window.webkitAudioContext)();
            const oscillator = audioContext.createOscillator();
            const gainNode = audioContext.createGain();
            
            oscillator.connect(gainNode);
            gainNode.connect(audioContext.destination);
            
            oscillator.frequency.value = 800 + Math.random() * 400;
            oscillator.type = 'sine';
            
            gainNode.gain.setValueAtTime(0.1, audioContext.currentTime);
            gainNode.gain.exponentialRampToValueAtTime(0.01, audioContext.currentTime + 0.1);
            
            oscillator.start(audioContext.currentTime);
            oscillator.stop(audioContext.currentTime + 0.1);
        } catch (e) {
            // Fallback silencioso se Audio API não estiver disponível
        }
    }
    
    // Efeito Matrix (chuva de código)
    function toggleMatrixEffect() {
        const terminalBody = document.querySelector('.terminal-body');
        
        if (!isMatrixActive) {
            // Ativar efeito Matrix
            terminalBody.classList.add('matrix-effect');
            matrixBtn.innerHTML = '<i class="fas fa-times"></i> Parar Matrix';
            
            // Adicionar caracteres caindo
            startMatrixRain();
            isMatrixActive = true;
        } else {
            // Desativar efeito Matrix
            terminalBody.classList.remove('matrix-effect');
            matrixBtn.innerHTML = '<i class="fas fa-rainbow"></i> Efeito Matrix';
            stopMatrixRain();
            isMatrixActive = false;
        }
    }
    
    // Chuva de caracteres Matrix
    let matrixInterval;
    
    function startMatrixRain() {
        const terminalBody = document.querySelector('.terminal-body');
        
        matrixInterval = setInterval(() => {
            // Criar um caractere caindo
            const char = document.createElement('div');
            char.className = 'matrix-char';
            char.textContent = String.fromCharCode(0x30A0 + Math.random() * 96);
            char.style.position = 'absolute';
            char.style.left = Math.random() * 100 + '%';
            char.style.top = '-20px';
            char.style.color = '#20c20e';
            char.style.fontSize = '18px';
            char.style.opacity = '0.7';
            char.style.zIndex = '0';
            char.style.textShadow = '0 0 8px rgba(32, 194, 14, 0.8)';
            char.style.animation = `matrixFall ${2 + Math.random() * 3}s linear forwards`;
            
            terminalBody.appendChild(char);
            
            // Remover após animação
            setTimeout(() => {
                if (char.parentNode) {
                    char.parentNode.removeChild(char);
                }
            }, 5000);
        }, 50);
    }
    
    function stopMatrixRain() {
        clearInterval(matrixInterval);
        
        // Remover todos os caracteres Matrix
        document.querySelectorAll('.matrix-char').forEach(char => {
            if (char.parentNode) {
                char.parentNode.removeChild(char);
            }
        });
    }
    
    // CSS para animação da chuva Matrix
    const matrixStyle = document.createElement('style');
    matrixStyle.textContent = `
        @keyframes matrixFall {
            to {
                transform: translateY(100vh);
                opacity: 0;
            }
        }
    `;
    document.head.appendChild(matrixStyle);
    
    // Event Listeners
    // restartBtn.addEventListener('click', () => {
    //     // Parar efeito Matrix se ativo
    //     if (isMatrixActive) {
    //         toggleMatrixEffect();
    //     }
        
    //     // Resetar velocidade
    //     currentSpeed = typingSpeed;
        
    //     // Reiniciar digitação
    //     typeText(targetText, currentSpeed);
    // });
    
    // speedUpBtn.addEventListener('click', () => {
    //     if (isTyping) {
    //         currentSpeed = Math.max(30, currentSpeed / 2);
    //         speedUpBtn.innerHTML = `<i class="fas fa-forward"></i> Acelerar (${typingSpeed/currentSpeed}x)`;
    //     }
    // });
    
    // speedDownBtn.addEventListener('click', () => {
    //     if (isTyping) {
    //         currentSpeed = Math.min(500, currentSpeed * 2);
    //         speedDownBtn.innerHTML = `<i class="fas fa-backward"></i> Desacelerar (${typingSpeed/currentSpeed}x)`;
    //     }
    // });
    
   // matrixBtn.addEventListener('click', toggleMatrixEffect);
    
    // Inicialização
    function init() {
        // Iniciar relógio
        updateClock();
        setInterval(updateClock, 1000);
        
        // Iniciar estatísticas do sistema
        updateSystemStats();
        
        // Iniciar digitação após 1.5 segundos
        setTimeout(() => {
            typeText(targetText, currentSpeed);
        }, 2000);
    }
    
    // Iniciar tudo
    init();
});