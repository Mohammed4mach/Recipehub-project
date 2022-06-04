let photoDiv = document.getElementById("personal-photo-id"),

    imgScale = document.getElementById("photo-id"),

    backGround = document.getElementById("photo-hover-id"),

    page1 = document.getElementById("title1"),

    page2 = document.getElementById("title2");

imgScale.style.transform = "none";

photoDiv.onclick=function(){

        if(imgScale.style.transform == "none"){
            imgScale.style.transform = "scale(2,2)";
            imgScale.style.borderRadius = "0px";
            imgScale.style.marginTop = "50px";
            imgScale.style.transition = ".8s";
            backGround.style.display = "none";
        }
        else{
            imgScale.style.transform = "none";
            imgScale.style.marginTop = "0";
            imgScale.style.transition = null;
            imgScale.style.borderRadius = null;
            backGround.style.display = null;
        }
       
}

let currURL = window.location.href;
let match = currURL.match(/#\w+/);

if(match)
{
    if(match == `#favorites`)
    {
        page1.style.borderBottom = "2px solid rgb(255, 108, 34)";
        page2.style.borderBottom  = null;
    }
    else
    {
        page1.style.borderBottom  = null;
        page2.style.borderBottom  = "2px solid rgb(255, 108, 34)";
    }
}


page1.onclick = function(){
    page1.style.borderBottom = "2px solid rgb(255, 108, 34)";
    page2.style.borderBottom  = null;
    page1.children[1].click();
}

page2.onclick = function(){
    page1.style.borderBottom  = null;
    page2.style.borderBottom  = "2px solid rgb(255, 108, 34)";
    page2.children[0].click();
}


/*
    Follow Panels Functionality (Open/Close)
*/

// Declaring variables
let followersPanel = document.querySelector(`#followers-panel`),
    followingPanel = document.querySelector(`#following-panel`);

let openFollowers = document.querySelector(`#open-followers`),
    openFollowing = document.querySelector(`#open-following`),
    closeFollowers = document.querySelector(`#followers-panel .close-panel`),
    closeFollowing = document.querySelector(`#following-panel .close-panel`);

// Set Functionality
openFollowers.onclick = () => followersPanel.style.display = `flex`;

openFollowing.onclick = () => followingPanel.style.display = `flex`;

closeFollowers.onclick = () => followersPanel.style.display = null;

closeFollowing.onclick = () => followingPanel.style.display = null;
