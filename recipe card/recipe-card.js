let nextButton = document.getElementById("next"),

    prevButton = document.getElementById("prev"),

    sliderCon = document.getElementById("cards-container"),

    ButtonOne = document.getElementById('one'),

    ButtonSix = document.getElementById('six');


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

//--------------------------------------------------------------
//--------------------------------------------------------------

/*var cards = Array.from(document.querySelectorAll(".card"));
var slidesCount = cards.length;
var currentSlide = 1;

prevButton.onclick = prevSlide;
nextButton.onclick = nextSlide;

for(var i=1; i<=slidesCount; i++){

    var paginationItem = document.createElement('div');

    paginationItem.setAttribute('data-index', i);

    document.getElementById('slider2').appendChild(paginationItem);
}

document.getElementById('slider2').appendChild(paginationItem);

var paginationCreatedUl = document.getElementById('slider2');

var paginationBullets = Array.from(document.querySelectorAll('#slider2 div'));


for(var i = 0; i < paginationBullets.length; i++){

    paginationBullets[i].onclick = function(){
        
        currentSlide = parseInt(this.getAttribute('data-index'));

        theChecker();

    }

}


function theChecker(){

    removeAllActive();

    cards[currentSlide-1].classList.add('active');

    paginationCreatedUl.children[currentSlide-1].classList.add('active');

    if(currentSlide == 1){
            
        prevButton.classList.add('disabled');
        
    }else{

        prevButton.classList.remove('disabled');

    }

    if(currentSlide == slidesCount){

        nextButton.classList.add('disabled');

    }else{

        nextButton.classList.remove('disabled');

    }

}

theChecker();

function removeAllActive() {
    
    cards.forEach(function (card){

        card.classList.remove('active');

    });
    

    paginationBullets.forEach(function (bullet){

        bullet.classList.remove('active');

    });

}

function nextSlide(){
    
    if(nextButton.classList.contains('disabled')){
        
        return false;

    }else{

        currentSlide++;

        theChecker();

    }
}

function prevSlide(){

    if(prevButton.classList.contains('disabled')){
        
        return false;

    }else{

        currentSlide--;

        theChecker();

    }
}*/

