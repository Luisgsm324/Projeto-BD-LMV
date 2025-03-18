# Projeto LMV - Sistema de Gerenciamento de Shopping  
**Repositório criado para a segunda etapa do projeto da disciplina de Banco de Dados no Centro de Informática da Universidade Federal de Pernambuco (UFPE)**  

## Integrantes do Grupo  
- Luis Moreira  
- Lucas Figueiredo  
- Vitor Mendonça  
- Mateus Guerra  

---

## Descrição do Projeto  

O projeto LMV é um sistema de gerenciamento de shopping desenvolvido como parte da disciplina de Banco de Dados no Centro de Informática da UFPE. O objetivo é criar um banco de dados que represente o "mini mundo" de um shopping, abrangendo entidades como lojas, fornecedores, empresas prestadoras de serviços, funcionários, veículos, registros de estacionamento, ativos, eventos e transações. O sistema visa garantir a integridade, eficiência e rastreabilidade das operações realizadas no shopping.  

---

## Contexto do Mini Mundo  

O shopping é composto por diversas entidades que interagem entre si para garantir seu funcionamento. Abaixo estão as principais entidades e suas características:  

### 1. **Lojas**  
- **ID único**: Identificador exclusivo da loja.  
- **Número da sala**: Localização da loja no shopping.  
- **CNPJ**: Identificação legal da empresa.  
- **Atributos**: Nome da empresa, telefone, e-mail, quantidade de funcionários, valor do aluguel e categoria (segmento de mercado).  
- **Transações**: As lojas enviam mensalmente uma transferência ao shopping referente ao aluguel do espaço.  

### 2. **Fornecedores**  
- **ID único**: Identificador exclusivo do fornecedor.  
- **CNPJ**: Identificação legal do fornecedor.  
- **Atributos**: Nome, telefone, e-mail.  
- **Função**: Fornecem insumos e produtos para as lojas e para a infraestrutura do shopping.  

### 3. **Empresas Prestadoras de Serviços**  
- **ID único**: Identificador exclusivo da empresa.  
- **CNPJ**: Identificação legal da empresa.  
- **Atributos**: Nome, telefone, e-mail, quantidade de funcionários, categoria dos serviços prestados.  
- **Função**: Prestam serviços como limpeza, segurança e manutenção. O shopping paga mensalmente por esses serviços.  

### 4. **Funcionários**  
- **ID único**: Identificador exclusivo do funcionário.  
- **CPF**: Identificação pessoal do funcionário.  
- **Atributos**: Nome, telefone, e-mail, função.  
- **Alocação**: Podem trabalhar em lojas, empresas terceirizadas ou diretamente no shopping.  

### 5. **Veículos**  
- **ID único**: Identificador exclusivo do veículo.  
- **Placa**: Identificação do veículo.  
- **Condutor**: Relacionamento com o funcionário ou cliente.  
- **Tipo**: Classificação do veículo.  
- **Registro de Estacionamento**: Geração de registros de entrada e saída, com cálculo do valor da estadia.  

### 6. **Registro de Estacionamento**  
- **ID único**: Identificador exclusivo do registro.  
- **Data e hora de entrada e saída**: Registro do tempo de permanência.  
- **Valor da estadia**: Calculado com base no tempo de permanência.  
- **Transação**: Relacionamento com a entidade "Transações" para pagamento da estadia.  

### 7. **Ativos**  
- **ID único**: Identificador exclusivo do ativo.  
- **Classificação, modelo, data de aquisição, valor**: Informações sobre o ativo.  
- **Fornecedor**: Relacionamento com a entidade "Fornecedores".  

### 8. **Eventos**  
- **ID único**: Identificador exclusivo do evento.  
- **Nome, data de início e término, descrição, localização**: Informações sobre o evento.  
- **Promoção**: Relacionamento com a entidade "Lojas".  

### 9. **Transações**  
- **ID único**: Identificador exclusivo da transação.  
- **Valores**: Bruto, líquido, desconto.  
- **Origem**: Identificação da origem da transação (ex.: aluguel, estacionamento).  
- **Tipo**: Crédito ou débito.  
- **Datas**: Data da transação e outras datas relacionadas.  

---

## Como Funcionam as Tabelas  

As tabelas do banco de dados foram projetadas para refletir as entidades e seus relacionamentos. Cada tabela possui chaves primárias e estrangeiras que garantem a integridade referencial e a consistência dos dados. As consultas e operações são otimizadas para garantir um desempenho eficiente.  

---

## Como Contribuir  

1. Clone o repositório:  
   ```bash  
   git clone https://github.com/Luisgsm324/Projeto-BD-LMV.git 
   ```  

2. Siga as instruções de instalação e configuração do banco de dados.  

3. Contribua com melhorias, correções ou novas funcionalidades.  

4. Envie um **pull request** para revisão.  

---
**Desenvolvido com amor pelo CIn** 💓