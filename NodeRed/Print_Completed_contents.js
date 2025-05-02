// Verifica si el modelo está definido (máquina conectada)
if (!msg.payload || !msg.payload.fullModel || !msg.payload.fullModel.state) {
    return [null, null];  // No hacer nada si no hay datos
}

let currentStatus = msg.payload.fullModel.state.status;
let previousStatus = context.get('previousStatus') || '';

context.set('previousStatus', currentStatus);

if (previousStatus === 'processing' && currentStatus === 'idle') {
    // Salida 1: booleano true
    let msg1 = { payload: true };

    // Salida 2: texto
    let msg2 = { payload: "print_completed" };

    return [msg1, msg2];
}

// No hay transición -> no enviar nada
return [null, null];
