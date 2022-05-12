let nextButton = document.getElementById("next1"),

    prevButton = document.getElementById("prev1"),

    sliderCon = document.getElementById("cards-container-id"),

    photoDiv = document.getElementById("personal-photo-id"),

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


page2.style.borderBottom  = "2px solid rgb(255, 108, 34)";

page1.onclick = function(){
    page1.style.borderBottom = "2px solid rgb(255, 108, 34)";
    page2.style.borderBottom  = null;
}

page2.onclick = function(){
    page1.style.borderBottom  = null;
    page2.style.borderBottom  = "2px solid rgb(255, 108, 34)";
}


sliderCon.style.left = "0";

prevButton.classList.add('disabled');

nextButton.classList.add('active');


nextButton.onclick=function()
{

    sliderCon.style.left = "-1250px";

    nextButton.style.visibility = "hidden";

    prevButton.classList.remove('disabled');
   
}

prevButton.onclick=function()
{
    
    sliderCon.style.left = 0;

    prevButton.classList.add('disabled');

    nextButton.classList.remove("disabled");

    nextButton.style.visibility = "visible";

}
