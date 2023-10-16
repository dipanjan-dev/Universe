package com.snaphunt.snaphunt.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/product-view/")
public class productViewController {
    
    // @GetMapping(value = )
    @RequestMapping(value = "{product}/{productNames}",method = RequestMethod.GET) 
    public String productDetails(HttpSession session){
        return "productView";
    }

}
