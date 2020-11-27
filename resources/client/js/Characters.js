"use strict";
function getUsersList() {
    //debugger;
    console.log("Invoked getUsersList()");     //console.log your BFF for debugging client side - also use debugger statement
    const url = "/Characters/list/";    		// API method on web server will be in Users class, method list
    fetch(url, {
        method: "GET",				//Get method
    }).then(response => {
        return response.json();                 //return response as JSON
    }).then(response => {
        if (response.hasOwnProperty("Error")) { //checks if response from the web server has an "Error"
            alert(JSON.stringify(response));    // if it does, convert JSON object to string and alert (pop up window)
        } else {
            formatUsersList(response);          //this function will create an HTML table of the data (as per previous lesson)
        }
    });
}
function CharactersListAll() {
    //debugger;
    console.log("Invoked getCharactersListAll()");     //console.log your BFF for debugging client side - also use debugger statement
    const url = "/Characters/listAll/";    		// API method on web server will be in Users class, method list
    fetch(url, {
        method: "GET",				//Get method
    }).then(response => {
        return response.json();                 //return response as JSON
    }).then(response => {
        if (response.hasOwnProperty("Error")) { //checks if response from the web server has an "Error"
            alert(JSON.stringify(response));    // if it does, convert JSON object to string and alert (pop up window)
        } else {
            formatCharactersList(response);          //this function will create an HTML table of the data (as per previous lesson)
        }
    });
}

function formatUsersList(myJSONArray){
    let dataHTML = "";
    for (let item of myJSONArray) {
        dataHTML += "<tr><td>" + item.CharacterID + "<td><td>" + item.CharacterName + "<tr><td>";
    }
    document.getElementById("UsersTable").innerHTML = dataHTML;
}
function formatCharactersList(myJSONArray){
    let dataHTML = "";
    for (let item of myJSONArray) {
        dataHTML += "<tr><td>" + item.CharacterID + "<td><td>" + item.CharacterName + "<tr><td>" + item.Health + "<tr><td>" + item.Dps + "<tr><td>" + item.Speed + "<tr><td>" + item.Difficulty + "<tr><td>" + item.AverageCooldown + "<tr><td>" + item.Winrate + "<tr><td>" + item.Class + "<tr><td>";
    }
    document.getElementById("CharactersTable").innerHTML = dataHTML;
}