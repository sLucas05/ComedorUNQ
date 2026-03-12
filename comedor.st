!classDefinition: #Test category: 'TrabajoFinal-Grupo-3'!
TestCase subclass: #Test
	instanceVariableNames: 'fondos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:41:40'!
test01_alCrearUnComedorNoTieneFondos

	| comedor |
	
	comedor := Comedor new.
	
	Assert that:  comedor fondos isEqualTo: 0 * peso.! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:41:45'!
test02_unComedorPuedeRegistrarUnComensal

	|  comedor unComensal |
	
	comedor := Comedor new.
	
	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.
	
	comedor registrar: unComensal.
	
	Assert isFalse: unComensal tarjeta esNula.! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:41:55'!
test03_unComedorConoceSusDiasHabiles

	|  comedor dia |

	comedor := Comedor new.
	
	dia := Monday. "Lunes"
	Assert isTrue: [comedor esDiaHabil: dia].
	
	dia := Tuesday. "Martes"
	Assert isTrue: [comedor esDiaHabil: dia].
	
	dia := Wednesday. "Miercoles"
	Assert isTrue: [comedor esDiaHabil: dia].
	
	dia := Thursday. "Jueves"
	Assert isTrue: [comedor esDiaHabil: dia].
	
	dia := Friday. "Viernes"
	Assert isTrue: [comedor esDiaHabil: dia].
! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:41:59'!
test04_unComedorConoceSusDiasNoHabiles

	|  comedor dia |

	comedor := Comedor new.
	
	dia := Saturday. "Sabado"
	Assert isFalse: [comedor esDiaHabil: dia].
	
	dia := Sunday. "Domingo"
	Assert isFalse: [comedor esDiaHabil: dia].
! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:42:11'!
test05_unComedorConoceLosPedidosQueSuperanUnCiertoMonto

	| alfajor gaseosa menuDelDia unComedor unEstudiante pedidoCuatro pedidoDos pedidoTres pedidoUno |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	
	unComedor registrar: unEstudiante.
	
	unEstudiante tarjeta cargarSaldo: 7500 con: unEstudiante efectivo. 
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 250.
	gaseosa := ProductoDeGondola crearProductoConStock: 15 yPrecio: 150.
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	
	pedidoUno := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante tarjeta elDia: Thursday en: unComedor.
	alfajor agregarAlPedido: pedidoUno.
	gaseosa agregarAlPedido: pedidoUno.
	menuDelDia agregarAlPedido: pedidoUno.
	pedidoUno abonar.
	
	pedidoDos := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Monday en: unComedor.
	gaseosa agregarAlPedido: pedidoDos.
	pedidoDos abonar.
	
	pedidoTres := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante objetoPago elDia: Tuesday en: unComedor.
	menuDelDia agregarAlPedido: pedidoTres.
	pedidoTres abonar.
	
	pedidoCuatro := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante tarjeta elDia: Friday en: unComedor.
	alfajor agregarAlPedido: pedidoCuatro.
	pedidoCuatro abonar.
	
	Assert that: (unComedor pedidosQueSuperanElPrecioBase: 1000) isEqualTo: {pedidoUno. pedidoTres} asBag! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:42:17'!
test06_unComedorConoceLosPedidosConDescuentoQueSuperanUnCiertoMonto

	| alfajor gaseosa menuDelDia unComedor pedidoCuatro pedidoDos pedidoTres pedidoUno unPersonal |
	
	unComedor := Comedor new.
	
	unPersonal := Personal crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	
	unComedor registrar: unPersonal.
	
	unPersonal tarjeta cargarSaldo: 7500 con: unPersonal efectivo. 
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 250.
	gaseosa := ProductoDeGondola crearProductoConStock: 15 yPrecio: 150.
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	
	pedidoUno := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal tarjeta elDia: Thursday en: unComedor.
	alfajor agregarAlPedido: pedidoUno.
	gaseosa agregarAlPedido: pedidoUno.
	menuDelDia agregarAlPedido: pedidoUno.
	pedidoUno abonar.
	
	pedidoDos := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal efectivo elDia: Monday en: unComedor.
	gaseosa agregarAlPedido: pedidoDos.
	pedidoDos abonar.
	
	pedidoTres := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal tarjeta elDia: Tuesday en: unComedor.
	menuDelDia agregarAlPedido: pedidoTres.
	pedidoTres abonar.
	
	pedidoCuatro := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal objetoPago elDia: Friday en: unComedor.
	alfajor agregarAlPedido: pedidoCuatro.
	pedidoCuatro abonar.
	
	Assert that: (unComedor pedidosQueSuperanElPrecioConDescuento: 1080) isEqualTo: {pedidoUno} asBag! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:42:21'!
test07_unComedorConoceLosPedidosRealizadosPorExternos

	| alfajor gaseosa menuDelDia unComedor pedidoCuatro pedidoDos pedidoTres pedidoUno unPersonal unExterno |
	
	unComedor := Comedor new.
	
	unPersonal := Personal crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	unExterno := Externo crearComensalConLegajo: 32682426 yEfectivo: 5000 conSaldoEnObjetoPago: 7500.
	
	unComedor registrar: unPersonal.
	unComedor registrar: unExterno.
	
	unPersonal tarjeta cargarSaldo: 7500 con: unPersonal efectivo. 
	unExterno tarjeta cargarSaldo: 2500 con: unExterno efectivo. 
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 250.
	gaseosa := ProductoDeGondola crearProductoConStock: 15 yPrecio: 150.
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	
	pedidoUno := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal tarjeta elDia: Thursday en: unComedor.
	alfajor agregarAlPedido: pedidoUno.
	gaseosa agregarAlPedido: pedidoUno.
	menuDelDia agregarAlPedido: pedidoUno.
	pedidoUno abonar.
	
	pedidoDos := Pedido crearPedidoPara: unExterno conMetodoDePago: unExterno efectivo elDia: Monday en: unComedor.
	gaseosa agregarAlPedido: pedidoDos.
	pedidoDos abonar.
	
	pedidoTres := Pedido crearPedidoPara: unExterno conMetodoDePago: unExterno tarjeta elDia: Tuesday en: unComedor.
	alfajor agregarAlPedido: pedidoTres.
	pedidoTres abonar.
	
	pedidoCuatro := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal objetoPago elDia: Friday en: unComedor.
	menuDelDia agregarAlPedido: pedidoCuatro.
	pedidoCuatro abonar.
	
	Assert that: (unComedor pedidosRealizadosPorComensalesExternos) isEqualTo: {pedidoDos. pedidoTres} asBag! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:42:29'!
test08_unComedorConoceLosPedidosRealizadosUnDiaEnEspecifico

	| alfajor gaseosa menuDelDia unComedor pedidoCuatro pedidoDos pedidoTres pedidoUno unPersonal unExterno |
	
	unComedor := Comedor new.
	
	unPersonal := Personal crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	unExterno := Externo crearComensalConLegajo: 32682426 yEfectivo: 5000 conSaldoEnObjetoPago: 7500.
	
	unComedor registrar: unPersonal.
	unComedor registrar: unExterno.
	
	unPersonal tarjeta cargarSaldo: 7500 con: unPersonal efectivo. 
	unExterno tarjeta cargarSaldo: 2500 con: unExterno efectivo. 
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 250.
	gaseosa := ProductoDeGondola crearProductoConStock: 15 yPrecio: 150.
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	
	pedidoUno := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal tarjeta elDia: Thursday en: unComedor.
	alfajor agregarAlPedido: pedidoUno.
	gaseosa agregarAlPedido: pedidoUno.
	menuDelDia agregarAlPedido: pedidoUno.
	pedidoUno abonar.
	
	pedidoDos := Pedido crearPedidoPara: unExterno conMetodoDePago: unExterno efectivo elDia: Friday en: unComedor.
	gaseosa agregarAlPedido: pedidoDos.
	pedidoDos abonar.
	
	pedidoTres := Pedido crearPedidoPara: unExterno conMetodoDePago: unExterno tarjeta elDia: Tuesday en: unComedor.
	alfajor agregarAlPedido: pedidoTres.
	pedidoTres abonar.
	
	pedidoCuatro := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal objetoPago elDia: Friday en: unComedor.
	menuDelDia agregarAlPedido: pedidoCuatro.
	pedidoCuatro abonar.
	
	Assert that: (unComedor pedidosRealizadosUnDia: Friday) isEqualTo: {pedidoDos. pedidoCuatro} asBag! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:43:14'!
test09_noCoincidenLosFondosDelComedorConLaSumaDeLosPedidos

	| alfajor gaseosa menuDelDia unComedor pedidoUno unPersonal |
	
	unComedor := Comedor new.
	
	unPersonal := Personal crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	
	unComedor registrar: unPersonal.
	
	unPersonal tarjeta cargarSaldo: 7500 con: unPersonal efectivo. 
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 250.
	gaseosa := ProductoDeGondola crearProductoConStock: 15 yPrecio: 150.
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	
	pedidoUno := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal tarjeta elDia: Thursday en: unComedor.
	alfajor agregarAlPedido: pedidoUno.
	gaseosa agregarAlPedido: pedidoUno.
	menuDelDia agregarAlPedido: pedidoUno.
	
	unComedor agregarPedido: pedidoUno.
	
	Assert should: [pedidoUno abonar] signal: PreconditionFailure withDescription: unComedor laRecaudacionNoCoincide.! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/27/2025 01:20:27'!
test10_unComedorSabeCuantosMenuesDelDiaVendio

	| menuDelDia unComedor pedidoUno unPersonal pedidoDos alfajor |
	
	unComedor := Comedor new.
	
	unPersonal := Personal crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	
	unComedor registrar: unPersonal.
	
	unPersonal tarjeta cargarSaldo: 7500 con: unPersonal efectivo. 
	
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 250.
	
	pedidoUno := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal tarjeta elDia: Thursday en: unComedor.
	menuDelDia agregarAlPedido: pedidoUno.
	alfajor agregarAlPedido: pedidoUno.
	pedidoUno abonar.
	
	pedidoDos := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal tarjeta elDia: Thursday en: unComedor.
	menuDelDia agregarAlPedido: pedidoDos.
	pedidoDos abonar.
	
	Assert that: unComedor cantidadDeMenuesDelDiaVendidos isEqualTo: 2. 
	
	! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:43:25'!
test11_unComedorSabeCuantosMenuesEstudiantilesVendio

	| menuDelDia unComedor pedidoUno pedidoDos menuEstudiantil unEstudiante |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	
	unComedor registrar: unEstudiante.
	
	unEstudiante tarjeta cargarSaldo: 7500 con: unEstudiante efectivo. 
	
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	menuEstudiantil := MenuEstudiantil crearProductoConStock: 5.
	
	pedidoUno := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante tarjeta elDia: Thursday en: unComedor.
	menuDelDia agregarAlPedido: pedidoUno.
	pedidoUno abonar.
	
	pedidoDos := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante tarjeta elDia: Thursday en: unComedor.
	menuEstudiantil agregarAlPedido: pedidoDos.
	pedidoDos abonar.
	
	Assert that: unComedor cantidadDeMenuesEstudiantilesVendidos isEqualTo: 1. 
	
	! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/27/2025 01:19:16'!
test12_unComedorSabeCuantosPedidosSeRealizaronLosLunesYSeAbonaronEnEfectivo

	| menuDelDia unComedor pedidoUno pedidoDos menuEstudiantil unEstudiante pedidoTres |
	
	unComedor := Comedor new.
	
	unEstudiante:= Estudiante crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	
	unComedor registrar: unEstudiante.
	
	unEstudiante tarjeta cargarSaldo: 7500 con: unEstudiante efectivo. 
	
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	menuEstudiantil := MenuEstudiantil crearProductoConStock: 5.
	
	pedidoUno := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Monday en: unComedor.
	menuDelDia agregarAlPedido: pedidoUno.
	pedidoUno abonar.
	
	pedidoDos := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Monday en: unComedor.
	menuEstudiantil agregarAlPedido: pedidoDos.
	pedidoDos abonar.
	
	pedidoTres := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante tarjeta elDia: Friday en: unComedor.
	menuDelDia agregarAlPedido: pedidoTres.
	pedidoTres abonar.
	
	Assert that: unComedor cantidadDePedidosRealizadosLosLunesAbonadosEnEfectivo isEqualTo: 2. 
	
	! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:43:31'!
test13_unComedorSabeCuantosDeSusGananciasEsPorComensalesExternos

	| menuDelDia unComedor pedidoUno pedidoDos menuEstudiantil unEstudiante unExterno pedidoTres snack |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	unExterno := Externo crearComensalConLegajo: 23664824 yEfectivo: 4500 conSaldoEnObjetoPago: 1500.
	
	unComedor registrar: unEstudiante.
	
	unEstudiante tarjeta cargarSaldo: 7500 con: unEstudiante efectivo. 
	
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	menuEstudiantil := MenuEstudiantil crearProductoConStock: 5.
	snack := ProductoDeGondola crearProductoConStock: 5 yPrecio: 500.
	
	pedidoUno := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Monday en: unComedor.
	menuDelDia agregarAlPedido: pedidoUno.
	pedidoUno abonar.
	
	pedidoDos := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Monday en: unComedor.
	menuEstudiantil agregarAlPedido: pedidoDos.
	pedidoDos abonar.
	
	pedidoTres := Pedido crearPedidoPara: unExterno conMetodoDePago: unExterno objetoPago elDia: Friday en: unComedor.
	snack agregarAlPedido: pedidoTres.
	snack agregarAlPedido: pedidoTres.
	pedidoTres abonar.
	
	Assert that: unComedor gananciasPorComensalesExternos isEqualTo: 1155 * peso. 
	
	! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:43:35'!
test14_unComedorSabeCuantosDeSusGananciasEsPorComensalesRegistrados

	| menuDelDia unComedor pedidoUno pedidoDos menuEstudiantil unEstudiante unExterno pedidoTres snack unPersonal |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	unPersonal := Personal crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 2500.
	unExterno := Externo crearComensalConLegajo: 23664824 yEfectivo: 4500 conSaldoEnObjetoPago: 1500.
	
	unComedor registrar: unEstudiante.
	
	unEstudiante tarjeta cargarSaldo: 7500 con: unEstudiante efectivo. 
	
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	menuEstudiantil := MenuEstudiantil crearProductoConStock: 5.
	snack := ProductoDeGondola crearProductoConStock: 5 yPrecio: 500.
	
	pedidoUno := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal efectivo elDia: Monday en: unComedor.
	menuDelDia agregarAlPedido: pedidoUno.
	pedidoUno abonar.
	
	pedidoDos := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante tarjeta elDia: Thursday en: unComedor.
	menuEstudiantil agregarAlPedido: pedidoDos.
	pedidoDos abonar.
	
	pedidoTres := Pedido crearPedidoPara: unExterno conMetodoDePago: unExterno objetoPago elDia: Friday en: unComedor.
	snack agregarAlPedido: pedidoTres.
	pedidoTres abonar.
	
	Assert that: unComedor gananciasPorComensalesRegistrados isEqualTo: 1000 * peso. 
	
	! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:43:41'!
test15_unComedorConoceLosPedidosAbonadosConUnMetodoDePagoEnEspecifico

	| menuDelDia unComedor pedidoUno pedidoDos menuEstudiantil unEstudiante unExterno pedidoTres snack |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	unExterno := Externo crearComensalConLegajo: 23664824 yEfectivo: 4500 conSaldoEnObjetoPago: 1500.
	
	unComedor registrar: unEstudiante.
	
	unEstudiante tarjeta cargarSaldo: 7500 con: unEstudiante efectivo. 
	
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	menuEstudiantil := MenuEstudiantil crearProductoConStock: 5.
	snack := ProductoDeGondola crearProductoConStock: 5 yPrecio: 500.
	
	pedidoUno := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Monday en: unComedor.
	menuDelDia agregarAlPedido: pedidoUno.
	pedidoUno abonar.
	
	pedidoDos := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante tarjeta elDia: Monday en: unComedor.
	menuEstudiantil agregarAlPedido: pedidoDos.
	pedidoDos abonar.
	
	pedidoTres := Pedido crearPedidoPara: unExterno conMetodoDePago: unExterno objetoPago elDia: Friday en: unComedor.
	snack agregarAlPedido: pedidoTres.
	snack agregarAlPedido: pedidoTres.
	pedidoTres abonar.
	
	Assert that: (unComedor pedidosAbonadosCon: unEstudiante efectivo) isEqualTo: {pedidoUno} asBag. 
	Assert that: (unComedor pedidosAbonadosCon: unEstudiante tarjeta) isEqualTo: {pedidoDos} asBag. 
	Assert that: (unComedor pedidosAbonadosCon: unExterno objetoPago) isEqualTo: {pedidoTres} asBag.
	
	! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:43:46'!
test16_unComedorConoceElProductoMasVendido

	| menuDelDia unComedor pedidoUno pedidoDos menuEstudiantil unEstudiante unExterno pedidoTres snack |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 10000 conSaldoEnObjetoPago: 15000.
	unExterno := Externo crearComensalConLegajo: 23664824 yEfectivo: 4500 conSaldoEnObjetoPago: 1500.
	
	unComedor registrar: unEstudiante.
	
	unEstudiante tarjeta cargarSaldo: 7500 con: unEstudiante efectivo. 
	
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	menuEstudiantil := MenuEstudiantil crearProductoConStock: 5.
	snack := ProductoDeGondola crearProductoConStock: 5 yPrecio: 500.
	
	pedidoUno := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Monday en: unComedor.
	menuDelDia agregarAlPedido: pedidoUno.
	pedidoUno abonar.
	
	pedidoDos := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Monday en: unComedor.
	menuEstudiantil agregarAlPedido: pedidoDos.
	pedidoDos abonar.
	
	pedidoTres := Pedido crearPedidoPara: unExterno conMetodoDePago: unExterno objetoPago elDia: Friday en: unComedor.
	snack agregarAlPedido: pedidoTres.
	snack agregarAlPedido: pedidoTres.
	pedidoTres abonar.
	
	Assert that: (unComedor productoMasVendido) isEqualTo: snack class.
	
	! !

!Test methodsFor: 'Comedor' stamp: 'LS-NB 11/26/2025 12:44:01'!
test17_unComedorNoPuedeRegistrarUnComensal

	|  comedor unComensal |
	
	comedor := Comedor new.
	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.
	
	comedor registrar: unComensal.
	
	Assert should: [comedor registrar: unComensal] signal: PreconditionFailure withDescription: comedor comensalYaRegistrado.! !


!Test methodsFor: 'MetodoDePago' stamp: 'LS-NB 11/26/2025 11:11:04'!
test01_elMetodoEfectivoEmpiezaConUnSaldoAsignado
	
	| efectivo |
	
	efectivo := Efectivo crearConSaldo: 5000.
	
	Assert that: efectivo saldo isEqualTo: 5000 * peso! !

!Test methodsFor: 'MetodoDePago' stamp: 'LS-NB 11/26/2025 11:11:36'!
test02_elMetodoObjetoPagoEmpiezaConUnSaldoAsignado

	| objetoPago |
	
	objetoPago := ObjetoPago crearConSaldo: 2500.
	
	Assert that: objetoPago saldo isEqualTo: 2500 * peso.! !

!Test methodsFor: 'MetodoDePago' stamp: 'LS-NB 11/26/2025 11:12:05'!
test03_elMetodoTarjetaDelComedorEmpiezaSinSaldo

	| tarjeta |
	
	tarjeta := TarjetaDelComedor new.
	
	Assert that: tarjeta saldo isEqualTo: 0 * peso.! !

!Test methodsFor: 'MetodoDePago' stamp: 'LS-NB 11/26/2025 11:15:20'!
test04_sePuedeIncrementarElSaldoEnEfectivo

	| efectivo |
	
	efectivo := Efectivo crearConSaldo: 5000.
	
	efectivo incrementarDinero: 500.
	
	Assert that: efectivo saldo isEqualTo: 5500 * peso.! !

!Test methodsFor: 'MetodoDePago' stamp: 'LS-NB 11/27/2025 01:10:23'!
test05_sePuedeIngresarDineroAObjetoPago

	| objetoPago efectivo |
	
	efectivo := Efectivo crearConSaldo: 5000.
	
	objetoPago := ObjetoPago crearConSaldo: 2500.
	
	objetoPago ingresarDinero: 2500 desde: efectivo.
	
	Assert that: objetoPago saldo isEqualTo: 5000 * peso.
	Assert that: efectivo saldo isEqualTo: 2500 * peso.! !

!Test methodsFor: 'MetodoDePago' stamp: 'LS-NB 11/26/2025 11:17:27'!
test06_sePuedeCargarSaldoALaTarjetaDelComedor

	| tarjeta efectivo |
	
	efectivo := Efectivo crearConSaldo: 5000.
	
	tarjeta := TarjetaDelComedor new.
	
	tarjeta cargarSaldo: 2500  con: efectivo.
	
	Assert that: tarjeta saldo isEqualTo: 2500 * peso.! !

!Test methodsFor: 'MetodoDePago' stamp: 'LS-NB 11/26/2025 12:41:32'!
test07_noSePuedeCargarSaldoALaTarjetaDelComedor

	| tarjeta |
	
	tarjeta := TarjetaDelComedor new.
	
	Assert should: [tarjeta cargarSaldo: 2500 con: tarjeta] signal: PreconditionFailure withDescription: tarjeta metodoInvalido.! !

!Test methodsFor: 'MetodoDePago' stamp: 'LS-NB 11/26/2025 11:26:41'!
test08_elMetodoEfectivoConoceSusDescuentosPorDia

	| efectivo |
	
	efectivo := Efectivo crearConSaldo: 5000.
	
	Assert that: (efectivo descuentoParaElDia: Monday) isEqualTo: 0.10. "Lunes"
	
	Assert that: (efectivo descuentoParaElDia: Tuesday) isEqualTo: 0. "Martes"
	
	Assert that: (efectivo descuentoParaElDia: Wednesday) isEqualTo: 0. "Miercoles"
	
	Assert that: (efectivo descuentoParaElDia: Thursday) isEqualTo: 0. "Jueves"
	
	Assert that: (efectivo descuentoParaElDia: Friday) isEqualTo: 0. "Viernes"
	
	"No se considera sabado y domingo porque el comedor esta cerrado"! !

!Test methodsFor: 'MetodoDePago' stamp: 'LS-NB 11/26/2025 12:10:10'!
test09_cadaMetodoConoceSusDescuentosYRecargos

	| efectivo objetoPago tarjeta |
	
	efectivo := Efectivo crearConSaldo: 7500.
	
	objetoPago := ObjetoPago crearConSaldo: 5000.
	
	tarjeta := TarjetaDelComedor new.
	tarjeta cargarSaldo: 2500 con: efectivo.
	
	Assert that: (efectivo precioBase: 500 * peso conDescuentoDel: 0.75 yDescuentoDelDia: 0.1) isEqualTo: 450 * peso.
	
	Assert that: (objetoPago precioBase: 500 * peso conDescuentoDel: 0 yDescuentoDelDia: 0) isEqualTo: 525 * peso.
	
	Assert that: (tarjeta precioBase: 500 * peso conDescuentoDel: 0.5 yDescuentoDelDia: 0) isEqualTo: 250 * peso.! !

!Test methodsFor: 'MetodoDePago' stamp: 'LS-NB 11/27/2025 01:16:45'!
test10_noSePuedeIngresarDineroAObjetoPago

	| objetoPago efectivo |
	
	efectivo := Efectivo crearConSaldo: 1500.
	
	objetoPago := ObjetoPago crearConSaldo: 2500.
	
	Assert should: [objetoPago ingresarDinero: 2500 desde: efectivo] signal: PreconditionFailure withDescription: objetoPago saldoInsuficiente.
	
	Assert should: [objetoPago ingresarDinero: 2500 desde: objetoPago] signal: PreconditionFailure withDescription: objetoPago metodoInvalido.! !


!Test methodsFor: 'Comensal' stamp: 'LS-NB 11/26/2025 12:44:13'!
test01_alCrearUnComensalTieneMetodosDePagoDisponibles

	| unComensal |
	
	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.
	
	Assert isTrue: unComensal efectivo notNil.
	
	Assert isTrue: unComensal objetoPago notNil.! !

!Test methodsFor: 'Comensal' stamp: 'LS-NB 11/26/2025 12:44:19'!
test02_alCrearUnComensalTieneDineroDisponible

	| unComensal |
	
	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.
	
	Assert that: unComensal efectivo saldo isEqualTo: 1500 * peso.
	
	Assert that: unComensal objetoPago saldo isEqualTo: 5000 * peso.! !

!Test methodsFor: 'Comensal' stamp: 'LS-NB 11/26/2025 12:44:23'!
test03_alCrearUnComensalNoTieneTarjetaDeUnComedor

	| unComensal |
	
	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.
	
	Assert isTrue: unComensal tarjeta esNula.! !

!Test methodsFor: 'Comensal' stamp: 'LS-NB 11/26/2025 12:44:28'!
test04_laTarjetaDelComensalNoTieneSaldoInicialmente

	|  comedor unComensal |
	
	comedor := Comedor new.
	
	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.
	
	comedor registrar: unComensal.
	
	Assert that: unComensal tarjeta saldo isEqualTo: 0 * peso.! !

!Test methodsFor: 'Comensal' stamp: 'LS-NB 11/26/2025 12:44:34'!
test05_unComensalPuedeIncrementarDineroEnEfectivo

	|  unComensal |
	
	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.
	
	unComensal efectivo incrementarDinero: 2500.
	
	Assert that: unComensal efectivo saldo isEqualTo: 4000 * peso.! !

!Test methodsFor: 'Comensal' stamp: 'LS-NB 11/27/2025 01:13:39'!
test06_unComensalPuedeIngresarDineroAObjetoPago

	|  unComensal |
	
	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.
	
	unComensal objetoPago ingresarDinero: 1500 desde: unComensal efectivo.
	
	Assert that: unComensal objetoPago saldo isEqualTo: 6500 * peso.! !

!Test methodsFor: 'Comensal' stamp: 'LS-NB 11/26/2025 12:44:40'!
test07_unComensalPuedeCargarSaldoALaTarjetaDelComedor

	|  unComensal comedor |
	
	comedor := Comedor new.
	
	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.
	
	comedor registrar: unComensal.
	
	unComensal tarjeta cargarSaldo: 1500 con: unComensal efectivo.
	
	Assert that: unComensal tarjeta saldo isEqualTo: 1500 * peso.! !

!Test methodsFor: 'Comensal' stamp: 'LS-NB 11/26/2025 12:46:09'!
test08_unComensalNoPuedeCargarSaldoALaTarjetaDelComedor

	|  unComensal comedor |
	
	comedor := Comedor new.
	
	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.
	
	comedor registrar: unComensal.
	
	Assert should: [unComensal tarjeta cargarSaldo: 10000 con: unComensal objetoPago] signal: PreconditionFailure withDescription: unComensal tarjeta saldoInsuficiente.! !

!Test methodsFor: 'Comensal' stamp: 'LS-NB 11/23/2025 14:31:49'!
test09_seLePuedeAsignarUnPedidoAlComensal

	| unPedido unComensal |

	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.

	unPedido := Pedido new.

	unComensal asignarPedido: unPedido.

	Assert that: unComensal pedido isEqualTo: unPedido! !

!Test methodsFor: 'Comensal' stamp: 'LS-NB 11/25/2025 00:37:11'!
test10_unComensalConoceSuLegajo

	| unComensal |

	unComensal := Comensal crearComensalConLegajo: 46282416 yEfectivo: 1500 conSaldoEnObjetoPago: 5000.

	Assert that: unComensal legajo isEqualTo: 46282416! !


!Test methodsFor: 'Pedido' stamp: 'LS-NB 11/26/2025 12:46:21'!
test01_alCrearUnPedidoNoTieneProductos

	| unPedido unEstudiante unComedor |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 15000.
	
	unPedido := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Thursday en: unComedor.
	
	Assert isTrue: unPedido productos isEmpty.! !

!Test methodsFor: 'Pedido' stamp: 'LS-NB 11/26/2025 12:46:24'!
test02_sePuedeAgregarUnProductoAlPedido

	| unPedido alfajor unEstudiante unComedor |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 15000.
	
	unPedido := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Tuesday en: unComedor.
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 250.
	
	alfajor agregarAlPedido: unPedido.
	
	Assert isTrue: unPedido productos notEmpty .
	! !

!Test methodsFor: 'Pedido' stamp: 'LS-NB 11/26/2025 12:47:39'!
test03_noSePuedeAgregarUnProductoAlPedido

	| unPedido alfajor unEstudiante unComedor menuDelDia menuEstudiantil |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 15000.
	
	unPedido := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Friday en: unComedor.
	
	menuDelDia := MenuDelDia crearProductoConStock: 0.
	Assert should: [menuDelDia agregarAlPedido: unPedido] signal:  PreconditionFailure withDescription: menuDelDia sinStock .
	
	menuEstudiantil := MenuEstudiantil crearProductoConStock: 0.
	Assert should: [menuEstudiantil agregarAlPedido: unPedido] signal:  PreconditionFailure withDescription: menuEstudiantil sinStock.
	
	alfajor := ProductoDeGondola crearProductoConStock: 0 yPrecio: 250.
	Assert should: [alfajor agregarAlPedido: unPedido] signal:  PreconditionFailure withDescription: alfajor sinStock.
	! !

!Test methodsFor: 'Pedido' stamp: 'LS-NB 11/27/2025 12:07:04'!
test04_unPedidoSabeSuPrecioTotalBase

	| unPedido alfajor gaseosa menuDelDia unEstudiante unComedor |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 15000.
	
	unPedido := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante objetoPago elDia: Tuesday en: unComedor.
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 250.
	gaseosa := ProductoDeGondola crearProductoConStock: 15 yPrecio: 150.
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	
	alfajor agregarAlPedido: unPedido.
	gaseosa agregarAlPedido: unPedido.
	menuDelDia agregarAlPedido: unPedido.
	
	Assert that: unPedido precioBase isEqualTo: 1600 * peso
	! !

!Test methodsFor: 'Pedido' stamp: 'LS-NB 11/27/2025 12:07:07'!
test05_unPedidoSabeSuPrecioConDescuentos

	| unPedido alfajor gaseosa menuDelDia unComedor unEstudiante |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 15000.
	
	unComedor registrar: unEstudiante.
	
	unEstudiante tarjeta cargarSaldo: 2500 con: unEstudiante efectivo. 
	
	unPedido := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante tarjeta elDia: Thursday en: unComedor.
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 250.
	gaseosa := ProductoDeGondola crearProductoConStock: 15 yPrecio: 150.
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	
	alfajor agregarAlPedido: unPedido.
	gaseosa agregarAlPedido: unPedido.
	menuDelDia agregarAlPedido: unPedido.
	
	Assert that: (unEstudiante pedido precioFinal) isEqualTo: 1560 * peso
	! !

!Test methodsFor: 'Pedido' stamp: 'LS-NB 11/27/2025 12:07:11'!
test06_sePuedePagarElPedidoAlComedor

	| unPedido alfajor gaseosa menuDelDia unComedor unEstudiante |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 15000.
	
	unComedor registrar: unEstudiante.
	
	unEstudiante tarjeta cargarSaldo: 2500 con: unEstudiante efectivo. 
	
	unPedido := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante tarjeta elDia: Monday en: unComedor.
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 250.
	gaseosa := ProductoDeGondola crearProductoConStock: 15 yPrecio: 150.
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	
	alfajor agregarAlPedido: unPedido.
	gaseosa agregarAlPedido: unPedido.
	menuDelDia agregarAlPedido: unPedido.
	
	Assert isFalse: unPedido estaPago.
	
	unEstudiante pedido abonar.
	
	Assert isTrue: unPedido estaPago.
	Assert that: unEstudiante tarjeta saldo isEqualTo: 940 * peso.
	Assert that: unComedor fondos isEqualTo: 1560 * peso
	! !

!Test methodsFor: 'Pedido' stamp: 'LS-NB 11/27/2025 12:07:14'!
test07_noSePuedePagarElPedidoAlComedor

	| unPedido alfajor gaseosa menuDelDia unComedor unEstudiante |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 15000.
	
	unComedor registrar: unEstudiante.
	
	unEstudiante tarjeta cargarSaldo: 1000 con: unEstudiante efectivo. 
	
	unPedido := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante tarjeta elDia: Thursday en: unComedor.
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 250.
	gaseosa := ProductoDeGondola crearProductoConStock: 15 yPrecio: 150.
	menuDelDia := MenuDelDia crearProductoConStock: 10.
	
	alfajor agregarAlPedido: unPedido.
	gaseosa agregarAlPedido: unPedido.
	menuDelDia agregarAlPedido: unPedido.
	
	Assert should: [unEstudiante pedido abonar] signal: PreconditionFailure withDescription: unEstudiante pedido saldoInsuficiente.! !

!Test methodsFor: 'Pedido' stamp: 'LS-NB 11/27/2025 12:07:19'!
test08_siElComedorEstaCerradoNoSePuedeCrearUnPedido

	| unEstudiante unComedor |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 15000.
	
	Assert should: [Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Sunday en: unComedor] signal: PreconditionFailure  
	withDescription: Pedido new comedorCerrado.! !


!Test methodsFor: 'Producto' stamp: 'LS-NB 11/22/2025 12:06:59'!
test01_alCrearUnProductoEmpiezaConElStockAsignado

	| unMenu |
	
	unMenu := MenuDelDia crearProductoConStock: 5.
	
	Assert that: unMenu stock isEqualTo: 5
	! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/22/2025 12:08:02'!
test02_unProductoPuedeAumentarSuStock

	| unMenu |
	
	unMenu := MenuDelDia crearProductoConStock: 5.
	
	unMenu reponerStock: 10.
	
	Assert that: unMenu stock isEqualTo: 15.
	! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/22/2025 12:55:02'!
test03_elMenuEstudiantilConoceSuPrecioBaseParaUnEstudiante

	| unMenu unEstudiante |
	
	unMenu := MenuEstudiantil crearProductoConStock: 5.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 1500.
	
	Assert that: (unMenu precioPara: unEstudiante conMetodoDePago: unEstudiante efectivo enDia: Wednesday) isEqualTo: 1000 * peso.
	! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/26/2025 12:51:48'!
test04_elMenuDelDiaConoceSuPrecioBaseParaCadaComensal

	| unMenu unEstudiante unPersonal |
	
	unMenu := MenuDelDia crearProductoConStock: 5.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 1500.
	Assert that: (unMenu precioPara: unEstudiante conMetodoDePago: unEstudiante efectivo enDia: Tuesday) isEqualTo: 1200 * peso.
	
	unPersonal :=  Personal crearComensalConLegajo: 45212593 yEfectivo: 2500 conSaldoEnObjetoPago: 5000.
	Assert that: (unMenu precioPara: unPersonal conMetodoDePago: unPersonal efectivo enDia: Tuesday) isEqualTo: 1200 * peso.! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/22/2025 13:11:31'!
test05_elMenuDelDiaConoceSuPrecioConDescuentoParaUnPersonal

	| unMenu unPersonal unComedor |
	
	unComedor := Comedor new.
	
	unMenu := MenuDelDia crearProductoConStock: 5.
	
	unPersonal :=  Personal crearComensalConLegajo: 45212593 yEfectivo: 2500 conSaldoEnObjetoPago: 5000.
	
	unComedor registrar: unPersonal.
	
	Assert that: (unMenu precioPara: unPersonal conMetodoDePago: unPersonal tarjeta enDia: Tuesday) isEqualTo: 1080 * peso.! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/26/2025 12:52:11'!
test06_unProductoDeGondolaConoceSuPrecioBaseParaCadaComensal

	| unEstudiante unExterno unPersonal alfajor |
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 500.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 1500.
	Assert that: (alfajor precioPara: unEstudiante conMetodoDePago: unEstudiante efectivo enDia: Thursday) isEqualTo: 500 * peso.
	
	unPersonal :=  Personal crearComensalConLegajo: 45212593 yEfectivo: 2500 conSaldoEnObjetoPago: 5000.
	Assert that: (alfajor precioPara: unPersonal conMetodoDePago: unPersonal efectivo enDia: Thursday) isEqualTo: 500 * peso.
	
	unExterno := Externo crearComensalConLegajo: 36843923 yEfectivo: 500 conSaldoEnObjetoPago: 10000.
	Assert that: (alfajor precioPara: unExterno conMetodoDePago: unExterno efectivo enDia: Thursday) isEqualTo: 550 * peso.! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/22/2025 13:13:03'!
test07_unProductoDeGondolaConoceSuPrecioConDescuentoParaCadaComensal

	| unEstudiante unPersonal unComedor alfajor |
	
	unComedor := Comedor new.
	
	alfajor := ProductoDeGondola crearProductoConStock: 5 yPrecio: 500.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 1500.
	unPersonal :=  Personal crearComensalConLegajo: 45212593 yEfectivo: 2500 conSaldoEnObjetoPago: 5000.
	
	unComedor registrar: unEstudiante.
	unComedor registrar: unPersonal.
	
	Assert that: (alfajor precioPara: unEstudiante conMetodoDePago: unEstudiante tarjeta enDia: Tuesday) isEqualTo: 450 * peso.
	Assert that: (alfajor precioPara: unPersonal conMetodoDePago: unPersonal tarjeta enDia: Tuesday) isEqualTo: 475 * peso.! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/26/2025 12:52:48'!
test08_unExternoNoPuedeAccederAlMenuDelDia

	| unMenu unExterno unComedor unPedido |
	
	unComedor := Comedor new.
	
	unMenu := MenuDelDia crearProductoConStock: 5.
	
	unExterno := Externo crearComensalConLegajo: 36843923 yEfectivo: 500 conSaldoEnObjetoPago: 10000.
	
	unPedido := Pedido crearPedidoPara: unExterno conMetodoDePago: unExterno efectivo elDia: Friday en: unComedor.
	
	Assert should: [unMenu agregarAlPedido: unPedido] signal: PreconditionFailure withDescription: unMenu menuNoDisponible.
	Assert should: [unMenu precioPara: unExterno conMetodoDePago: unExterno efectivo enDia: Tuesday] signal: Error withDescription: unMenu precioNoDisponible ! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/26/2025 12:53:05'!
test09_unExternoNoPuedeAccederAlMenuEstudiantil

	| unMenu  unExterno unComedor unPedido |
	
	unComedor := Comedor new.
	
	unMenu := MenuEstudiantil crearProductoConStock: 5.
	
	unExterno := Externo crearComensalConLegajo: 36843923 yEfectivo: 500 conSaldoEnObjetoPago: 10000.
	
	unPedido := Pedido crearPedidoPara: unExterno conMetodoDePago: unExterno efectivo elDia: Friday en: unComedor.
	
	Assert should: [unMenu agregarAlPedido: unPedido] signal: PreconditionFailure withDescription: unMenu menuParaEstudiantes.
	Assert should: [unMenu precioPara: unExterno conMetodoDePago: unExterno efectivo enDia: Wednesday] signal: Error withDescription: unMenu precioNoDisponible.
	! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/26/2025 12:53:19'!
test10_unPersonalNoPuedeAccederAlMenuEstudiantil

	| unMenu unPersonal unComedor unPedido |
	
	unComedor := Comedor new.
	
	unMenu := MenuEstudiantil crearProductoConStock: 5.
	
	unPersonal :=  Personal crearComensalConLegajo: 45212593 yEfectivo: 2500 conSaldoEnObjetoPago: 5000.
	
	unPedido := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal efectivo elDia: Friday en: unComedor.
	
	Assert should: [unMenu agregarAlPedido: unPedido] signal: PreconditionFailure withDescription: unMenu menuParaEstudiantes.
	Assert should: [unMenu precioPara: unPersonal conMetodoDePago: unPersonal efectivo enDia: Wednesday] signal: Error withDescription: unMenu precioNoDisponible.
	! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/26/2025 12:53:25'!
test11_unProductoPuedeActualizarSuStock

	| unMenu |
	
	unMenu := MenuDelDia crearProductoConStock: 5.
	
	unMenu actualizarStock.
	
	Assert that: unMenu stock isEqualTo: 4.
	! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/26/2025 12:53:39'!
test12_unEstudianteNoPuedeTenerMasDeUnMenuEstudiantil

	| unPedido unEstudiante unComedor menuEstudiantil |
	
	unComedor := Comedor new.
	
	unEstudiante := Estudiante crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 15000.
	
	unPedido := Pedido crearPedidoPara: unEstudiante conMetodoDePago: unEstudiante efectivo elDia: Tuesday en: unComedor.
	
	menuEstudiantil := MenuEstudiantil crearProductoConStock: 5.
	
	menuEstudiantil agregarAlPedido: unPedido.
	
	Assert should: [menuEstudiantil agregarAlPedido: unPedido] signal: PreconditionFailure withDescription: menuEstudiantil unaUnidadPorPedido.
	! !

!Test methodsFor: 'Producto' stamp: 'LS-NB 11/27/2025 01:24:27'!
test13_elMenuEstudiantilEsUnicamenteParaEstudiantes

	| unComedor menuEstudiantil pedidoDos pedidoUno unExterno unPersonal |
	
	unComedor := Comedor new.
	
	unPersonal := Personal crearComensalConLegajo: 46282416 yEfectivo: 5000 conSaldoEnObjetoPago: 15000.
	unExterno := Externo crearComensalConLegajo: 35748321 yEfectivo: 2500 conSaldoEnObjetoPago: 5000.
	
	pedidoUno := Pedido crearPedidoPara: unPersonal conMetodoDePago: unPersonal efectivo elDia: Tuesday en: unComedor.
	pedidoDos := Pedido crearPedidoPara: unExterno conMetodoDePago: unExterno objetoPago elDia: Tuesday en: unComedor.
	
	menuEstudiantil := MenuEstudiantil crearProductoConStock: 5.
	
	Assert should: [menuEstudiantil agregarAlPedido: pedidoUno] signal: PreconditionFailure withDescription: menuEstudiantil menuParaEstudiantes.
	Assert should: [menuEstudiantil agregarAlPedido: pedidoDos] signal: PreconditionFailure withDescription: menuEstudiantil menuParaEstudiantes.
	! !


!classDefinition: #Comedor category: 'TrabajoFinal-Grupo-3'!
Object subclass: #Comedor
	instanceVariableNames: 'fondos pedidos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!Comedor methodsFor: 'Bonus' stamp: 'LS-NB 11/25/2025 12:02:02'!
cantidadDeMenuesDelDiaVendidos

	| productos |
	
	productos := Bag new.
	
	self historialDePedidos do: [:unPedido | productos addAll: unPedido productos].  
	
	^ (productos select: [:unProducto | unProducto esMenuDelDia]) size.! !

!Comedor methodsFor: 'Bonus' stamp: 'LS-NB 11/25/2025 12:02:06'!
cantidadDeMenuesEstudiantilesVendidos
	
	| productos |
	
	productos := Bag new.
	
	self historialDePedidos do: [:unPedido | productos addAll: unPedido productos].  
	
	^ (productos select: [:unProducto | unProducto esMenuEstudiantil]) size.! !

!Comedor methodsFor: 'Bonus' stamp: 'LS-NB 11/25/2025 11:29:05'!
cantidadDePedidosRealizadosLosLunesAbonadosEnEfectivo
	
	^ (self historialDePedidos select: [:unPedido | unPedido dia isMonday & unPedido metodoDePago esEfectivo]) size.! !

!Comedor methodsFor: 'Bonus' stamp: 'LS-NB 11/25/2025 01:44:45'!
gananciasPorComensalesExternos
	
	| externos |
	
	externos := self historialDePedidos select: [:unPedido | unPedido cliente esExterno].
	
	^ externos sum: [:unPedido | unPedido precioFinal] ifEmpty: 0 * peso.! !

!Comedor methodsFor: 'Bonus' stamp: 'LS-NB 11/25/2025 01:46:22'!
gananciasPorComensalesRegistrados
	
	| registrados |
	
	registrados := self historialDePedidos select: [:unPedido | (unPedido cliente esEstudiante | unPedido cliente esPersonal) & (unPedido cliente tarjeta esNula not)].
	
	^ registrados sum: [:unPedido | unPedido precioFinal] ifEmpty: 0 * peso.! !

!Comedor methodsFor: 'Bonus' stamp: 'LS-NB 11/25/2025 22:51:39'!
productoMasVendido

	| productos productoMasVendido |
	
	productos := Bag new.
	
	self historialDePedidos do: [:unPedido | productos addAll: unPedido productos].  
	
	productoMasVendido := ((self unidadesVendidasDe: MenuDelDia new) max: (self unidadesVendidasDe: MenuEstudiantil  new)) max: (self unidadesVendidasDe: ProductoDeGondola new).
	
	^ (productos select: [:unProducto | (self unidadesVendidasDe: unProducto) = (productoMasVendido)]) anyOne class.! !


!Comedor methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:20:11'!
esDiaHabil: unDia

	^ (unDia isSaturday not) & (unDia isSunday not)
	! !

!Comedor methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:20:13'!
fondos

	^ fondos! !

!Comedor methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:20:15'!
historialDePedidos

	^ pedidos! !

!Comedor methodsFor: 'Consultas' stamp: 'LS-NB 11/25/2025 12:35:20'!
pedidosAbonadosCon: unMetodoDePago

	^ self historialDePedidos 
		select: [:unPedido | 
		(unPedido metodoDePago esEfectivo = unMetodoDePago esEfectivo) & 
		(unPedido metodoDePago esObjetoPago = unMetodoDePago esObjetoPago) & 
		(unPedido metodoDePago esTarjeta  = unMetodoDePago esTarjeta)].! !

!Comedor methodsFor: 'Consultas' stamp: 'LS-NB 11/25/2025 00:20:07'!
pedidosQueSuperanElPrecioBase: unMonto

	^ self historialDePedidos select: [:unPedido | (unPedido precioBase) > (unMonto * peso)]! !

!Comedor methodsFor: 'Consultas' stamp: 'LS-NB 11/24/2025 14:19:59'!
pedidosQueSuperanElPrecioConDescuento: unMonto

	^ self historialDePedidos select: [:unPedido | (unPedido precioFinal) > (unMonto * peso)]! !

!Comedor methodsFor: 'Consultas' stamp: 'LS-NB 11/25/2025 00:39:40'!
pedidosRealizadosPorComensalesExternos

	^ self historialDePedidos select: [:unPedido | unPedido cliente esExterno]
	
	! !

!Comedor methodsFor: 'Consultas' stamp: 'LS-NB 11/25/2025 00:39:36'!
pedidosRealizadosUnDia: unDia

	^ self historialDePedidos select: [:unPedido | (unPedido dia) = (unDia)]! !

!Comedor methodsFor: 'Consultas' stamp: 'LS-NB 11/25/2025 13:07:03'!
unidadesVendidasDe: unProducto

       | productos |

	productos := Bag new.
	
	self historialDePedidos do: [:unPedido | productos addAll: unPedido productos].  
	
	^ (productos select: [:otroProducto | 
						(otroProducto esMenuDelDia = unProducto esMenuDelDia ) &
						(otroProducto esMenuEstudiantil = unProducto esMenuEstudiantil ) &
						(otroProducto esProductoDeGondola = unProducto esProductoDeGondola)
						]) size.! !


!Comedor methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:19:59'!
agregarPedido: unPedido

	pedidos add: unPedido.! !

!Comedor methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:19:56'!
initialize

	pedidos := Bag new.
	
	fondos := 0 * peso! !

!Comedor methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:19:42'!
recibirPago: unaCantidad

	self require: self comprobarRecaudacion otherwiseReport: self laRecaudacionNoCoincide. "Comprueba que el dinero en su posesión sea mayor o igual que el que se indica en sus pedidos"
	
	fondos := fondos + unaCantidad! !

!Comedor methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:19:52'!
registrar: unComensal

	self require: unComensal tarjeta esNula otherwiseReport: self comensalYaRegistrado.
	
	unComensal asignarTarjeta: TarjetaDelComedor new.! !


!Comedor methodsFor: 'Utils' stamp: 'LS-NB 11/26/2025 12:19:16'!
comprobarRecaudacion

	^ (self historialDePedidos sum: [:unPedido | unPedido precioFinal] ifEmpty: 0 * peso) <= (self fondos) ! !


!Comedor methodsFor: 'Mensajes' stamp: 'LS-NB 11/26/2025 12:17:40'!
comensalYaRegistrado

	^ 'El comensal ya esta registrado'! !

!Comedor methodsFor: 'Mensajes' stamp: 'LS-NB 11/26/2025 12:18:23'!
laRecaudacionNoCoincide

	^ 'Los fondos no coinciden con lo recaudado'! !


!classDefinition: #Comensal category: 'TrabajoFinal-Grupo-3'!
Object subclass: #Comensal
	instanceVariableNames: 'legajo efectivo tarjeta objetoPago pedido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!Comensal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:20:45'!
efectivo

	^ efectivo! !

!Comensal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:20:48'!
esEstudiante

	self subclassResponsibility ! !

!Comensal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:20:51'!
esExterno

	self subclassResponsibility ! !

!Comensal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:20:53'!
esPersonal

	self subclassResponsibility ! !

!Comensal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:20:56'!
legajo

	^ legajo! !

!Comensal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:00'!
objetoPago

	^ objetoPago! !

!Comensal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:02'!
pedido 

	^ pedido! !

!Comensal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:05'!
precioDe: unProducto conMetodoDePago: unMetodo enDia: unDia

	self subclassResponsibility ! !

!Comensal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:08'!
tarjeta

	^ tarjeta! !


!Comensal methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:21:14'!
asignarPedido: unPedido

	pedido := unPedido! !

!Comensal methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:21:17'!
asignarTarjeta: unaTarjeta

	tarjeta := unaTarjeta! !

!Comensal methodsFor: 'Acciones' stamp: 'LS-NB 11/23/2025 13:18:01'!
inicializarComensalConLegajo: unLegajo yEfectivo: unMonto conSaldoEnObjetoPago: otroMonto.
	
	"Datos"
	legajo := unLegajo.
	
	"Metodos de Pago"
	efectivo := Efectivo crearConSaldo: unMonto.
	objetoPago := ObjetoPago crearConSaldo: otroMonto.
	tarjeta := TarjetaNula new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Comensal class' category: 'TrabajoFinal-Grupo-3'!
Comensal class
	instanceVariableNames: ''!

!Comensal class methodsFor: 'as yet unclassified' stamp: 'LS-NB 11/21/2025 12:34:22'!
crearComensalConLegajo: unLegajo yEfectivo: unMonto conSaldoEnObjetoPago: otroMonto.
	^ self new inicializarComensalConLegajo: unLegajo yEfectivo: unMonto conSaldoEnObjetoPago: otroMonto.! !


!classDefinition: #Estudiante category: 'TrabajoFinal-Grupo-3'!
Comensal subclass: #Estudiante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!Estudiante methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:41'!
esEstudiante

	^ true! !

!Estudiante methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:39'!
esExterno

	^ false! !

!Estudiante methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:35'!
esPersonal

	^ false! !

!Estudiante methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:33'!
precioDe: unProducto conMetodoDePago: unMetodo enDia: unDia

	^ unProducto precioParaEstudianteConMetodoDePago: unMetodo enDia: unDia! !


!classDefinition: #Externo category: 'TrabajoFinal-Grupo-3'!
Comensal subclass: #Externo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!Externo methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:47'!
esEstudiante

	^ false! !

!Externo methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:50'!
esExterno

	^ true
	! !

!Externo methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:52'!
esPersonal

	^ false! !

!Externo methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:21:55'!
precioDe: unProducto conMetodoDePago: unMetodo enDia: unDia

	^ unProducto precioParaExternoConMetodoDePago: unMetodo enDia: unDia! !


!classDefinition: #Personal category: 'TrabajoFinal-Grupo-3'!
Comensal subclass: #Personal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!Personal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:22:00'!
esEstudiante

	^ false! !

!Personal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:22:02'!
esExterno

	^ false! !

!Personal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:22:05'!
esPersonal

	^ true! !

!Personal methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:22:08'!
precioDe: unProducto conMetodoDePago: unMetodo enDia: unDia

	^ unProducto precioParaPersonalConMetodoDePago: unMetodo enDia: unDia! !


!classDefinition: #MetodoDePago category: 'TrabajoFinal-Grupo-3'!
Object subclass: #MetodoDePago
	instanceVariableNames: 'saldo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!MetodoDePago methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:22:57'!
gastar: unMonto

	saldo := saldo - unMonto.! !

!MetodoDePago methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:22:55'!
inicializarConSaldo: unMonto

	saldo := unMonto * peso! !


!MetodoDePago methodsFor: 'Mensajes' stamp: 'LS-NB 11/27/2025 01:09:02'!
metodoInvalido

	^ 'No podes utilizar ese metodo de pago'! !

!MetodoDePago methodsFor: 'Mensajes' stamp: 'LS-NB 11/27/2025 01:09:17'!
saldoInsuficiente

	^ 'No tenes saldo suficiente'! !


!MetodoDePago methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:22:23'!
descuentoParaElDia: unDia

	self subclassResponsibility ! !

!MetodoDePago methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:22:25'!
esEfectivo

	self subclassResponsibility ! !

!MetodoDePago methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:22:28'!
esObjetoPago

	self subclassResponsibility ! !

!MetodoDePago methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:22:30'!
esTarjeta

	self subclassResponsibility ! !

!MetodoDePago methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:22:33'!
precioBase: unPrecio conDescuentoDel: unPorcentaje yDescuentoDelDia: otroPorcentaje

	self subclassResponsibility ! !

!MetodoDePago methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:22:36'!
saldo

	^ saldo! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MetodoDePago class' category: 'TrabajoFinal-Grupo-3'!
MetodoDePago class
	instanceVariableNames: ''!

!MetodoDePago class methodsFor: 'as yet unclassified' stamp: 'LS-NB 11/21/2025 12:31:36'!
crearConSaldo: unMonto
	^ self new inicializarConSaldo: unMonto.! !


!classDefinition: #Efectivo category: 'TrabajoFinal-Grupo-3'!
MetodoDePago subclass: #Efectivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!Efectivo methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 11:04:00'!
descuentoParaElDia: unDia

	| descuentos |
	
	descuentos := Dictionary new.
	
	descuentos at: Monday put: 0.10.
	descuentos at: Tuesday put: 0.
	descuentos at: Wednesday put: 0.
	descuentos at: Thursday put: 0.
	descuentos at: Friday put: 0.
	
	^ (descuentos at: unDia).! !

!Efectivo methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:08'!
esEfectivo

	^  true
	! !

!Efectivo methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:10'!
esObjetoPago

	^  false! !

!Efectivo methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:12'!
esTarjeta

	^  false! !

!Efectivo methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:14'!
precioBase: unPrecio conDescuentoDel: unPorcentaje yDescuentoDelDia: otroPorcentaje

	^ (unPrecio) * (1 - otroPorcentaje).! !


!Efectivo methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:23:01'!
incrementarDinero: unMonto

	saldo := saldo + (unMonto * peso)! !


!classDefinition: #ObjetoPago category: 'TrabajoFinal-Grupo-3'!
MetodoDePago subclass: #ObjetoPago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!ObjetoPago methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 11:50:30'!
descuentoParaElDia: unDia

	| descuentos |
	
	descuentos := Dictionary new.
	
	descuentos at: Monday put: 0.
	descuentos at: Tuesday put: 0.
	descuentos at: Wednesday put: 0.
	descuentos at: Thursday put: 0.
	descuentos at: Friday put: 0.
	
	^ (descuentos at: unDia).! !

!ObjetoPago methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:30'!
esEfectivo

	^  false! !

!ObjetoPago methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:33'!
esObjetoPago

	^  true! !

!ObjetoPago methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:35'!
esTarjeta

	^  false! !

!ObjetoPago methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:40'!
precioBase: unPrecio conDescuentoDel: unPorcentaje yDescuentoDelDia: otroPorcentaje

	^ (((unPrecio / peso) * 1.05) * peso)! !


!ObjetoPago methodsFor: 'Acciones' stamp: 'LS-NB 11/27/2025 01:11:55'!
ingresarDinero: unMonto desde: unMetodo

	self require: (unMetodo esEfectivo) otherwiseReport: self metodoInvalido.
	
	self require: ((unMonto * peso) <= (unMetodo saldo)) otherwiseReport: self saldoInsuficiente.
	
	unMetodo gastar: (unMonto * peso).
	
	saldo := saldo + (unMonto * peso)
	! !


!classDefinition: #Tarjeta category: 'TrabajoFinal-Grupo-3'!
MetodoDePago subclass: #Tarjeta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!Tarjeta methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 11:50:22'!
descuentoParaElDia: unDia

	| descuentos |
	
	descuentos := Dictionary new.
	
	descuentos at: Monday put: 0.
	descuentos at: Tuesday put: 0.
	descuentos at: Wednesday put: 0.
	descuentos at: Thursday put: 0.
	descuentos at: Friday put: 0.
	
	^ (descuentos at: unDia).! !

!Tarjeta methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:45'!
esEfectivo

	^  false! !

!Tarjeta methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:47'!
esNula

	self subclassResponsibility ! !

!Tarjeta methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:49'!
esObjetoPago

	^  false! !

!Tarjeta methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:23:52'!
esTarjeta

	^  true! !


!classDefinition: #TarjetaDelComedor category: 'TrabajoFinal-Grupo-3'!
Tarjeta subclass: #TarjetaDelComedor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!TarjetaDelComedor methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:25:27'!
cargarSaldo: unMonto con: unMetodoDePago

	self require: unMetodoDePago esTarjeta not otherwiseReport: self metodoInvalido.
	
	self require: unMetodoDePago saldo >= (unMonto * peso) otherwiseReport: self saldoInsuficiente.
	
	unMetodoDePago gastar: (unMonto * peso).
	
	saldo := saldo + (unMonto * peso).! !

!TarjetaDelComedor methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:25:53'!
initialize

	saldo := 0 * peso.! !


!TarjetaDelComedor methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:25:47'!
esNula

	^ false! !

!TarjetaDelComedor methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:25:45'!
precioBase: unPrecio conDescuentoDel: unPorcentaje yDescuentoDelDia: otroPorcentaje

	^ (((unPrecio / peso) * (1-unPorcentaje)) * peso)! !


!classDefinition: #TarjetaNula category: 'TrabajoFinal-Grupo-3'!
Tarjeta subclass: #TarjetaNula
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!TarjetaNula methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:25:59'!
esNula

	^ true! !


!classDefinition: #Pedido category: 'TrabajoFinal-Grupo-3'!
Object subclass: #Pedido
	instanceVariableNames: 'cliente productos metodoDePago estaPago comedor dia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!Pedido methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:27:23'!
cliente 

	^ cliente "(A quien pertenece)"! !

!Pedido methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:27:27'!
comedor 

	^ comedor! !

!Pedido methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:27:33'!
dia 

	^ dia "(Dia realizado)"! !

!Pedido methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:27:39'!
estaPago 

	^ estaPago "(Saber si fue pagado o no)"! !

!Pedido methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:28:07'!
metodoDePago 

	^ metodoDePago "(Conocer el metodo de pago)"! !

!Pedido methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:28:13'!
precioBase 

	^ self productos sum: [:unProducto | unProducto precio] ifEmpty: 0 * peso "(Precio)"! !

!Pedido methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:28:27'!
precioFinal 

	^ self productos sum: [:unProducto | unProducto precioPara: self cliente conMetodoDePago: self metodoDePago enDia: self dia] ifEmpty: 0 * peso
	   "(Precio final con todos los descuentos y aumentos aplicados)"! !

!Pedido methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:28:35'!
productos 

	^ productos "(Menues que lo conforman)"! !


!Pedido methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:27:14'!
abonar

	self require: ((self metodoDePago saldo) >= (self precioFinal)) otherwiseReport: self saldoInsuficiente.
	
	estaPago := true.
	
	self comedor recibirPago: self precioFinal.
	
	self comedor agregarPedido: self.
	
	self metodoDePago gastar: self precioFinal.
	! !

!Pedido methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:28:01'!
inicializarPedidoPara: unComensal conMetodoDePago: unMetodo elDia: unDia en: unComedor

	self require: (unComedor esDiaHabil: unDia) otherwiseReport: self comedorCerrado.
	
	cliente := unComensal.
	
	metodoDePago := unMetodo.
	
	dia := unDia.
	
	comedor := unComedor.
	
	productos := Bag new.
	
	estaPago := false.
	
	unComensal asignarPedido: self.! !


!Pedido methodsFor: 'Mensajes' stamp: 'LS-NB 11/26/2025 12:27:51'!
comedorCerrado

	^ 'El comedor esta cerrado'! !

!Pedido methodsFor: 'Mensajes' stamp: 'LS-NB 11/26/2025 12:27:02'!
saldoInsuficiente

	^ 'Saldo insuficiente'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pedido class' category: 'TrabajoFinal-Grupo-3'!
Pedido class
	instanceVariableNames: ''!

!Pedido class methodsFor: 'as yet unclassified' stamp: 'LS-NB 11/24/2025 14:04:13'!
crearPedidoPara: unComensal conMetodoDePago: unMetodo elDia: unDia en: unComedor
	^ self new inicializarPedidoPara: unComensal conMetodoDePago: unMetodo elDia: unDia en: unComedor
! !


!classDefinition: #Producto category: 'TrabajoFinal-Grupo-3'!
Object subclass: #Producto
	instanceVariableNames: 'stock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!Producto methodsFor: 'Mensajes' stamp: 'LS-NB 11/26/2025 12:29:42'!
precioNoDisponible

	^ '¿Como agregaste este menu? O.o'! !

!Producto methodsFor: 'Mensajes' stamp: 'LS-NB 11/26/2025 12:30:37'!
sinStock
	
	^ 'No hay stock del producto'.! !


!Producto methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:29:31'!
esMenuDelDia

	self subclassResponsibility ! !

!Producto methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:29:33'!
esMenuEstudiantil

	self subclassResponsibility ! !

!Producto methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:29:36'!
esProductoDeGondola

	self subclassResponsibility ! !

!Producto methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:29:40'!
precio 

	self subclassResponsibility ! !

!Producto methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:29:45'!
precioPara: unComensal conMetodoDePago: unMetodo enDia: unDia

	^ unComensal precioDe: self conMetodoDePago: unMetodo enDia: unDia.! !

!Producto methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:29:47'!
precioParaEstudianteConMetodoDePago: unMetodo enDia: unDia

	self subclassResponsibility ! !

!Producto methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:29:52'!
precioParaExternoConMetodoDePago: unMetodo enDia: unDia

	self subclassResponsibility ! !

!Producto methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:29:54'!
precioParaPersonalConMetodoDePago: unMetodo enDia: unDia

	self subclassResponsibility ! !

!Producto methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:29:59'!
stock

	^ stock! !


!Producto methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:29:27'!
actualizarStock

	stock := stock - 1! !

!Producto methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:29:29'!
agregarAlPedido: unPedido

	self subclassResponsibility ! !

!Producto methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:29:38'!
inicializarProductoConStock: unaCantidad

	stock := unaCantidad! !

!Producto methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:29:56'!
reponerStock: unaCantidad

	stock := stock + unaCantidad! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Producto class' category: 'TrabajoFinal-Grupo-3'!
Producto class
	instanceVariableNames: ''!

!Producto class methodsFor: 'as yet unclassified' stamp: 'LS-NB 11/19/2025 14:36:02'!
crearProductoConStock: unaCantidad
	^ self new inicializarProductoConStock: unaCantidad.
! !


!classDefinition: #MenuDelDia category: 'TrabajoFinal-Grupo-3'!
Producto subclass: #MenuDelDia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!MenuDelDia methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:36:03'!
agregarAlPedido: unPedido

	self require: (unPedido cliente esEstudiante) | (unPedido cliente esPersonal) otherwiseReport: self menuNoDisponible.
	
	self require: (self  stock > 0) otherwiseReport: self sinStock. 
	
	unPedido productos add: self.
	
	self actualizarStock.! !


!MenuDelDia methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:37:51'!
esMenuDelDia

	^ true! !

!MenuDelDia methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:37:53'!
esMenuEstudiantil

	^ false! !

!MenuDelDia methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:37:57'!
esProductoDeGondola

	^ false! !

!MenuDelDia methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:38:01'!
precio

	^ 1200 * peso ! !

!MenuDelDia methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:38:03'!
precioParaEstudianteConMetodoDePago: unMetodo enDia: unDia

	^ unMetodo precioBase: self precio conDescuentoDel: 0 yDescuentoDelDia: 0.! !

!MenuDelDia methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:38:06'!
precioParaExternoConMetodoDePago: unMetodo enDia: unDia

	self error: self precioNoDisponible! !

!MenuDelDia methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:38:08'!
precioParaPersonalConMetodoDePago: unMetodo enDia: unDia

	^ unMetodo precioBase: self precio conDescuentoDel: 0.10 yDescuentoDelDia: 0.! !


!MenuDelDia methodsFor: 'Mensajes' stamp: 'LS-NB 11/26/2025 12:36:03'!
menuNoDisponible

	^ 'No podes acceder a este menu'! !


!classDefinition: #MenuEstudiantil category: 'TrabajoFinal-Grupo-3'!
Producto subclass: #MenuEstudiantil
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!MenuEstudiantil methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:35:16'!
esMenuDelDia

	^ false! !

!MenuEstudiantil methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:35:13'!
esMenuEstudiantil

	^ true! !

!MenuEstudiantil methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:35:11'!
esProductoDeGondola

	^ false! !

!MenuEstudiantil methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:35:08'!
precio

	^ 1000 * peso! !

!MenuEstudiantil methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:35:05'!
precioParaEstudianteConMetodoDePago: unMetodo enDia: unDia

	^ unMetodo precioBase: self precio conDescuentoDel: 0 yDescuentoDelDia: 0.! !

!MenuEstudiantil methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:35:03'!
precioParaExternoConMetodoDePago: unMetodo enDia: unDia

	self error: self precioNoDisponible! !

!MenuEstudiantil methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:35:00'!
precioParaPersonalConMetodoDePago: unMetodo enDia: unDia

	self error: self precioNoDisponible! !


!MenuEstudiantil methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:37:13'!
agregarAlPedido: unPedido

	self require: (unPedido cliente esEstudiante) otherwiseReport: self menuParaEstudiantes.
	
	self require: (self  stock > 0) otherwiseReport: self sinStock. 
	
	self require: (unPedido productos noneSatisfy: [:unProducto | unProducto esMenuEstudiantil])  otherwiseReport: self unaUnidadPorPedido.
	
	unPedido productos add: self.
	
	self actualizarStock.! !


!MenuEstudiantil methodsFor: 'Mensajes' stamp: 'LS-NB 11/26/2025 12:36:40'!
menuParaEstudiantes

	^ 'Menu exclusivo de estudiantes'! !

!MenuEstudiantil methodsFor: 'Mensajes' stamp: 'LS-NB 11/26/2025 12:37:13'!
unaUnidadPorPedido

	^ 'Tu pedido ya contiene un menu estudiantil'! !


!classDefinition: #ProductoDeGondola category: 'TrabajoFinal-Grupo-3'!
Producto subclass: #ProductoDeGondola
	instanceVariableNames: 'precio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-Grupo-3'!

!ProductoDeGondola methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:32:44'!
esMenuDelDia

	^ false! !

!ProductoDeGondola methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:32:52'!
esMenuEstudiantil

	^ false! !

!ProductoDeGondola methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:32:55'!
esProductoDeGondola

	^ true! !

!ProductoDeGondola methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:33:01'!
precio

	^ precio! !

!ProductoDeGondola methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:33:46'!
precioParaEstudianteConMetodoDePago: unMetodo enDia: unDia

	^ unMetodo precioBase: self precio conDescuentoDel: 0.10 yDescuentoDelDia: (unMetodo descuentoParaElDia: unDia).! !

!ProductoDeGondola methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:34:09'!
precioParaExternoConMetodoDePago: unMetodo enDia: unDia

	^ unMetodo precioBase: (((self precio/peso) * 1.10) * peso) conDescuentoDel: 0 yDescuentoDelDia: (unMetodo descuentoParaElDia: unDia).! !

!ProductoDeGondola methodsFor: 'Consultas' stamp: 'LS-NB 11/26/2025 12:34:50'!
precioParaPersonalConMetodoDePago: unMetodo enDia: unDia

	^ unMetodo precioBase: self precio conDescuentoDel: 0.05 yDescuentoDelDia: (unMetodo descuentoParaElDia: unDia).! !


!ProductoDeGondola methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:31:30'!
agregarAlPedido: unPedido

	self require: (self  stock > 0) otherwiseReport: self sinStock. 
	
	unPedido productos add: self.
	
	self actualizarStock.! !

!ProductoDeGondola methodsFor: 'Acciones' stamp: 'LS-NB 11/26/2025 12:32:58'!
inicializarProductoConStock: unaCantidad yPrecio: unMonto

	stock := unaCantidad.
	
	precio := (unMonto * peso).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ProductoDeGondola class' category: 'TrabajoFinal-Grupo-3'!
ProductoDeGondola class
	instanceVariableNames: ''!

!ProductoDeGondola class methodsFor: 'as yet unclassified' stamp: 'LS-NB 11/21/2025 13:44:37'!
crearProductoConStock: unaCantidad yPrecio: unMonto
	^ self new inicializarProductoConStock: unaCantidad yPrecio: unMonto.
! !
