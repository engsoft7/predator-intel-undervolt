# Predator Intel Undervolt

Script automático para instalação e configuração do **intel-undervolt** em notebooks Acer Predator Helios 300 usando Linux.

O objetivo é reduzir temperatura e consumo do processador através de undervolt, mantendo estabilidade do sistema.

## Hardware testado

- Notebook: Acer Predator Helios 300 G3-572
- Processador: Intel Core i7-7700HQ
- GPU: NVIDIA GTX 1060
- Sistema: Parrot OS / Debian Linux

## Configuração aplicada

| Componente | Valor |
|------------|-------|
| CPU | -120 mV |
| CPU Cache | -120 mV |
| GPU | -50 mV |
| System Agent | 0 mV |
| Analog I/O | 0 mV |

## Instalação automática

Clone o repositório:

```bash
git clone https://github.com/engsoft7/predator-intel-undervolt.git
