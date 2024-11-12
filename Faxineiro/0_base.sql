
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
