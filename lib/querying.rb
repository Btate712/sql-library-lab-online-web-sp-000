def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT Books.title, Books.year FROM books
  JOIN series ON Series.id = Books.series_id
  WHERE Series.id = 1 ORDER BY Books.year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters
  ORDER BY LENGTH(motto) DESC LIMIT 1"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS species_occurance FROM characters
  GROUP BY species ORDER BY species_occurance DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT Authors.name, Subgenres.name FROM Authors
  JOIN series ON Authors.id = Series.author_id
  JOIN subgenres ON Series.subgenre_id = Subgenres.id
  "
end

def select_series_title_with_most_human_characters
  "SELECT series.title
    FROM series
    JOIN books
    ON books.series_id = series.id
    JOIN character_books
    ON character_books.book_id = books.id
    JOIN characters
    ON character_books.character_id = characters.id
    WHERE characters.species = 'human'
    GROUP BY series.title
    ORDER BY COUNT(*) DESC
    LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT Characters.name, COUNT(Books.id) AS book_count FROM characters
  JOIN character_books ON Characters.id = Character_books.character_id
  JOIN books ON Character_books.book_id = Books.id
  GROUP BY Characters.name
  ORDER BY book_count DESC
  "
end
