# Predator Intel Undervolt

Script automático para instalação e configuração do **intel-undervolt** em notebooks Acer Predator Helios 300 usando Linux.

O objetivo é reduzir temperatura, consumo de energia e melhorar estabilidade térmica através de undervolt do processador.

---

## Hardware testado

- **Notebook:** Acer Predator Helios 300 G3-572
- **Processador:** Intel Core i7-7700HQ
- **GPU:** NVIDIA GTX 1060
- **Sistema operacional:** Parrot OS / Debian Linux

---

## Configuração aplicada

| Componente | Valor |
|---|---:|
| CPU | -120 mV |
| CPU Cache | -120 mV |
| GPU | -50 mV |
| System Agent | 0 mV |
| Analog I/O | 0 mV |

---

# Instalação

Clone o repositório:

```bash
git clone https://github.com/engsoft7/predator-intel-undervolt.git
```

Entre na pasta:

```bash
cd predator-intel-undervolt
```

Dê permissão de execução ao script:

```bash
chmod +x instalar-undervolt.sh
```

Execute o instalador:

```bash
sudo ./instalar-undervolt.sh
```

---

# O que o script faz

O instalador executa automaticamente:

- Instala dependências necessárias
- Baixa o código fonte do intel-undervolt
- Compila e instala o programa
- Cria o arquivo de configuração
- Aplica os valores de undervolt
- Cria serviço systemd
- Ativa aplicação automática no boot

---

# Verificar undervolt

Depois da instalação:

```bash
sudo intel-undervolt read
```

Resultado esperado:

```
CPU (0): -120.12 mV
GPU (1): -49.80 mV
CPU Cache (2): -120.12 mV
System Agent (3): -0.00 mV
Analog I/O (4): -0.00 mV
```

---

# Serviço automático no boot

Verifique o serviço:

```bash
systemctl status intel-undervolt
```

Resultado esperado:

```
Active: active (exited)
status=0/SUCCESS
```

O undervolt será aplicado automaticamente sempre que o sistema iniciar.

---

# Após instalar em um novo sistema

Reinicie:

```bash
sudo reboot
```

Depois confirme:

```bash
sudo intel-undervolt read
```

Os valores devem permanecer aplicados.

---

# Alterar valores de undervolt

Edite:

```bash
sudo nano /etc/intel-undervolt.conf
```

Exemplo:

```
undervolt 0 'CPU' -120
undervolt 1 'GPU' -50
undervolt 2 'CPU Cache' -120
undervolt 3 'System Agent' 0
undervolt 4 'Analog I/O' 0
```

Valores maiores podem causar:

- Travamentos
- Tela preta
- Reinicializações
- Instabilidade do sistema

Faça testes antes de aumentar o undervolt.

---

# Monitoramento de temperatura

Instale sensores:

```bash
sudo apt install lm-sensors
```

Monitorar:

```bash
watch -n 2 sensors
```

---

# Teste de estabilidade

Instale:

```bash
sudo apt install stress-ng
```

Execute:

```bash
stress-ng --cpu 8 --timeout 10m
```

Verifique se o sistema permanece estável.

---

# Compatibilidade

Testado em:

✅ Acer Predator Helios 300 G3-572  
✅ Intel Core i7-7700HQ  
✅ Linux Debian / Parrot OS  

Outros processadores Intel podem precisar de valores diferentes.

---

# Autor

**engsoft7**

GitHub:

https://github.com/engsoft7
