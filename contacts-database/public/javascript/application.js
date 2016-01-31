
$(function() {

  var handlers = {
    container: $('#contacts').find('tbody'),
    createContact: function createContact(contact) {
      var tr = $('<tr>').prependTo(handlers.container),
      deleteButton = $('<button>').addClass('delete-button').attr('data-id', contact.id).text('Delete'),
      editButton = $('<button>').addClass('edit-button').attr('data-id', contact.id).text('Edit');

      // $('<td>').text(contact.id).appendTo(tr).css('display: none;'),
      $('<td>').text(contact.firstname).appendTo(tr),
      $('<td>').text(contact.lastname).appendTo(tr),
      $('<td>').text(contact.email).appendTo(tr),
      $('<td>').html(editButton).appendTo(tr),
      $('<td>').html(deleteButton).appendTo(tr);
    },
    listContacts: function() {
      $.ajax({
        url: '/contacts',
        method: 'GET',
        success: function(contacts) {
          // contacts is an array of values from the get request
          $.each(contacts, function(index, contact) {
            handlers.createContact(contact);
          });
        },
        error: function() {
          alert('Error loading orders');
        },
      });
    },
    addContacts: function() {
      var contact = {
        firstname: $('#firstname').val(),
        lastname: $('#lastname').val(),
        email: ('#email').val(),
      };

      $.ajax({
        url: '/contacts',
        method: 'POST',
        data: contact,
        // posting to the backend, waiting for it to be
        // successfull, if it is, append it.
        success: function(newContact) {
          handlers.createContact(newContact);
          // triggering reset refreshes the page, or at least appears to
          // $('#new-contact-form').trigger("reset");
        },
        error:function() {
          alert('Error saving contact');
        },
      });
      return false;
    },
    deleteContact: function() {
      $.ajax({
        url: '/contacts/' + $('#delete-contact').attr("data-id"),
        method: 'DELETE',
        data: contact,
        success: function(contact) {
          console.log("Deleted")
        },
        error:function() {
          alert('Error deleting contact');
        },
      });
    },
  };

  handlers.listContacts();
  $('#add-contact').on('click', handlers.addContact);



  // Put Request
  // TODO: Add event handler
  // $.ajax({
  //   url: '/contacts/id',
  //   method: 'PUT',
  //   data: contact,
  //   success: function(contact) {
  //     console.log("Edited")
  //   },
  //   error:function() {
  //     alert('Error saving contact');
  //   },
  // });

  // Delete Request
  // $('#delete-contact').on('click', function() {
  // // TODO: Add event handler
  //
  // });

});
