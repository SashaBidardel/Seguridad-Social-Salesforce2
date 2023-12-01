public class PensionistaHandler {
    @future
    public static void deletePensionistas(List<Id> pensionistaIds) {
        delete [SELECT Id FROM Pensionista__c WHERE Id IN :pensionistaIds];
    }
}

