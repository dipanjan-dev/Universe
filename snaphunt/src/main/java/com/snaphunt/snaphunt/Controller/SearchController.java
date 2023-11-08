package com.snaphunt.snaphunt.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snaphunt.snaphunt.Model.Product;
import com.snaphunt.snaphunt.Service.ProductService;

@Controller
@RequestMapping(value = "/search-view")
public class SearchController {
    
    @Autowired
    ProductService productService;

    @GetMapping()
    public String searchValue(@RequestParam("searchdata")String userSearchData,Model model){
        System.out.println(userSearchData);
        List<Product> products = productService.getSeachList(userSearchData);
        model.addAttribute("userSearch", products);
        return "search-result";
    }
}
