var contactName, contactPhone, selectedCheckBoxId;
$("#editContactButton").click(function (event) {
    event.preventDefault();
    var inputElements = document.getElementsByTagName("input");
    var numberOfCheckboxes = 0;
    var numberOfSelectedCheckboxes = 0;
    var listOfCheckboxes = [];

    for (var i = 0; i < inputElements.length; i++) {
        var currentInput = inputElements.item(i);
        if (currentInput.type.match("checkbox")) {
            numberOfCheckboxes++;
            listOfCheckboxes.push(currentInput);

            if (currentInput.checked)
                numberOfSelectedCheckboxes++;
        }
    }

    if (numberOfSelectedCheckboxes === 1) {
        var selectedCheckbox;
        for (var i = 0; i < listOfCheckboxes.length; i++) {
            if (listOfCheckboxes[i].checked) {
                selectedCheckbox = listOfCheckboxes[i];
                break;
            }
        }
        selectedCheckBoxId = selectedCheckbox.id;
        contactPhone = $("input[contactPhoneWithId=" + selectedCheckBoxId + "]").val();
        contactName = $("input[contactNameWithId=" + selectedCheckBoxId + "]").val();
        console.log("Selected checkbox id using jquery after clicked on modal:" + selectedCheckBoxId + "\n" + contactName + ":" + contactPhone)
        event.default;
        $("#contactNameInModal").val(contactName);
        $("#contactPhoneInModal").val(contactPhone);
    } else
        window.alert("You must select exactly one contact to edit")
});


$("#modalEditButton").click(function (event) {
    console.log("edit button in modal clicked.");
    var newContactName, newContactPhoneNumber;
    newContactName = $("#contactNameInModal").val();
    newContactPhoneNumber = $("#contactPhoneInModal").val();
    var request = jQuery.ajax({
        url: "index.jsp",
        method: "POST",
        data: { editContactId: selectedCheckBoxId, newName: newContactName, newPhone: newContactPhoneNumber },
        success: function (response) {
            document.write(response);
        }
    });

    // request.done(function( msg ) {
    //     alert("message from server in done ajax : " + msg)
    // });
    //
    // request.fail(function( jqXHR, textStatus ) {
    //     alert( "message in fail ajax: " + textStatus );
    // });
});

// $('#editContactModal').on('show.bs.modal', function (event) {
//     console.log("modal launched.")
//     var button = $(event.relatedTarget) // Button that triggered the modal
//     // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
//     // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
//     var modal = $(this)
//     // modal.find('.modal-title').text('New message to ' + recipient)
//     $("#contactNameInModal").val(contactName);
//     $("#contactPhoneInModal").val(contactPhone);
//     console.log("modal updated")
//     // modal.find('.modal-boy input')
// })