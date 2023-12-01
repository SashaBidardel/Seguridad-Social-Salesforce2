trigger AfterDeletePensionista on Pensionista__c (after delete) {
    List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();

    for (Pensionista__c deletedPensionista : Trigger.old) {
        
        // Crear y configurar el correo electrónico
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new List<String>{ deletedPensionista.correo__c });
        email.setSubject('Fallecimiento del pensionista');
        // Mensaje personalizado basado en el campo 'bueno__c'
        String mensaje = 'Sr/Sra ' + deletedPensionista.Name + ' ' + deletedPensionista.Apellidos__c;
        mensaje += deletedPensionista.bueno__c ? ' ha sido buen@, bienvenido al cielo!!!' : ' ha sido mal@, bienvenid@ al infierno!!!';
        email.setPlainTextBody(mensaje);
        emailsToSend.add(email);
    }
    

    // Enviar correos electrónicos
    if (!emailsToSend.isEmpty()) {
        Messaging.SendEmailResult[] emailResults = Messaging.sendEmail(emailsToSend);
       
    }
}
