package controllers;

import org.glassfish.jersey.media.multipart.FormDataParam;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import server.Main;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.UUID;

@Path("Accounts/")
@Consumes(MediaType.MULTIPART_FORM_DATA)
@Produces(MediaType.APPLICATION_JSON)

public class Accounts{
    @GET
    @Path("list")
    public String AccountsList() {
        System.out.println("Invoked Accounts.AccountsList()");
        JSONArray response = new JSONArray();
        try {
            PreparedStatement ps = Main.db.prepareStatement("SELECT AccountID, Username FROM Accounts");
            ResultSet results = ps.executeQuery();
            while (results.next()==true) {
                JSONObject row = new JSONObject();
                row.put("AccountID", results.getInt(1));
                row.put("Username", results.getString(2));
                response.add(row);
            }
            return response.toString();
        } catch (Exception exception) {
            System.out.println("Database error: " + exception.getMessage());
            return "{\"Error\": \"Unable to list items.  Error code xx.\"}";
        }
    }
    @GET
    @Path("get/{AccountID}")
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    @Produces(MediaType.APPLICATION_JSON)
    public String GetAccount(@PathParam("AccountID") Integer AccountID) {
        System.out.println("Invoked Account.GetAccount() with AccountID " + AccountID);
        try {
            PreparedStatement ps = Main.db.prepareStatement("SELECT Username FROM Accounts WHERE AccountID = ?");
            ps.setInt(1, AccountID);
            ResultSet results = ((PreparedStatement) ps).executeQuery();
            JSONObject response = new JSONObject();
            if (results.next()== true) {
                response.put("AccountID", AccountID);
                response.put("Username", results.getString(1));
                //response.put("Token", results.getInt(2));
            }
            return response.toString();
        } catch (Exception exception) {
            System.out.println("Database error: " + exception.getMessage());
            return "{\"Error\": \"Unable to get item, please see server console for more info.\"}";
        }
    }
    @POST
    @Path("add")
    public String AccountAdd(@FormDataParam("AccountID") Integer AccountID, @FormDataParam("Username") String Username, @FormDataParam("Password") String Password, @FormDataParam("Admin") Boolean Admin) {
        System.out.println("Invoked Users.UsersAdd()");
        try {
            PreparedStatement ps = Main.db.prepareStatement("INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (?, ?, ?, ?)");
            ps.setInt(1, AccountID);
            ps.setString(2, Username);
            ps.setString(3, Password);
            ps.setBoolean(4, Admin);

            ps.execute();
            return "{\"OK\": \"Added user.\"}";
        } catch (Exception exception) {
            System.out.println("Database error: " + exception.getMessage());
            return "{\"Error\": \"Unable to create new item, please see server console for more info.\"}";
        }

    }
    @POST
    @Path("delete/{AccountID}")
    public String DeleteAccount(@PathParam("AccountID") Integer AccountID) throws Exception {
        System.out.println("Invoked Accounts.DeleteAccount()");
        if (AccountID == null) {
            throw new Exception("AccountID is missing in the HTTP request's URL.");
        }
        try {
            PreparedStatement ps = Main.db.prepareStatement("DELETE FROM Accounts WHERE AccountID = ?");
            ps.setInt(1, AccountID);
            ps.execute();
            return "{\"OK\": \"Account deleted\"}";
        } catch (Exception exception) {
            System.out.println("Database error: " + exception.getMessage());
            return "{\"Error\": \"Unable to delete item, please see server console for more info.\"}";
        }
    }
    @POST
    @Path("login")
    public String UsersLogin(@FormDataParam("Username") String Username, @FormDataParam("Password") String Password) {
        System.out.println("Invoked loginUser() on path Accounts/login");
        try {
            PreparedStatement ps1 = Main.db.prepareStatement("SELECT Password FROM Accounts WHERE Username = ?");
            ps1.setString(1, Username);
            ResultSet loginResults = ps1.executeQuery();
            if (loginResults.next() == true) {
                String correctPassword = loginResults.getString(1);
                if (Password.equals(correctPassword)) {
                    String Token = UUID.randomUUID().toString();
                    PreparedStatement ps2 = Main.db.prepareStatement("UPDATE Accounts SET Token = ? WHERE Username = ?");
                    ps2.setString(1, Token);
                    ps2.setString(2, Username);
                    ps2.executeUpdate();
                    JSONObject userDetails = new JSONObject();
                    userDetails.put("Username", Username);
                    userDetails.put("Token", Token);
                    return userDetails.toString();
                } else {
                    return "{\"Error\": \"Incorrect password!\"}";
                }
            } else {
                return "{\"Error\": \"Incorrect username.\"}";
            }
        } catch (Exception exception) {
            System.out.println("Database error during /Accounts/login: " + exception.getMessage());
            return "{\"Error\": \"Server side error!\"}";
        }
    }

    @POST
    @Path("logout")
    public static String logout(@CookieParam("Token") String Token){
        try{
            System.out.println("Accounts/logout "+ Token);
            PreparedStatement ps = Main.db.prepareStatement("SELECT AccountID FROM Accounts WHERE Token=?");
            ps.setString(1, Token);
            ResultSet logoutResults = ps.executeQuery();
            if (logoutResults.next()){
                int AccountID = logoutResults.getInt(1);
                //Set the token to null to indicate that the user is not logged in
                PreparedStatement ps1 = Main.db.prepareStatement("UPDATE Accounts SET Token = NULL WHERE AccountID = ?");
                ps1.setInt(1, AccountID);
                ps1.executeUpdate();
                return "{\"status\": \"OK\"}";
            } else {
                return "{\"error\": \"Invalid token!\"}";

            }
        } catch (Exception ex) {
            System.out.println("Database error during /Accounts/logout: " + ex.getMessage());
            return "{\"error\": \"Server side error!\"}";
        }
    }




}
