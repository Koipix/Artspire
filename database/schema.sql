-- =====================================================
-- ARTSPIRE DATABASE SCHEMA
-- Version: 0.1.0
-- =====================================================

-- -----------------------------------------------------
-- Table: users (base user account)
-- -----------------------------------------------------
CREATE TABLE users (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    email           VARCHAR(255) NOT NULL UNIQUE,
    password_hash   VARCHAR(255) NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
D
-- -----------------------------------------------------
-- Table: artists (artist profile linked to user)
-- -----------------------------------------------------
CREATE TABLE artists (D
    id              INT PRIMARY KEY AUTO_INCREMENT,
    user_id         INT NOT NULL UNIQUE,
    username        VARCHAR(100) NOT NULL UNIQUE,
    bio             TEXT,
    pfp_url         VARCHAR(500),
    custom_tos      TEXT,
    arts_count      INT DEFAULT 0,
    sold_count      INT DEFAULT 0,
    average_price   DECIMAL(10, 2) DEFAULT 0.00,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table: art_items (artwork/service listings)
-- -----------------------------------------------------
CREATE TABLE art_items (
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    artist_id           INT NOT NULL,
    title               VARCHAR(255) NOT NULL,
    description         TEXT,
    details             TEXT,
    image_url           VARCHAR(500),
    category            VARCHAR(100),
    status              ENUM('available', 'sold', 'pending', 'inactive') DEFAULT 'available',
    is_new_offer        BOOLEAN DEFAULT TRUE,
    price               DECIMAL(10, 2) NOT NULL,
    monetization_rate   DECIMAL(5, 2) DEFAULT 0.00,
    commercial_rate     DECIMAL(5, 2) DEFAULT 0.00,
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (artist_id) REFERENCES artists(id) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table: ratings (user ratings for art items)
-- -----------------------------------------------------
CREATE TABLE ratings (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    art_item_id     INT NOT NULL,
    user_id         INT NOT NULL,
    rating          DECIMAL(2, 1) NOT NULL CHECK (rating >= 0 AND rating <= 5),
    review          TEXT,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (art_item_id) REFERENCES art_items(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_rating (art_item_id, user_id)
);

-- -----------------------------------------------------
-- Table: conversations (chat threads between users)
-- -----------------------------------------------------
CREATE TABLE conversations (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    user1_id        INT NOT NULL,
    user2_id        INT NOT NULL,
    is_requested    BOOLEAN DEFAULT TRUE,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user1_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (user2_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_conversation (user1_id, user2_id)
);

-- -----------------------------------------------------
-- Table: messages (individual chat messages)
-- -----------------------------------------------------
CREATE TABLE messages (
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    conversation_id     INT NOT NULL,
    sender_id           INT NOT NULL,
    content             TEXT NOT NULL,
    is_read             BOOLEAN DEFAULT FALSE,
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (conversation_id) REFERENCES conversations(id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table: orders (purchase transactions)
-- -----------------------------------------------------
CREATE TABLE orders (
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    buyer_id            INT NOT NULL,
    art_item_id         INT NOT NULL,
    artist_id           INT NOT NULL,
    total_price         DECIMAL(10, 2) NOT NULL,
    stripe_payment_id   VARCHAR(255),
    status              ENUM('pending', 'paid', 'completed', 'cancelled', 'refunded') DEFAULT 'pending',
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (buyer_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (art_item_id) REFERENCES art_items(id) ON DELETE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES artists(id) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table: categories (art categories)
-- -----------------------------------------------------
CREATE TABLE categories (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(100) NOT NULL UNIQUE,
    description     TEXT,
    icon_url        VARCHAR(500),
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- VIEWS (for convenient data access)
-- =====================================================

-- View: art_items with artist info and ratings (matches Flutter ArtItem model)
CREATE VIEW v_art_items_full AS
SELECT 
    ai.id,
    ai.title,
    ai.description,
    ai.details,
    ai.image_url,
    ai.category,
    ai.status,
    ai.is_new_offer,
    ai.price,
    ai.monetization_rate,
    ai.commercial_rate,
    ai.created_at,
    a.id AS artist_id,
    a.username AS artist_username,
    a.pfp_url AS artist_pfp_url,
    a.custom_tos AS artist_custom_tos,
    COALESCE(AVG(r.rating), 0) AS avg_rating,
    COUNT(r.id) AS rating_count
FROM art_items ai
JOIN artists a ON ai.artist_id = a.id
LEFT JOIN ratings r ON ai.id = r.art_item_id
GROUP BY ai.id;

-- View: chat list (matches Flutter ChatItem model)
CREATE VIEW v_chat_list AS
SELECT 
    c.id,
    u.id AS other_user_id,
    a.username,
    a.pfp_url AS img_url,
    m.content AS latest_msg,
    c.is_requested
FROM conversations c
JOIN users u ON (c.user1_id = u.id OR c.user2_id = u.id)
JOIN artists a ON u.id = a.user_id
LEFT JOIN messages m ON c.id = m.conversation_id
WHERE m.created_at = (
    SELECT MAX(created_at) 
    FROM messages 
    WHERE conversation_id = c.id
);

-- =====================================================
-- INDEXES (for performance)
-- =====================================================

CREATE INDEX idx_art_items_artist ON art_items(artist_id);
CREATE INDEX idx_art_items_category ON art_items(category);
CREATE INDEX idx_art_items_status ON art_items(status);
CREATE INDEX idx_ratings_art_item ON ratings(art_item_id);
CREATE INDEX idx_messages_conversation ON messages(conversation_id);
CREATE INDEX idx_orders_buyer ON orders(buyer_id);
CREATE INDEX idx_orders_artist ON orders(artist_id);

-- =====================================================
-- SAMPLE DATA (matches your mock data)
-- =====================================================

-- Insert sample categories
INSERT INTO categories (name, description) VALUES
('Portrait', 'Portrait artwork and commissions'),
('Character', 'Character design and illustrations'),
('Environment', 'Environment and landscape art'),
('Concept', 'Concept art and design'),
('Animation', 'Animation and motion graphics');
