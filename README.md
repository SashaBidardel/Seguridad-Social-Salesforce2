# Segurida Social Salesforce 2

En esta nueva parte añado 3 nuevos campos al objeto pensionista__c : El booleano vivo__c para saber si un pensionista está vivo o no, el tipo email correo__c para poder comunicarme con el pensionista y el booleano bueno__c para saber si es buena persona o no.Tenemos estas especificaciones:

1.Cada vez que creamos un nuevo pensionista creamos un contacto relacionado con ese registro que tiene en sus campos nombre,apellidos y correo los mismos que el pensionista y en el campo cargo el número de identificación(tuve que hacer ese arreglo porque para hacer flows no me dejaba hacer relaciones con un campo que creé dni__c y busqué ese "arreglo")

2.No se puede crear un pensionista con el campo vivo__c a false, nos sale un mensaje de error

3.Cada vez que actualizamos un registro de pensionista actualizamos su contacto relacionado

4.Cada vez que actualizamos un registro pensionista y cambiamos el campo vivo__c a false se elimina ese registro y su contacto asociado

5.Cada vez que eliminamos un registro pensionista(con su contacto asociado en cadena) se manda un correo al pensionista dándole la bienvenida al cielo o al infierno dependiendo de si ha sido bueno o malo respectivamente.

