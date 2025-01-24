# Projeto de Banco de Dados - Oficina Mecânica

## Descrição
Este projeto consiste na modelagem e implementação de um banco de dados relacional para uma oficina mecânica. Ele foi desenvolvido como parte de um exercício prático para aprendizado em banco de dados, cobrindo desde a modelagem conceitual até a criação e manipulação do banco no MySQL.

O banco de dados gerencia informações de clientes, veículos, ordens de serviço, peças, serviços realizados e funcionários da oficina. Com ele, é possível organizar os dados de maneira eficiente, permitindo consultas e operações essenciais para o dia a dia de uma oficina.

---

## Estrutura do Banco de Dados

### Entidades e Relacionamentos
1. **Cliente**:
   - Armazena informações dos clientes, como nome, endereço e telefone.
   - Relacionamento: Um cliente pode possuir vários veículos (1:N).

2. **Veículo**:
   - Contém dados dos veículos, como placa, marca, modelo e ano.
   - Relacionamento: Cada veículo está associado a um cliente.

3. **Ordem de Serviço (OS)**:
   - Representa o registro de um serviço realizado em um veículo.
   - Relacionamento: Cada OS está vinculada a um cliente e a um veículo.

4. **Funcionário**:
   - Armazena informações dos funcionários da oficina, como nome, cargo e salário.
   - Relacionamento: Associado indiretamente às ordens de serviço através de serviços realizados.

5. **Serviço**:
   - Contém dados sobre os serviços oferecidos pela oficina, como descrição e preço.

6. **Peça**:
   - Armazena informações sobre peças disponíveis e seus valores unitários.

7. **OS_Servico**:
   - Tabela associativa para relacionar ordens de serviço e serviços realizados.
   - Relacionamento: Muitos para muitos (N:M).

8. **OS_Peca**:
   - Tabela associativa para relacionar ordens de serviço e peças utilizadas.
   - Relacionamento: Muitos para muitos (N:M).

---

## Tecnologias Utilizadas
- **MySQL**: Banco de dados relacional utilizado para implementar o projeto.
- **MySQL Workbench**: Ferramenta utilizada para modelagem, execução de scripts e consultas.
- **Markdown**: Para documentação do projeto no GitHub.

---

## Script do Banco de Dados
O banco de dados foi implementado com os seguintes passos:

1. **Criação do Banco de Dados**:
   - Banco nomeado como `OficinaMecanica`.

2. **Tabelas Criadas**:
   - `Cliente`, `Veiculo`, `Funcionario`, `Servico`, `OrdemServico`, `OS_Servico`, `Peca`, `OS_Peca`.

3. **Relacionamentos**:
   - Chaves estrangeiras foram configuradas para garantir a integridade referencial.
   - Tabelas associativas foram criadas para os relacionamentos muitos para muitos.

4. **População do Banco**:
   - Foram inseridos dados fictícios para testes e validação:
     - **3 Clientes**.
     - **3 Veículos**.
     - **3 Funcionários**.
     - **4 Serviços**.
     - **3 Ordens de Serviço**.
     - **Peças e serviços relacionados às OS**.

---

## Consultas de Exemplo
O banco permite consultas para responder perguntas como ex:
- Quais são os serviços realizados em uma determinada OS?
  
- SELECT 
    
    descricao AS servico,
    data_os AS OrdemServico,
    cl.Nome AS Cliente,
    ve.Placa AS Veiculo
FROM 
    Servico
JOIN 
    Cliente cl ON ID_Cliente = cl.ID_Cliente
JOIN 
    Veiculo ve ON ID_Veiculo = ve.ID_Veiculo
JOIN 
    OrdemServico ON ID_servico = ID_servico
WHERE 
    ID_os = ID_os;
- Quais peças foram utilizadas em uma OS específica?

  SELECT 
    
    p.descricao AS Peca,
    OS.id_os AS OS_Servico,
    cl.Nome AS Cliente,
    ve.Placa AS Veiculo
FROM 
    Servico
JOIN 
    Cliente cl ON ID_Cliente = cl.ID_Cliente
JOIN 
    Veiculo ve ON ID_Veiculo = ve.ID_Veiculo
JOIN 
    OS_Servico OS ON id_OS = id_OS
JOIN 
    Peca p ON id_peca = id_peca
WHERE 
    id_os = 2;

---

