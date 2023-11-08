package com.snaphunt.snaphunt.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.snaphunt.snaphunt.Model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long>{

    @Query("FROM Product where item_name=?1 and product_id=?2")
    Product getProductDetails(String productName, String productId);

    @Query("SELECT p.keywords FROM Product p")
    List<Object[]> getProductTags();

    @Query("FROM Product p WHERE p.ItemName LIKE %?1% or p.keywords LIKE %?1% ")
    List<Product> getSeachList(String Data);
}
