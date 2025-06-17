CREATE OR REPLACE FUNCTION print_book_details(p_bookid INT)
RETURNS VOID AS $$
DECLARE
    v_book_name VARCHAR;
    v_author VARCHAR;
    v_publication VARCHAR;
    v_price DECIMAL(8,2);
BEGIN
    SELECT Book_name, Author, Publication, Price
    INTO v_book_name, v_author, v_publication, v_price
    FROM Book
    WHERE Bookid = p_bookid;

    RAISE NOTICE 'Book Name     : %', v_book_name;
    RAISE NOTICE 'Author        : %', v_author;
    RAISE NOTICE 'Publication   : %', v_publication;
    RAISE NOTICE 'Price         : %', v_price;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE NOTICE 'No book found with Bookid = %', p_bookid;
END;
$$ LANGUAGE plpgsql;


SELECT print_book_details(104);
