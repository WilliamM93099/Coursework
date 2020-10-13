package controllers;

import org.glassfish.jersey.media.multipart.FormDataParam;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import server.Main;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@Path("Characters/")
@Consumes(MediaType.MULTIPART_FORM_DATA)
@Produces(MediaType.APPLICATION_JSON)

public class Characters {
    @GET
    @Path("list")
    public String CharactersList() {
        System.out.println("Invoked Accounts.CharactersList()");
        JSONArray response = new JSONArray();
        try {
            PreparedStatement ps = Main.db.prepareStatement("SELECT CharacterID, CharacterName FROM Characters");
            ResultSet results = ps.executeQuery();
            while (results.next() == true) {
                JSONObject row = new JSONObject();
                row.put("CharacterID", results.getInt(1));
                row.put("CharacterName", results.getString(2));
                response.add(row);
            }
            return response.toString();
        } catch (Exception exception) {
            System.out.println("Database error: " + exception.getMessage());
            return "{\"Error\": \"Unable to list items.  Error code xx.\"}";
        }
    }
    @POST
    @Path("add")
    public String CharacterAdd(@FormDataParam("CharacterID") Integer CharacterID, @FormDataParam("CharacterName") String CharacterName, @FormDataParam("Health") Integer Health, @FormDataParam("DPS") Integer DPS, @FormDataParam("Speed") Integer Speed, @FormDataParam("Difficulty") Integer Difficulty, @FormDataParam("AverageCooldown") Double AverageCooldown, @FormDataParam("Winrate") Integer Winrate, @FormDataParam("Class") Character Class, @FormDataParam("RotationStatus") Boolean RotationStatus) {
        System.out.println("Invoked Characters.CharacterAdd()");
        try {
            PreparedStatement ps = Main.db.prepareStatement("INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, CharacterID);
            ps.setString(2, CharacterName);
            ps.setInt(3, Health);
            ps.setInt(4, DPS);
            ps.setInt(5, Speed);
            ps.setInt(6, Difficulty);
            ps.setDouble(7, AverageCooldown);
            ps.setInt(8, Winrate);
            ps.setInt(9, Class);
            ps.setBoolean(10, RotationStatus);

            ps.execute();
            return "{\"OK\": \"Added Character.\"}";
        } catch (Exception exception) {
            System.out.println("Database error: " + exception.getMessage());
            return "{\"Error\": \"Unable to create new item, please see server console for more info.\"}";
        }

    }
}

