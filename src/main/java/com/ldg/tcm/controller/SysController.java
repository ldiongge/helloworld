package com.ldg.tcm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.*;
import com.ldg.tcm.service.*;
import com.ldg.tcm.utils.CodeGenerator;
import com.ldg.tcm.utils.DataGridView;
import com.ldg.tcm.utils.GenCode;
import com.ldg.tcm.utils.SendMailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/to")
public class SysController {
    @Autowired
    private RegcodeService regcodeService;
    @Autowired
    private SendMailService mailService;
    @Autowired
    private AdmintypeService admintypeService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private UsersService usersService;
    @Autowired
    private DbOrderService dbOrderService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GoodstypeService goodstypeService;
    @Autowired
    private GoodsShopcarService goodsShopcarService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private OderService oderService;
    @Autowired
    private CommentService commentService;


    @RequestMapping("/index1")
    public String toindex1(){

        return "index1";
    }

    @RequestMapping("/login")
    public String toLogin() {
        return "Admin/login";
    }
    @RequestMapping("/userslogin")
    public String userslogin() {
        return "User/login";
    }

    @RequestMapping("/ToAdminindex")
    public String ToAdminindex() {
        return "Admin/index";
    }

    @RequestMapping("/Toreg")
    public String Toreg() {
        return "views/reg";
    }
    @RequestMapping("/Tousersreg")
    public String Tousersreg() {
        return "User/reg";
    }

    @RequestMapping("/emailcode")
    @ResponseBody
    public Object emailcode(String email) {

        String emailcode = GenCode.gen();
        Regcode regcode = new Regcode();
        regcode.setCode(emailcode);
        regcodeService.save(regcode);
        mailService.send("【中药材交易平台】", "您正在注册中药材交易平台后台管理,您的验证码为" + emailcode + "请及时输入,如非本人操作,请忽略本邮件", "lidonggeywzq@163.com", new String[]{email});
        DataGridView dataGridView = new DataGridView();
        return dataGridView;
    }
    @RequestMapping("/toinfo")
    public String toinfo(){
        return "Admin/admininfo";
    }
    @RequestMapping("/touserinfo")
    public String touserinfo(){
        return "User/userinfo";
    }
    @RequestMapping("/password")
    public String password(){
        return "Admin/password";
    }
    @RequestMapping("/toAdminlist")
    public String toAdminlist(){
        return "Admin/Adminlist";
    }
    @RequestMapping("/toadminform")
    public String toadminform(Integer id,Model model){
        if(id!=null){
            Admin admin= adminService.getById(id);
            adminService.checkStatusone(admin);
            model.addAttribute("admin",admin);
        }
            model.addAttribute("role",admintypeService.list());
        return "Admin/adminform";
    }

    @RequestMapping("/touserlist")
    public String touserlist(Integer id){

        return "User/userlist";
    }
    @RequestMapping("/touserform")
    public String touserform(Integer id,Model model){
        if(id!=null){
            Users uers= usersService.getById(id);
            model.addAttribute("users",uers);

        }
        return "User/userform";

    }
    @RequestMapping("/torole")
    public String torole(Model model){

        return "Admin/role";
    }

 @RequestMapping("/torolefrom")
 public String torolefrom(Integer id,Model model){
        if(id!=null){
         Admintype admintype=admintypeService.getById(id);
            model.addAttribute("role",admintype);
        }
     return "Admin/roleform";

 }
 @RequestMapping("/togoodslist")
    public String togoodslist(){
        return "Goods/goodslist";
 }
    @RequestMapping("/togoodstypelist")
    public String togoodstypelist(){
        return "Goods/goodsTypelist";
    }

    @RequestMapping("/toorderlist")
    public String toorderlist(){
        return "Order/orderlist";
    }
    @RequestMapping("/touserorderlist")
    public String touserorderlist(Integer uid,Model model){
        QueryWrapper<DbOrder> wrapper=new QueryWrapper<DbOrder>().eq("uid",uid);
        List<DbOrder> list =dbOrderService.list(wrapper);
        model.addAttribute("list",list);
        return "MallWeb/orderlist";
    }

    @RequestMapping("/toorderform")
    public String toorderform(Integer id,Model model){
        Oder oder = oderService.getById(id);
        model.addAttribute("order",oder);
        return "Order/orderform";
    }
    @RequestMapping("/towebgoodslist")
    public String towebgoodslist(Model model){
        model.addAttribute("goodslist",goodsService.list());
        model.addAttribute("typelist",goodstypeService.list());
        return "MallWeb/goodslist";
    }

    @RequestMapping("/togoodsinfo")
    public  String togoodsinfo(Integer id,Model model){
        Goods goods= goodsService.getById(id);
       goods.setTypename(  goodstypeService.getById(goods.getTypeid()).getTypename());
        model.addAttribute("goods",goods);
       return "MallWeb/goodsinfo";
    }
    @RequestMapping("/toshopcar")
    public Object toshopcar(Integer id, Model model){
        QueryWrapper<GoodsShopcar> wrapper =new QueryWrapper<GoodsShopcar>().eq("uid",id);
        List<GoodsShopcar> shopcars=goodsShopcarService.list(wrapper);
        Page<GoodsShopcar> page =new Page<>();
        goodsShopcarService.page(page,wrapper);
       model.addAttribute("shopcar",shopcars);
        return "MallWeb/shopcar";
    }
    @RequestMapping("/shopcar")
    public String shopcar(){

        return "MallWeb/shopcar";
    }
    @RequestMapping("/address")
    public String address(Integer id,Model model){
        QueryWrapper<Address> wrapper =new QueryWrapper<Address>().eq("user_id",id);
        List<Address> addresses= addressService.list(wrapper);
        model.addAttribute("address",addresses);
return "MallWeb/address";
    }

    @RequestMapping("/userpassword")
    public String userpassword(){
        return "User/password";
    }

        @RequestMapping("/index")
    public String towebindex(Model model){
            model.addAttribute("goodslist",goodsService.list());
            model.addAttribute("typelist",goodstypeService.list());
        return "Web/index";
        }


        @RequestMapping("/comment")
    public String comment(){
        return "Comment/commentlist";
        }

}