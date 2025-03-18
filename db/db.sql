CREATE DATABASE loja_frutas;
USE loja_frutas;

-- Tabela de Usuários
CREATE TABLE usuarios (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          nome VARCHAR(100) NOT NULL,
                          email VARCHAR(100) UNIQUE NOT NULL,
                          senha VARCHAR(255) NOT NULL,
                          tipo ENUM('CLIENTE', 'ADMIN') DEFAULT 'CLIENTE',
                          data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Frutas (Produtos)
CREATE TABLE frutas (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        nome VARCHAR(150) NOT NULL,
                        descricao TEXT,
                        preco DECIMAL(10,2) NOT NULL,
                        estoque INT NOT NULL,
                        categoria ENUM('CÍTRICA', 'BAGA', 'DRUPA', 'TROPICAL', 'OUTRA') NOT NULL,
                        imagem_url VARCHAR(255),
                        data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Vendas
CREATE TABLE vendas (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        usuario_id INT NOT NULL,
                        data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        total DECIMAL(10,2) NOT NULL,
                        status ENUM('PENDENTE', 'PAGO', 'ENVIADO', 'ENTREGUE', 'CANCELADO') DEFAULT 'PENDENTE',
                        FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Tabela de Itens da Venda
CREATE TABLE itens_venda (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             venda_id INT NOT NULL,
                             fruta_id INT NOT NULL,
                             quantidade INT NOT NULL,
                             preco_unitario DECIMAL(10,2) NOT NULL,
                             subtotal DECIMAL(10,2) NOT NULL,
                             FOREIGN KEY (venda_id) REFERENCES vendas(id) ON DELETE CASCADE,
                             FOREIGN KEY (fruta_id) REFERENCES frutas(id) ON DELETE CASCADE
);

-- Tabela de Carrinho de Compras
CREATE TABLE carrinho (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          usuario_id INT NOT NULL,
                          fruta_id INT NOT NULL,
                          quantidade INT NOT NULL,
                          data_adicao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
                          FOREIGN KEY (fruta_id) REFERENCES frutas(id) ON DELETE CASCADE
);

-- Índices para otimizar buscas frequentes
CREATE INDEX idx_vendas_usuario ON vendas (usuario_id);
CREATE INDEX idx_itens_venda_venda ON itens_venda (venda_id);
CREATE INDEX idx_itens_venda_fruta ON itens_venda (fruta_id);

-- Adicionando alguns dados iniciais
INSERT INTO usuarios (nome, email, senha, tipo) VALUES
('João Silva', 'joao@exemplo.com', 'senha123', 'CLIENTE'),
('Maria Oliveira', 'maria@exemplo.com', 'senha456', 'CLIENTE'),
('Carlos Pereira', 'carlos@exemplo.com', 'senha789', 'ADMIN');
INSERT INTO frutas (nome, descricao, preco, estoque, categoria, imagem_url) VALUES
('Maçã', 'Fruta doce e crocante, rica em fibras e vitaminas, ideal para lanches e sobremesas.', 95.00, 100, 'OUTRA', 'uploads/maca.png'),
('Banana', 'Fruta rica em potássio, excelente para energia rápida e saúde muscular, perfeita para lanches e batidos.', 50.00, 150, 'TROPICAL', 'uploads/banana.png'),
('Laranja', 'Fruta cítrica e refrescante, cheia de vitamina C, ótima para sucos e fortalecer o sistema imunológico.', 75.00, 80, 'CÍTRICA', 'uploads/laranja.png'),
('Manga', 'Fruta tropical doce e suculenta, rica em antioxidantes, perfeita para sobremesas e batidos.', 120.00, 60, 'TROPICAL', 'uploads/manga.png'),
('Uva', 'Fruta pequena e doce, rica em antioxidantes, ideal para lanches e sobremesas.', 90.00, 200, 'BAGA', 'uploads/uva.png'),
('Goiaba', 'Fruta tropical rica em vitamina C e fibras, excelente para sucos e sobremesas.', 110.00, 50, 'OUTRA', 'uploads/goiaba.png');