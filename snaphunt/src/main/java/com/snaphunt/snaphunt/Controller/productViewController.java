package com.snaphunt.snaphunt.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.snaphunt.snaphunt.Model.Product;
import com.snaphunt.snaphunt.Service.ProductService;

@Controller
@RequestMapping(value = "/product-view/")
public class productViewController {
    
    @Autowired
    ProductService productService;

    public static int calculatePercentageDifference(int oldNumber, int newNumber) {
        int difference = newNumber - oldNumber;
        if (oldNumber != 0) {
            return (difference * 100) / oldNumber;
        } else {
            return 0; // Handle the case where oldNumber is 0 to avoid division by zero.
        }
    }
    

    @RequestMapping(value = "{product}/{productNames}",method = RequestMethod.GET) 
    public String productDetails(@PathVariable("product")String ProductId,@PathVariable("productNames")String ProductName,Model model){

        Product productDeatils = productService.getProductDetails(ProductName, ProductId);

        int oldNumber = Integer.parseInt(productDeatils.getMrp());  
        int newNumber = Integer.parseInt(productDeatils.getBdp()); ;

        int percentageDifference = calculatePercentageDifference(oldNumber, newNumber);

        model.addAttribute("productDetails", productDeatils);
        model.addAttribute("percentageDifference", percentageDifference);
        
        return "productView";
    }


    
}
