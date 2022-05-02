<<<<<<< HEAD
let nextButton = document.getElementById("next1"),

    prevButton = document.getElementById("prev1"),

    sliderCon = document.getElementById("cards-container-id"),

    ButtonOne = document.getElementById('one-id'),

    ButtonSix = document.getElementById('six-id');


sliderCon.style.left = "0";

sliderCon.style.right = "0";

prevButton.classList.add('disabled');

nextButton.classList.add('active');

ButtonOne.style.backgroundColor="rgb(255, 122, 55)";


nextButton.onclick=ButtonSix.onclick=function()
{
    sliderCon.style.animation="none";

    sliderCon.style.left = "-1250px";

    nextButton.style.visibility = "hidden";

    prevButton.classList.remove('disabled');

    ButtonSix.style.backgroundColor = "rgb(255, 122, 55)";

    ButtonOne.style.backgroundColor = null;      
}


prevButton.onclick=ButtonOne.onclick=function()
{
    
    sliderCon.style.left = 0;

    prevButton.classList.add('disabled');

    nextButton.classList.remove("disabled");

    nextButton.style.visibility = "visible";

    ButtonSix.style.backgroundColor = null;

    ButtonOne.style.backgroundColor = "rgb(255, 122, 55)";
}
=======
let nextButton = document.getElementById("next1"),

    prevButton = document.getElementById("prev1"),

    sliderCon = document.getElementById("cards-container-id"),

    ButtonOne = document.getElementById('one-id'),

    ButtonSix = document.getElementById('six-id');


sliderCon.style.left = "0";

sliderCon.style.right = "0";

prevButton.classList.add('disabled');

nextButton.classList.add('active');

ButtonOne.style.backgroundColor="rgb(255, 122, 55)";


nextButton.onclick=ButtonSix.onclick=function()
{
    sliderCon.style.animation="none";

    sliderCon.style.left = "-1250px";

    nextButton.style.visibility = "hidden";

    prevButton.classList.remove('disabled');

    ButtonSix.style.backgroundColor = "rgb(255, 122, 55)";

    ButtonOne.style.backgroundColor = null;      
}


prevButton.onclick=ButtonOne.onclick=function()
{
    
    sliderCon.style.left = 0;

    prevButton.classList.add('disabled');

    nextButton.classList.remove("disabled");

    nextButton.style.visibility = "visible";

    ButtonSix.style.backgroundColor = null;

    ButtonOne.style.backgroundColor = "rgb(255, 122, 55)";
}
>>>>>>> 1acad07bfb5318569b515772b69e732e7d7e117f
