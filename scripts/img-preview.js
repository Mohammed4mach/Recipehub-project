/*
    Copyright reserved Moha4Mach & Qabbary
*/

let fileUpload = document.querySelector(`.fileUpload-previewer`);
let imgPreview = document.querySelector(`.img-previewer`);

fileUpload.addEventListener("change",
    (event) => {
        if(event.target.files.length > 0)
        {
            console.log("Reached");
            imgPreview.src = URL.createObjectURL(event.target.files[0]);
        }
    }
);
