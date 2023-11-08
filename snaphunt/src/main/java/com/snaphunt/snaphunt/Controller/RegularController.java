package com.snaphunt.snaphunt.Controller;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.snaphunt.snaphunt.Model.Product;
import com.snaphunt.snaphunt.Service.ProductService;

@Controller
public class RegularController {

    @Autowired
    ProductService productService;

    @GetMapping(value = "/")
    public String index(HttpSession session){
        List<Product> Allproducts = productService.geProducts();
        List<Object[]> ProductsTag = productService.getProductTags();
        List<Object> allData = new ArrayList<>();

        // Add all elements to the 'allData' list
        for (int i = 0; i < ProductsTag.size(); i++) {
            Object[] productTags = ProductsTag.get(i);
            for (int j = 0; j < productTags.length; j++) {
                Object element = productTags[j];
                allData.add(element);
            }
        }

        // Create a Set to store unique elements
        Set<Object> uniqueElements = new LinkedHashSet<Object>(allData);

        // Clear the 'allData' list and add unique elements back to it
        allData.clear();
        allData.addAll(uniqueElements);

        session.setAttribute("productTags", allData);  
        session.setAttribute("Allproducts", Allproducts);
        return "index";
    }




}
