Aqui está um exemplo de um arquivo `README.md` para descrever essa atividade de normalização e organização do banco de dados de livros:

---

# Biblioteca de Livros - Sistema de Banco de Dados

Este projeto implementa uma pequena biblioteca de livros em um sistema de banco de dados relacional, aplicando princípios de normalização para organizar e estruturar os dados de forma eficiente e evitar redundâncias. 

## Estrutura do Projeto

O projeto envolve a criação de três tabelas:

1. **Autores**: Armazena os nomes dos autores.
2. **Editoras**: Armazena os nomes das editoras.
3. **Livros**: Contém informações detalhadas dos livros, como título, ano de publicação, ISBN, e referências ao autor e à editora.

Ao organizar as informações sobre autores e editoras em tabelas separadas, garantimos uma base de dados normalizada e evitamos duplicação desnecessária.

## Instruções para Executar o Script

### 1. Criação das Tabelas

O primeiro passo do script é a criação das tabelas, definindo as relações e garantindo a integridade dos dados com chaves primárias e estrangeiras.

- **Autores**: Contém `autor_id` (chave primária) e `nome`.
- **Editoras**: Contém `editora_id` (chave primária) e `nome`.
- **Livros**: Contém `livros_id` (chave primária com `AUTO_INCREMENT`), `titulo`, `ano_publicacao`, `isbn`, e as chaves estrangeiras `autor_id` e `editora_id` para referenciar os autores e editoras.

### 2. Inserção de Dados

O script inclui as seguintes etapas para inserir dados iniciais:

- **Inserção de Autores e Editoras**: Para garantir que cada autor e editora exista apenas uma vez na base de dados, utilizamos `ON DUPLICATE KEY UPDATE nome=nome`. Isso impede a inserção de registros duplicados.
- **Inserção de Livros**: Para cada livro, usamos subconsultas `SELECT` para obter o `autor_id` e `editora_id` correspondentes ao autor e à editora do livro, mantendo a integridade referencial.

### 3. Script Completo

Aqui está o script completo do projeto:

```sql
-- 1. Criação das tabelas (caso ainda não existam)
CREATE TABLE IF NOT EXISTS Autores (
    autor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Editoras (
    editora_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Livros (
    livros_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    ano_publicacao INT,
    isbn VARCHAR(13),
    autor_id INT,
    editora_id INT,
    FOREIGN KEY (autor_id) REFERENCES Autores(autor_id),
    FOREIGN KEY (editora_id) REFERENCES Editoras(editora_id)
);

-- 2. Inserindo novos autores e editoras, se necessário
INSERT INTO Autores (nome) VALUES 
('João Guimarães Rosa'),
('Machado de Assis'),
('Graciliano Ramos'),
('Aluísio Azevedo'),
('Mário de Andrade')
ON DUPLICATE KEY UPDATE nome=nome;  -- Evita duplicações

INSERT INTO Editoras (nome) VALUES 
('Nova Fronteira'),
('Companhia das Letras'),
('Companhia Editora Nacional'),
('Martin Claret'),
('Penguin Companhia')
ON DUPLICATE KEY UPDATE nome=nome;  -- Evita duplicações

-- 3. Inserindo os novos livros
INSERT INTO Livros (titulo, ano_publicacao, isbn, autor_id, editora_id) VALUES 
('Grande Sertão: Veredas', 1956, '978-85-209-2325-1', 
    (SELECT autor_id FROM Autores WHERE nome = 'João Guimarães Rosa'), 
    (SELECT editora_id FROM Editoras WHERE nome = 'Nova Fronteira')),
    
('Memórias Póstumas de Brás Cubas', 1881, '9788535910663', 
    (SELECT autor_id FROM Autores WHERE nome = 'Machado de Assis'), 
    (SELECT editora_id FROM Editoras WHERE nome = 'Companhia das Letras')),
    
('Vidas Secas', 1938, '9788572326972', 
    (SELECT autor_id FROM Autores WHERE nome = 'Graciliano Ramos'), 
    (SELECT editora_id FROM Editoras WHERE nome = 'Companhia Editora Nacional')),
    
('O Alienista', 1882, '9788572327429', 
    (SELECT autor_id FROM Autores WHERE nome = 'Machado de Assis'), 
    (SELECT editora_id FROM Editoras WHERE nome = 'Martin Claret')),
    
('O Cortiço', 1890, '9788579027048', 
    (SELECT autor_id FROM Autores WHERE nome = 'Aluísio Azevedo'), 
    (SELECT editora_id FROM Editoras WHERE nome = 'Penguin Companhia')),
    
('Dom Casmurro', 1899, '9788583862093', 
    (SELECT autor_id FROM Autores WHERE nome = 'Machado de Assis'), 
    (SELECT editora_id FROM Editoras WHERE nome = 'Penguin Companhia')),
    
('Macunaíma', 1928, '9788503012302', 
    (SELECT autor_id FROM Autores WHERE nome = 'Mário de Andrade'), 
    (SELECT editora_id FROM Editoras WHERE nome = 'Companhia Editora Nacional'));
```

## Observações

- **Chaves Estrangeiras**: As referências de `autor_id` e `editora_id` em `Livros` garantem que não existam registros órfãos, ou seja, cada livro registrado terá um autor e uma editora válidos na base de dados.
- **Integridade dos Dados**: Este modelo segue as boas práticas de normalização de banco de dados, reduzindo redundâncias e organizando as informações em uma estrutura de fácil manutenção.

## Conclusão

Esse projeto é um exemplo de como normalizar um banco de dados simples e evitar problemas de duplicação e redundância. Com esta estrutura, é possível expandir a base de dados de forma organizada e eficiente.

--- 

Esse README explica o propósito, a estrutura e os detalhes da implementação do banco de dados para a biblioteca, oferecendo uma visão completa do projeto para futuros desenvolvedores.
