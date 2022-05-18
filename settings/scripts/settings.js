let photo = document.getElementById("personal-photo-id"),

    maximizePhoto = document.getElementById("maximize-photo-id"),

    originContainer = document.getElementById("container-id"),

    Close = document.getElementById("close-id"),

    NamePanel = document.getElementById("name-panel"),

    EditPhotoPanel = document.getElementById("changePhoto-panel"),

    PasswordPanel = document.getElementById("password-panel"),


    CloseNamePanel = document.getElementById("close-name-panel-id"),

    CloseEditPhotoPanel = document.getElementById("close-changePhoto-panel-id"),

    ClosePasswordPanel = document.getElementById("close-password-panel-id"),
    

    BackGround = document.getElementById("background"),

    WriteName = document.getElementById("write-name"),

    EditPhoto = document.getElementById("edit-photo"),

    EditPassword = document.getElementById("edit-password");



maximizePhoto.style.display = "none";

photo.onclick = function(){
    if(maximizePhoto.style.display == "none"){
        maximizePhoto.style.display = null;
        originContainer.style.display = "none";
    }
}

Close.onclick = function(){
    maximizePhoto.style.display = "none";
    originContainer.style.display = null;
}



BackGround.style.display = "none";
NamePanel.style.display = "none";
EditPhotoPanel.style.display ="none";
PasswordPanel.style.display = "none";

WriteName.onclick=function(){
    NamePanel.style.display = null;
    BackGround.style.display = null;
}

CloseNamePanel.onclick=function(){
    NamePanel.style.display = "none";
    BackGround.style.display = "none";
}

EditPhoto.onclick=function(){
    EditPhotoPanel.style.display = null;
    BackGround.style.display = null;
}

CloseEditPhotoPanel.onclick=function(){
    EditPhotoPanel.style.display = "none";
    BackGround.style.display = "none";
}

EditPassword.onclick=function(){
    PasswordPanel.style.display = null;
    BackGround.style.display = null;
}

ClosePasswordPanel.onclick=function(){
    PasswordPanel.style.display = "none";
    BackGround.style.display = "none";
}

