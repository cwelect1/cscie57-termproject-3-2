package weinberg.corbett.term.project.repos;

import org.springframework.data.repository.PagingAndSortingRepository;

import weinberg.corbett.term.project.entities.Book;

public interface BookRepository extends PagingAndSortingRepository<Book, Long> {

}
