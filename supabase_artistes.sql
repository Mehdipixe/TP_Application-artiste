-- Table: artistes
CREATE TABLE IF NOT EXISTS artistes (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    nom TEXT NOT NULL,
    style TEXT NOT NULL,
    image_url TEXT,
    description TEXT,
    pays TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc', now())
);

-- Exemples d'insertion
INSERT INTO artistes (nom, style, image_url, description, pays) VALUES
('Michael Jackson', 'Pop', 'img/artistes/michael-jackson.jpg', 'Roi de la pop', 'USA'),
('Beyoncé', 'Pop', 'img/artistes/beyonce.jpg', 'Queen B', 'USA'),
('Jul', 'Rap', 'img/artistes/jul.jpg', 'Rappeur marseillais', 'France'),
('Daft Punk', 'Electro', 'img/artistes/daft-punk.jpg', 'Duo électro légendaire', 'France'),
('Bob Marley', 'Reggae', 'img/artistes/bob-marley.jpg', 'Icône du reggae', 'Jamaïque');
