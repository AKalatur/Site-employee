package com.site.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class MainController {

    @RequestMapping(method = RequestMethod.GET)
    public String startPage() {
        return "index";

    }    @RequestMapping(value = "loginPage", method = RequestMethod.GET)
    public String loginPage() {
        return "loginPage";
    }

    @RequestMapping(value = "accessDenied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "accessDenied";
    }

    @RequestMapping(value = "userPage", method = RequestMethod.GET)
    public String userPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "userPage";
    }

    @RequestMapping(value = "adminPage", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "adminPage";
    }

    @RequestMapping(value = "adminPage/addUser", method = RequestMethod.GET)
    public String addUser(@RequestParam String login, @RequestParam String password, @RequestParam String role) throws SQLException {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sitebase?user=root&password=revenant");
        con.setAutoCommit(true);
        Statement st = con.createStatement();
 /*       st.execute("INSERT INTO users(u_login, u_password)  VALUES ('" + login+ "','"
                + password + "')");*/
        st.execute("INSERT INTO users(u_login, u_password, u_role)  VALUES ('" + login + "','"
                + password + "','" + role + "')");
        con.close();

        return "redirect:/adminPage?message=New+user+added";
    }

    @RequestMapping(value = "resultPage", method = RequestMethod.GET)
    public String resultPage(@RequestParam String rep, ModelMap model) throws SQLException {
        if (rep.equals("rep1")) {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sitebase?user=root&password=revenant");
            con.setAutoCommit(true);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM employee");

            List<String> list = new ArrayList<String>();
            ResultSetMetaData rsmd = rs.getMetaData();
            list.add(rsmd.getColumnName(1) + " " + rsmd.getColumnName(2) + " " + rsmd.getColumnName(3) + " "
                    + rsmd.getColumnName(4) + " " + rsmd.getColumnName(5));
            while(rs.next()) {
                list.add(rs.getInt("id") + " " + rs.getString("f_name") + " " + rs.getString("s_name") + " "
                        + rs.getString("position") + " " + rs.getString("salary"));
            }
            model.addAttribute(list);
        }
        return "resultPage";
    }

    @RequestMapping(value="logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/?logout";
    }

    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
}
