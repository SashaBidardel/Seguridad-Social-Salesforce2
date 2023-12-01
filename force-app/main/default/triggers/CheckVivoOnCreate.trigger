trigger CheckVivoOnCreate on Pensionista__c (before insert) {
    for (Pensionista__c p : Trigger.new) {
        if (!p.Vivo__c) {
            p.addError('No se pueden crear pensionistas no vivos.');
        }
    }
}
