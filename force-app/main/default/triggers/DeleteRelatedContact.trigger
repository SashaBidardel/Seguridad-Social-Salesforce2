trigger DeleteRelatedContact on Pensionista__c (before delete) {
    Set<String> dniSet = new Set<String>();

    for (Pensionista__c p : Trigger.old) {
        dniSet.add(p.Numero_Identificacion__c);
    }

    List<Contact> contactsToDelete = [SELECT Id FROM Contact WHERE title IN :dniSet];

    if (!contactsToDelete.isEmpty()) {
        delete contactsToDelete;
    }
}

