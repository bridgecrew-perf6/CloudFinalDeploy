import { Controller } from '@hotwired/stimulus';


export default class extends Controller {

    connect() {};


    // Creates the preview panel above the message input
    preview() {
        this.clearPreviews();
        // Loop through each attachments and display them in preview panel
        for (let i = 0; i < this.targets.element.files.length; i++) {
            let file = this.targets.element.files[i];
            const reader = new FileReader();
            this.createAndDisplayFilePreviewElements(file, reader);
        }
    };


    // Method to display an attachment in preview panel
    createAndDisplayFilePreviewElements(file, reader) {
        reader.onload = () => {
            // Create Element and Set its attributes
            let element = this.constructPreviews(file, reader);
            element.src = reader.result;
            element.setAttribute("href", reader.result);
            element.setAttribute("target", "_blank");
            element.classList.add("attachment-preview");

            // Add element to Preview Panel
            document.getElementById("attachment-previews").appendChild(element);
        };
        reader.readAsDataURL(file);
    };



    // Create a preview of a file
    constructPreviews(file, reader) {
        let element;
        // Method to remove Previews - passed down to create buttons
        let cancelFunction = e => this.removePreview(e);

        // Check file type and create element
        switch (file.type) {
            case "image/jpeg":
            case "image/png":
            case "image/gif":
                element = this.createImageElement(cancelFunction, reader);
                break;
            case "video/mp4":
            case "video/quicktime":
                element = this.createVideoElement(cancelFunction);
                break;
            case "audio/mpeg":
            case "audio/mp3":
            case "audio/wav":
                element = this.createAudioElement(cancelFunction);
                break;
            default:
                element = this.createDefaultElement(cancelFunction);
        }

        // Set name of element
        element.dataset.filename = file.name
        return element;
    };


    // Create Image Elements
    createImageElement(cancelFunction, reader) {
        let cancelUploadButton, element;
        // Create new Image element
        const image = document.createElement("img");
        // Set the Image to be result from reader passed down
        image.setAttribute("style", "background-image: url(" + reader.result + ")");
        // Set CSS
        image.classList.add("preview-image");

        // Create a div to wrap around image and delete button
        element = document.createElement("div");
        element.classList.add("attachment-image-container", "file-removal");
        element.appendChild(image);

        // Create delete Preview Button
        cancelUploadButton = document.createElement("i");
        cancelUploadButton.classList.add("bi", "bi-x-circle-fill", "cancel-upload-button");
        cancelUploadButton.onclick = cancelFunction;
        element.appendChild(cancelUploadButton);
        return element;
    };


    // Create Audio Elements
    createAudioElement(cancelFunction) {
        let cancelUploadButton, element;
        // Create Icon to represent audio
        element = document.createElement("i");
        element.classList.add("bi", "bi-file-earmark-music-fill", "audio-preview-icon", "file-removal");

        // Delete Icon
        cancelUploadButton = document.createElement("i");
        cancelUploadButton.classList.add("bi", "bi-x-circle-fill", "cancel-upload-button");
        cancelUploadButton.onclick = cancelFunction;
        element.appendChild(cancelUploadButton);
        return element;
    };


    // Create Video Elements
    createVideoElement(cancelFunction) {
        let cancelUploadButton, element;
        // Create Icon to represent Video
        element = document.createElement("i");
        element.classList.add("bi", "bi-file-earmark-play-fill", "video-preview-icon", "file-removal");

        // Delete Icon
        cancelUploadButton = document.createElement("i");
        cancelUploadButton.classList.add("bi", "bi-x-circle-fill", "cancel-upload-button");
        cancelUploadButton.onclick = cancelFunction;
        element.appendChild(cancelUploadButton);
        return element;
    };



    // Create Default Elements for all other files
    createDefaultElement(cancelFunction) {
        let cancelUploadButton, element;
        // Create Icon to represent file
        element = document.createElement("i");
        element.classList.add("bi", "bi-file-check-fill", "file-preview-icon", "file-removal");

        // Delete Icon
        cancelUploadButton = document.createElement("i");
        cancelUploadButton.classList.add("bi", "bi-x-circle-fill", "cancel-upload-button");
        cancelUploadButton.onclick = cancelFunction;
        element.appendChild(cancelUploadButton);
        return element;
    };


    // Method to remove a Preview when button clicked
    removePreview(event) {
        // Grab closest preview to the event
        const target = event.target.parentNode.closest(".attachment-preview");
        // Create data transfer so we can remove item form data list
        const dataTransfer = new DataTransfer();
        let fileInput = document.getElementById("message_attachments");
        let files = fileInput.files;
        // Transfer it to an array
        let filesArray = Array.from(files);

        // Filter out the file from array
        filesArray = filesArray.filter(file => {
            let filename = target.dataset.filename;
            return file.name !== filename;
        });

        // Remove File form parent and rewrite datatransfer and data list
        target.parentNode.removeChild(target);
        filesArray.forEach(file => dataTransfer.items.add(file));
        fileInput.files = dataTransfer.files;
    };




    // Method to clear the previews
    clearPreviews() {
        document.getElementById("attachment-previews").innerHTML = "";
    };
};