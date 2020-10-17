package controllers;

import org.glassfish.jersey.media.multipart.FormDataParam;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import server.Main;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javWhat are the usage limits of Colab?
Colab is able to provide free resources in part by having dynamic usage limits that sometimes fluctuate, and by not providing guaranteed or unlimited resources. This means that overall usage limits as well as idle timeout periods, maximum VM lifetime, GPU types available, and other factors vary over time. Colab does not publish these limits, in part because they can (and sometimes do) vary quickly.

GPUs and TPUs are sometimes prioritized for users who use Colab interactively rather than for long-running computations, or for users who have recently used less resources in Colab. As a result, users who use Colab for long-running computations, or users who have recently used more resources in Colab, are more likely to run into usage limits and have their access to GPUs and TPUs temporarily restricted. Users with high computational needs may be interested in using Colab’s UI with a local runtime running on their own hardware. Users interested in having higher and more stable usage limits may be interested in Colab Pro.a.sql.PreparedStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
            PreparedStatement ps = Main.db.prepareStatement("SELECT UserName FROM Accounts WHERE AccountID = ?");
            ps.setInt(1, AccountID);
            ResultSet results = ((PreparedStatement) ps).executeQuery();
            JSONObject response = new JSONObject();
            if (results.next()== true) {
                response.put("AccountID", AccountID);
                response.put("UserName", results.getString(1));
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



}
