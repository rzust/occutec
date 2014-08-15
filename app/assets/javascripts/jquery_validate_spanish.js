jQuery.extend(jQuery.validator.messages, {
    required: "Este campo es obligatorio.",
    remote: "Por favor, arregle este campo.",
    email: "Por favor, ingrese una dirección de correo válida.",
    url: "Por favor, ingrese una URL válida.",
    date: "Por favor, ingrese una fecha válida.",
    dateISO: "Por favor, ingrese una fecha válida (ISO).",
    number: "Por favor, ingrese un número válido.",
    digits: "Use solo dígitos.",
    creditcard: "Por favor, ingrese un numero de tarjeta válido.",
    equalTo: "Por favor, ingrese el mismo valor.",
    accept: "Por favor, ingrese un valor con una extensión válida.",
    maxlength: jQuery.validator.format("Por favor, no ingrese más de {0} caracteres."),
    minlength: jQuery.validator.format("Por favor, ingrese por lo menos {0} caracteres."),
    rangelength: jQuery.validator.format("Por favor, ingrese un valor que contenga entre {0} & {1} caracteres."),
    range: jQuery.validator.format("Por favor, ingrese un valor entre {0} & {1}."),
    max: jQuery.validator.format("Por favor, ingrese un valor menor o igual a {0}."),
    min: jQuery.validator.format("Por favor, ingrese un valor mayor o igual a {0}.")
});