trigger pensionista on Pensionista__c (after update) {
    List<Contact> contactsToUpdate = new List<Contact>();
    List<Id> pensionistasToDelete = new List<Id>();

    for (Pensionista__c newPensionista : Trigger.new) {
        Pensionista__c oldPensionista = Trigger.oldMap.get(newPensionista.Id);
        
        if (oldPensionista.Vivo__c && newPensionista.Vivo__c) {
            // Consulta para encontrar el contacto relacionado con el mismo número de identificación
            List<Contact> relatedContacts = [
                SELECT Id, Title, FirstName, LastName, Email
                FROM Contact
                WHERE Title = :newPensionista.Numero_Identificacion__c
                LIMIT 1
            ];

            if (!relatedContacts.isEmpty()) {
                Contact relatedContact = relatedContacts[0];
                relatedContact.FirstName = newPensionista.Name;
                relatedContact.LastName = newPensionista.Apellidos__c;
                relatedContact.Email = newPensionista.correo__c;
                contactsToUpdate.add(relatedContact);
            }
        } else if (oldPensionista.Vivo__c && !newPensionista.Vivo__c) {
            pensionistasToDelete.add(newPensionista.Id);
        }
    }

    if (!contactsToUpdate.isEmpty()) {
        update contactsToUpdate;
    }

    if (!pensionistasToDelete.isEmpty()) {
        // Llama al método para eliminar pensionistas y sus contactos relacionados
        PensionistaHandler.deletePensionistas(pensionistasToDelete);
    }
}

 









