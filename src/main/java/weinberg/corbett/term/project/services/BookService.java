package weinberg.corbett.term.project.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import weinberg.corbett.term.project.entities.Book;

public interface BookService {
    List<Book> findAll();
    Book findById(Long id);
    Book save(Book book);
    Page<Book> findAllByPage(Pageable pageable);
}
