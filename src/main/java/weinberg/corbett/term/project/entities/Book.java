package weinberg.corbett.term.project.entities;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "book")
public class Book implements Serializable {
	private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Version
    @Column(name = "VERSION")
    private int version;
    
    @NotBlank(message="{validation.categoryname.NotBlank.message}")
    @Size(min=2, max=100, message="{validation.categoryname.Size.message}")
    @Column(name = "CATEGORY_NAME")
    private String categoryName;

    @NotBlank(message="{validation.isbn.NotBlank.message}")
    @Size(min=10, max=13, message="{validation.isbn.Size.message}")
    @Column(name = "ISBN")
    private String isbn;

    @NotBlank(message="{validation.title.NotBlank.message}")
    @Size(min=2, max=200, message="{validation.title.Size.message}")
    @Column(name = "TITLE")
    private String title;

    @NotBlank(message="{validation.publisher.NotBlank.message}")
    @Size(min=2, max=100, message="{validation.publisher.Size.message}")
    @Column(name = "PUBLISHER")
    private String publisher;

    @NotNull(message="{validation.price.NotNull.message}")
    @Column(name = "PRICE")
    private Float price;


    public Long getId() {
        return id;
    }

    public int getVersion() {
        return version;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public String getIsbn() {
        return isbn;
    }

    public String getTitle() {
        return title;
    }

    public String getPublisher() {
        return publisher;
    }

    public Float getPrice() {
        return price;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Book - Id: " + id + ", Category_Name: " + categoryName
                + ", ISBN: " + isbn + ", Title: " + title
                + ", Publisher: " + publisher + ", Price: " + price;
    }
}
