document.addEventListener('DOMContentLoaded', function() {
    // Configurações
    const targetText = "Bem vindo ao nosso site! Em que podemos ajudá-lo?";
    const typingSpeed = 120; // ms por caractere (padrão)
    let currentSpeed = typingSpeed;
    let isTyping = false;
    let isMatrixActive = false;
    let startTime;
    
    // Elementos
    const typedTextElement = document.getElementById('typed-text');
    const cursorElement = document.getElementById('cursor');
    const currentTimeElement = document.getElementById('currentTime');
    
    const cpuLoadElement = document.getElementById('cpuLoad');
    const memoryLoadElement = document.getElementById('memoryLoad');
    const powerStatusElement = document.getElementById('powerStatus');
    
    // Botões
    
    
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
                
                typedTextElement.textContent += text.charAt(charIndex);
                charIndex++;
                
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
    


    
    // Efeito Matrix (chuva de código)
    function toggleMatrixEffect() {
        const terminalBody = document.querySelector('.terminal-body');
        
    }
    
   
        
    // Inicialização
    function init() {
        // Iniciar relógio
        updateClock();
        setInterval(updateClock, 1000);
        
        // Iniciar estatísticas do sistema
        updateSystemStats();
        
        // Iniciar digitação após X segundos
        setTimeout(() => {
            typeText(targetText, currentSpeed);
        }, 2000);
    }
    
    // Iniciar tudo
    init();
});