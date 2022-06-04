/*
    Developed by Moha4Mach

    Note:
        This slider work with odd number of cards well, though with even number does not work very well
*/

let list_slider = document.querySelectorAll(`.list-slider`),
    slide_left = document.querySelectorAll(`.slide-left`),
    slide_right = document.querySelectorAll(`.slide-right`);


let slideLeft = function(slider)
{
    let page_centerX = document.body.clientWidth / 2;
    let last_child = slider.children[slider.children.length - 1],
    last_child_coordX = last_child.offsetLeft + slider.offsetLeft + last_child.offsetWidth / 2;;

    let slider_left = slider.style.left || 0,
    style = window.getComputedStyle(last_child),
    offset = last_child.offsetWidth + parseInt(style.marginLeft.split(`px`)[0]) + parseInt(style.marginRight.split(`px`)[0]);
    offset *= -1;
    offset += parseInt(slider.style.left.split(`px`)[0] || 0);

    if(last_child_coordX > page_centerX)
    {
        slider.style.left = `${offset}px`;
    }
}

let slideRight = function(slider)
{
    let page_centerX = document.body.clientWidth / 2;
    let first_child = slider.children[0],
    first_child_coordX = first_child.offsetLeft + slider.offsetLeft + first_child.offsetWidth;

    let slider_left = slider.style.left || 0,
    style = window.getComputedStyle(first_child),
    offset = first_child.offsetWidth + parseInt(style.marginLeft.split(`px`)[0]) + parseInt(style.marginRight.split(`px`)[0]);
    offset += parseInt(slider.style.left.split(`px`)[0] || 0);

    if(first_child_coordX < page_centerX)
    {
        slider.style.left = `${offset}px`;
    }
}

// Functionality for first slider
slide_left[0].onclick = function()
{
    slideLeft(list_slider[0]);
}
slide_right[0].onclick = function()
{
    slideRight(list_slider[0]);
}

// Functionality for second slider
slide_left[1].onclick = function()
{
    slideLeft(list_slider[1]);
}
slide_right[1].onclick = function()
{
    slideRight(list_slider[1]);
}
