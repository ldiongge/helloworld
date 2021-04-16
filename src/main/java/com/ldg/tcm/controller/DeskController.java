package com.ldg.tcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 李东阁
 * @since 2021-03-25
 */
@Controller
@RequestMapping("/desk")
public class DeskController {

    @RequestMapping("/todeskManager")
    public String todeskManager(){
        return "views/deskManager";
    }
}
