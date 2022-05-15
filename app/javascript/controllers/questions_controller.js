import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    connect() { };

    // Method to handle toggling Edit mode on and off
    toggleAnswer(event) {
        console.log("I clicked the button");
        // Prevent Page from refreshing
        event.preventDefault();
        // Prevent Page from popping up to top of screen
        event.stopPropagation();

        // Get Answer Div Id
        const answerID = event.params["answer"];
        // Get Toggle Button Id
        const toggleButtonID = event.params["toggle"];

        // Grab Answer Div using Id
        const answer = document.getElementById(answerID);
        // Toggle Visability
        answer.classList.toggle("d-none");


        // Grab Toggle Button using Id
        const toggleButton = document.getElementById(toggleButtonID);
        // Call toggle Edit Button method on the Edit Button
        this.changeToggleButton(toggleButton);
    };


    // Method to change Inner Html of Edit Button
    changeToggleButton(toggleButton) {
        // Check if Innertext is Edit
        if (toggleButton.innerText === "Show Answer") {
            // Change text to cancel
            toggleButton.innerText = "Hide Answer";
            // Toggle CSS class
            this.changeButtonCssClass(toggleButton);

        } else {
            // Change Text to Edit
            toggleButton.innerText = "Show Answer";
            // Toggle CSS class
            this.changeButtonCssClass(toggleButton);
        }
    };


    // Method to toggle CSS class of edit button
    changeButtonCssClass(toggleButton) {
        // Flip Button Styling
        toggleButton.classList.toggle("btn-danger");
        toggleButton.classList.toggle("btn-warning");
    }
};