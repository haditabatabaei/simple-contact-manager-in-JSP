<%@ page import="data.Contacts" %>
<%@ page import="data.Contact" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    String title = "contact manager";
    Contacts contacts = new Contacts(new File("C:\\Users\\Hadi\\Desktop\\contacts.txt"));
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Contact Manager</title>
</head>


<body>
<section class="container-fluid p-0">
    <h2 class="text-center bg-info" style="color:white;width:100%;padding-bottom:5px">
        HADI - Simple Contact Manager
    </h2>
</section>
<section class="container">
    <div class="row">
        <div class="col-md-4">
            <form action="index.jsp" method="post">
                <div class="form-group">
                    <div class="input-group mb-2">
                        <div class="input-group-prepend w-100">
                            <span class="input-group-text">Contact Name:</span>
                            <input type="text" class="form-control" id="contactName" name="contactName"
                                   aria-describedby="contactNameDesc"
                                   placeholder="Contact Name"
                                   style="border-bottom-left-radius: 0;border-top-left-radius: 0">
                        </div>
                    </div>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend w-100">
                            <span class="input-group-text">Phone Number:</span>
                            <input type="text" class="form-control" id="contactPhoneNumber" name="contactPhoneNumber"
                                   aria-describedby="phoneNumberDesc"
                                   placeholder="Phone Number"
                                   style="border-bottom-left-radius: 0;border-top-left-radius: 0">
                        </div>
                        <button type="submit" class="btn btn-success mt-2 w-100">Add Contact</button>
                    </div>
                </div>
            </form>
            <hr>
            <form action="index.jsp" method="post">
                <button type="submit" class="btn btn-info mb-2 w-100" name="showContacts">Show All Contacts</button>
                <button type="submit" class="btn btn-danger mb-2 w-100" name="removeLastContact">Remove Last Contact
                </button>
            </form>
            <hr>

        </div>
        <div class="col-md">
            <% if (request.getMethod().equals("POST")) {
                Enumeration parameters = request.getParameterNames();
                boolean addContact = false;
                boolean editContact = false;
                String newName = "", newPhone = "";
                Contact toEdit = null;
                int indexToEdit = 0;
                Contact toAdd = new Contact("test", "test");
                while (parameters.hasMoreElements()) {
                    String currentName = parameters.nextElement().toString();
                    String currentValue = request.getParameter(currentName);
                    if (currentName.equals("showContacts")) {
                        if (contacts.getContactsArrayList().size() != 0) {
                            out.print("<form action=\"index.jsp\" method=\"post\" class=\"w-100\" >");
                            out.print("<div class=\"input-group mb-1\">");
                            out.print("<div class=\"input-group-prepend\">");
                            out.print("<div class=\"input-group-text\">");
                            out.print("<input type=\"checkbox\" disabled>");
                            out.print("</div>");
                            out.print("</div>");
                            out.print("" +
                                    "<input type=\"text\" value=\"Contact Name\" class=\"form-control\" readonly>\n"
                                    +
                                    "<input type=\"text\" value=\"Contact Phone Number\" class=\"form-control\" readonly>\n");
                            out.print("</div>");

                            for (int i = 0; i < contacts.getContactsArrayList().size(); i++) {
                                Contact currentContact = contacts.getContactsArrayList().get(i);

                                out.print("<div class=\"input-group mb-1\">");
                                out.print("<div class=\"input-group-prepend\">");
                                out.print("<div class=\"input-group-text\">");
                                out.print("<input type=\"checkbox\" name=\"" + i + "\" id=\"" + i + "\" >");

                                out.print("</div>");
                                out.print("</div>");
                                out.print("" +
                                        "<input type=\"text\" value=\"" + currentContact.getName() + "\" class=\"form-control\" contactNameWithId=\"" + i + "\" readonly>\n"
                                        +
                                        "<input type=\"text\" value=\"" + currentContact.getPhoneNum() + "\" class=\"form-control\" contactPhoneWithId=\"" + i + "\" readonly>\n");
                                out.print("</div>");

                            }

                            out.print("<button type=\"submit\" class=\"btn btn-dark w-50\" name=\"rsc\">Delete All Selected Contacts</button>");
                            out.print("<button id=\"editContactButton\" class=\"btn btn-light w-50\" name=\"esc\" data-toggle=\"modal\" data-target=\"#editContactModal\" >Edit Selected Contact </button>");
                            out.print("</form>");
                        } else {
            %>
            <p>Contacts list is empty</p>
            <%
                            }
                            break;
                        } else if (currentName.equals("removeLastContact")) {
                            if (contacts.removeIndex(contacts.getContactsArrayList().size() - 1)) {
                                out.print("<p>Last contact deleted.</p>");
                            } else {
                                out.print("<p>Contacts list is empty.</p>");
                            }
                            break;
                        } else if (currentName.equals("rsc")) {
                            ArrayList<Integer> toDeleteIndexes = new ArrayList<>();
                            for (String key : request.getParameterMap().keySet())
                                if (!key.equals("rsc")) {
                                    toDeleteIndexes.add(Integer.parseInt(key));
                                }
                            Collections.sort(toDeleteIndexes, Collections.reverseOrder());
                            for (Integer index : toDeleteIndexes) {
                                contacts.removeIndex(index);
                            }
                            out.print("<p>Contacts removed</p>");
                            break;
                        } else if (currentName.equals("editContactId")) {
                            indexToEdit = Integer.parseInt(currentValue);
                            System.out.println(indexToEdit);
//                            toEdit = contacts.getContactsArrayList().get(indexToEdit);
                            editContact = true;
//                            out.write("Index received from server");
                        } else if (currentName.equals("newName")) {
                            newName = currentValue;
                        } else if (currentName.equals("newPhone")) {
                            newPhone = currentValue;
                        } else if (currentName.equals("contactName")) {
                            toAdd.setName(currentValue);
                            addContact = true;
                        } else if (currentName.equals("contactPhoneNumber"))
                            toAdd.setPhoneNum(currentValue);
                    }
                    String toPrint;
                    if (addContact) {
                        if (contacts.addContact(toAdd.getName(), toAdd.getPhoneNum())) {
                            toPrint = "contact added.";
                        } else {
                            toPrint = "contact not added.";
                        }
                        out.print("<p>" + toPrint + "</p>");
                    }
                    if (editContact) {
                        contacts.editContact(indexToEdit, newName, newPhone);
                        out.print("<p> Contact Edited <br> see all contacts for changes</p>");
                    }
                }

            %>
        </div>
    </div>
</section>
<%--<button id="editModalButton" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"--%>
<%--data-whatever="@getbootstrap">Open modal for @getbootstrap--%>
<%--</button>--%>

<div class="modal fade" id="editContactModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit Contact</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form action="" method="">
                    <div class="form-group">
                        <div class="input-group mb-1">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <span>Contact Data:</span>
                                </div>
                            </div>
                            <input type="text" value="Data" class="form-control" id="contactNameInModal">
                            <input type="text" value="Data" class="form-control" id="contactPhoneInModal">
                        </div>
                        <%--<label for="recipient-name" class="col-form-label">Recipient:</label>--%>
                        <%--<input type="text" class="form-control" id="recipient-name">--%>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="modalEditButton">Edit contact</button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="editContact.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"--%>
        <%--integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"--%>
        <%--crossorigin="anonymous"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>