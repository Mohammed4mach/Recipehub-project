let originContainer = document.getElementById("container-id"),

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

    let cancelNameBtn = document.querySelector(`#name-panel .cancel`),
        cancelPassBtn = document.querySelector(`#password-panel .cancel`),
        previewerCont = document.querySelector(`.previewer-container`);


BackGround.style.display = "none";
NamePanel.style.display = "none";
EditPhotoPanel.style.display ="none";
PasswordPanel.style.display = "none";

WriteName.onclick=function(){
    NamePanel.style.display = null;
    BackGround.style.display = null;
}

cancelNameBtn.onclick = CloseNamePanel.onclick=function(){
    NamePanel.style.display = "none";
    BackGround.style.display = "none";
}

EditPhoto.onclick=function(){
    EditPhotoPanel.style.display = null;
    BackGround.style.display = null;
    previewerCont.style.display = "flex";
}

CloseEditPhotoPanel.onclick=function(){
    EditPhotoPanel.style.display = "none";
    BackGround.style.display = "none";
    previewerCont.style.display = null;
}

EditPassword.onclick=function(){
    PasswordPanel.style.display = null;
    BackGround.style.display = null;
}

cancelPassBtn.onclick = ClosePasswordPanel.onclick=function(){
    PasswordPanel.style.display = "none";
    BackGround.style.display = "none";
}
