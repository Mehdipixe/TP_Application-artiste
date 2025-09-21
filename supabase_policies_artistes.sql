-- Ajout d'une colonne supplémentaire pour une autre préférence sur la table artistes
ALTER TABLE public.artistes
ADD COLUMN autre_preference TEXT;

-- Autoriser la lecture à tous
DROP POLICY IF EXISTS "Lecture publique des artistes" ON public.artistes;
CREATE POLICY "Lecture publique des artistes"
 ON public.artistes
 FOR SELECT
 TO public
 USING (true);

-- Autoriser l'insertion à tous (si les champs sont valides)
DROP POLICY IF EXISTS "Insertion contrôlée des artistes" ON public.artistes;
CREATE POLICY "Insertion contrôlée des artistes"
 ON public.artistes
 FOR INSERT
 TO public
 WITH CHECK (
 nom IS NOT NULL AND length(nom) BETWEEN 2 AND 30 AND
 style IS NOT NULL AND length(style) BETWEEN 2 AND 30 AND
 (autre_preference IS NULL OR length(autre_preference) <= 100)
);
