//
//  DataExtractor.m
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "DataExtractor.h"



@implementation DataExtractor

- (id)init{
    if (self = [super init]){
        base = [[Conexion alloc] init];
        [self addServices];
    }
    return self;
}

- (void)addServices{
//    NSLog(@"agregando servicios...");
    NSArray *res = [base execSelect:@"SELECT * FROM servicios"];
    if (res && res.count > 0){
//        NSLog(@"Ya existen y son: %d",(int)res.count);
    } else {
        [base execQuery:@"CREATE TABLE IF NOT EXISTS servicios (id int unique, titulo text not null, contenido text)"];
        [base execQuery:@"INSERT INTO servicios (id, titulo, contenido) VALUES (1,'Autorización para el uso de unidades de medida previstas en otros sistemas de unidades de medida','¿Qué es?\nEs una autorización de vigencia indeterminada.\n\n¿Para qué sirve?\nEste trámite se efectúa cuando:\na) Las unidades de medida de otros sistemas estén relacionadas con países extranjeros que no hayan adoptado el mismo sistema.\nb) Cuando las unidades de medida de otros sistemas no estén contempladas en la Ley Federal sobre Metrología y Normalización, ni en las Normas Oficiales Mexicanas (NOM’s) relativas al Sistema General de Unidades de Medida.\n\n¿Qué debo hacer?\nPor medio del Formato SE-04-001, proporcionado por la Dirección General de Normas, y presentar el original y una fotocopia.\n\n¿Cuál es el costo?\nEl trámite es gratuito.\n\nPlazo de respuesta: 15 días naturales.\n\n   Responsable:\nIng. Jorge Camacho Márquez,\nSubdirector de Metrología Científica e Industrial,\njorge.camacho@economia.gob.mx\nTeléfono(s):\n52 29 61 00 extensión 43208'),(2,'Aprobación del modelo o protocolo de instrumentos de medición y patrones sujetos a norma oficial mexicana, previa a su comercialización','¿Qué es?\n Es la aprobación de un modelo o prototipo de instrumentos de medición, de vigencia indeterminada.\n\n¿Para qué sirve?\nPara obtener los lineamientos correspondientes, paso previo a la comercialización nacional de los instrumentos de medición, según sea el caso.\n\n¿Qué debo hacer?\nPresentar en ventanilla un escrito libre, en original y una fotocopia, con las siguientes características:\n1. Lugar y fecha de emisión del escrito.\n2. Dirigido a la Dirección General de Normas (DGN).\n3. Nombre, denominación o razón social de quién promueve.\n4. Domicilio para oír y recibir notificaciones, así como el nombre de la persona o personas autorizadas para recibirlas.\n5. Petición que se formula (aprobación de modelo o prototipo).\n6. Firma del interesado o de su representante legal.\n\nDeberá anexar la siguiente documentación:\n         1. Documentos originales que acrediten la personalidad jurídica del promovente.\n         2. Una copia del certificado de producto expedido por el organismo de certificación acreditado y aprobado o por la Dirección General de Normas, para la norma oficial mexicana aplicable.\n         3. Informe de pruebas metrológicas, informe de pruebas de la norma de seguridad que les aplica y, en su caso, el informe de pruebas de seguridad eléctricas o electrónicas del equipo, expedidos por laboratorios acreditados y, en su caso aprobados.\n         \n         ¿Cuál es el costo?\n         El trámite es gratuito.\n\nPlazo de respuesta: 15 días hábiles\n\n   Responsable:\nIng. Jorge Camacho Márquez\nSubdirector de Metrología Científica e Industrial\njorge.camacho@economia.gob.mx\nTeléfono(s):\n52 29 61 00 extension 43208'),(3,'Autorización de patrones nacionales de medición','¿Qué es?\nEs una autorización de vigencia indeterminada.\n\n¿Para qué sirve?\nCuando se requiera la autorización de un patrón nacional de medición para prestar servicios de calibración a patrones e instrumentos de medición.\n\n¿Qué debo hacer?\nPresentar en ventanilla un escrito libre, en original y una fotocopia, con las siguientes características:\n1. Descripción completa de los patrones, sistemas o métodos de realización, con los datos de referencia sobre: marca, modelo, número de serie, exactitud o resolución del patrón o patrones y cualquier otro dato que permita su plena identificación.\n2. Argumentos que permitan determinar qué patrones, sistemas o métodos poseen las características para poder autorizarlos como patrones nacionales.\n3. Determinación de la incertidumbre de medición.\n4. Descripción de la infraestructura con que se cuenta para mantener y utilizar los patrones en condiciones apropiadas.\n5. Personal responsable de su desarrollo, uso y mantenimiento.\n\nTambién deberá anexar la siguiente documentación:\n1. Compromiso de la disponibilidad de los patrones para la prestación de servicios de calibración, así como para diseminar su exactitud hacia otros patrones de laboratorios que lo requieran. En original y una copia.\n2. Compromiso de dar aviso a esta Secretaría sobre cualquier cambio o modificación de las condiciones bajo las cuales se determinó declararlo y autorizarlo como patrón nacional. En original y una copia.\n3. Certificados o informes de calibración de los patrones que intervienen en los sistemas o métodos de realización y carta de trazabilidad a patrones internacionales. En original y una copia.\n4. Estudios de repetibilidad y estabilidad (historial de comportamiento). En original y una copia.\n5. Informes de intercomparaciones con patrones extranjeros o internacionales del Buró Internacional de Pesas y Medidas. En original y una copia.\n6. Programas de uso y mantenimiento. En original y una copia.\n\nPlazo de máximo de respuesta: 75 días naturales.\n\n   Responsable:\nIng. Jorge Camacho Marquez\nSudirector de Metrología Científica y Legal\njorge.camacho@economia.gob.mx\nTeléfono(s):\n52 29 61 00 extensión 43208'), (4,'Autorización de Trazabilidad hacia Patrones Nacionales o Extranjeros','¿Qué es?\nEs una autorización de vigencia indeterminada.\n\n¿Para qué sirve?\n\n1. Cuando no se cuente con el patrón nacional.\n\n2. Cuando se reconozca trazabilidad a algún laboratorio primario extranjero con el que la Secretaría haya celebrado un acuerdo de reconocimiento mutuo o bien lo haya aprobado.\n\n3. Cuando los materiales de referencia y los instrumentos de medición se utilicen para evaluar el cumplimiento de normas oficiales mexicanas.\n\n4. Cuando los materiales de referencia requeridos para evaluar el cumplimiento de normas oficiales mexicanas, no conserven el mismo proveedor y lote de producción, y además no cuenten con una autorización de trazabilidad previa.\n\n5. La autorización de trazabilidad para instrumentos de medición procede cuando:\na) No exista patrón nacional autorizado.\nb) El patrón nacional autorizado no esté disponible.\nc) La exactitud ofrecida no satisfaga las necesidades del solicitante.\nd) El tiempo para realizar la calibración se prolongue injustificadamente.\ne) No existan laboratorios de calibración acreditados y aprobados para dicho servicio.\n\n6. La autorización para materiales de referencia procede cuando:\na) El Centro Nacional de Metrología o el Instituto Nacional de Investigaciones Nucleares no tengan en existencia los materiales disponibles para su venta.\nc) Laboratorios acreditados y aprobados que necesiten evaluar la conformidad respecto a normas oficiales mexicanas, en donde se requieran servicios técnicos de medición y calibración que deban tener trazabilidad hacia patrones nacionales o en su caso a patrones extranjeros.\n\nCasos en los que no se requiere la autorización de trazabilidad\n\n7. Por acuerdo mediante oficio DG-100-090-05, a partir del 08 de abril del 2005 la Dirección General de Normas y el Centro Nacional de Metrología emitieron la lista de las sustancias y materiales que no requieren dictamen de trazabilidad por parte del Centro Nacional de Metrología, y consecuentemente no es necesario solicitar a esta Dirección General la autorización de trazabilidad hacia patrones nacionales o extranjeros.\n\nEsta información se hace del conocimiento de los diferentes sectores interesados y de los integrantes del Padrón Nacional de Evaluadores para que conozcan los materiales de referencia que no requieren autorización de trazabilidad.\n\n¿Qué debo hacer?\nPor medio del formato SE-04-004 proporcionado por la Dirección General de Normas. Presentar original y una copia.\n\n¿Cuál es el costo?\nEl trámite es gratuito.\n\nPlazo máximo de respuesta: 30 días naturales.\n\n   Responsable: \nIng. Jorge Camacho Márquez\nSubdirector de Metrología Científica e Industrial\njorge.camacho@economia.gob.mx\nTeléfono(s):\n52 29 61 00 extensión 43208'), (5,'Certificación a Solicitud de Parte de Normas Oficiales Mexicanas competencia de la Secretaría de Economía','¿Qué es?\nEs un certificado de cumplimiento con NOM, tiene vigencia de un año.\n\n¿Para qué sirve?\n1. Cuando se requiera la certificación de productos que estén sujetos al cumplimiento de Normas Oficiales Mexicanas certificables, competencia de la Secretaría de Economía para los cuales no exista organismo de certificación acreditado y aprobado en términos de la Ley Federal sobre Metrología y Normalización.\n2. Cuando requiera o desee comprobar el cumplimiento de la norma que aplique al producto.\n3. Cuando requiera llevar a cabo la importación de productos similares a aquello que deban cumplir con una determinada norma oficial mexicana, para la comercialización de los mismos en territorio nacional.\n\n¿Qué debo hacer?\nPor medio del Formato SE-04-005 que se proporciona en la Dirección General de Normas, debe presentarse original y una copia.\n\n¿Cuál es el costo?\nPago de servicios por concepto de certificación bajo la categoría de producto: $ 2,605.00, más el IVA.\nEncuentra el formato para efectuar el pago en: http://www.e5cinco.economia.gob.mx\n\nPlazo máximo de respuesta: 15 días hábiles, a partir del día hábil siguiente en que ingrese la solicitud a la Dirección general de Normas.\n\n   Responsable:\nLic. Alberto Ulises Esteban Marina\nDirector General de Normasirector de Certificación y Verificación\nalberto.esteban@economia.gob.mx\nTeléfono(s):\n52 29 61 00 extensión 43201'), (6,'Registro como Organismo Nacional de Normalización','¿Qué es?\nEs un registro con vigencia indeterminada.\n\n¿Para qué sirve?\nPara elaborar normas mexicanas en por lo menos una rama o sector económico.\n\n¿Qué debo hacer?\nPresentar Formato SE-004-006 que proporciona la Dirección General de Normas. Deberá presentarse el original y una copia.\n\n¿Cuál es el costo?\nEl trámite es gratuito.\n\nPlazo de respuesta: 60 días naturales. El plazo máximo de respuesta será interrumpido en caso de que la Secretaría requiera mayor información al solicitante para acreditar el cumplimiento de los requisitos contenidos en la Ley Federal sobre Metrología y Normalización, y su Reglamento.\n\n   Responsable:\nLic. Alberto Ulises Esteban Marina\nDirector General de Normas\nalberto.esteban@economia.gob.mx\nTeléfono(s):\n5729-9300 extensión 43200 y 43201'), (7,'Aprobación de organismos de certificación, unidades de verificación, laboratorios de prueba o laboratorios de calibración, para evaluar la conformidad de normas oficiales mexicanas emitidas por la Secretaría de Economía','¿Qué es?\nEs una aprobación de vigencia indeterminada\n\n¿Para qué sirve?\nPara obtener de la Secretaría de Economía la aprobación para evaluar normas oficiales mexicanas competencia, a fin de que la evaluación de la conformidad sea reconocida por la administración pública federal.\n\n¿Qué debo hacer?\nPresentar Formato SE-04-007 que proporciona la Dirección General de Normas, debe presentar original y una copia.\n\n¿Cuál es el costo?\nEl trámite es gratuito.\n\nPlazo de respuesta: 15 días hábiles.\n\n   Responsable:\nIng. Francisco Suárez Rodríguez\nSubdirector de Aprobación y Autorización\nfrancisco.suarez@economia.gob.mx\nTeléfono(s):\n\n52 29 61 00 extensión 43228'), (8,'Autorización para operar como entidad de acreditación','¿Qué es?\nEs una autorización de vigencia indeterminada y está sujeta a visita de verificación.\n\n¿Para qué sirve?\nPara obtener la autorización para acreditar a las personas que desarrollarán actividades de evaluación de la conformidad en cuanto a normas oficiales mexicanas, o la conformidad con las normas mexicanas, internacionales u otras especificaciones, prescripciones o características.\n\n¿Qué debo hacer?\nPresentar el Formato SE-04-008 que proporciona la Dirección General de Normas. Deberá presentarse original y una copia.\n\n¿Cuál es el costo?\nEl trámite es gratuito.\n\nPlazo de respuesta: tres meses (plazo máximo).\n\n   Responsable:\nIng. Francisco Suárez Rodríguez\nSubdirector de Aprobación y Autorización\nfrancisco.suarez@economia.gob.mx\nTeléfono(s):\n\n57 29 93 00 extensión 43228'),(9,'Obtención del visto bueno para la celebración de acuerdos de reconocimiento mutuo','¿Qué es?\nEs un visto bueno para la celebración de acuerdos de reconocimiento mutuo de vigencia indeterminada.\n\n¿Para qué sirve?\nPara obtener, cuando menos 15 días antes de la celebración del acuerdo de reconocimiento mutuo, el Visto Bueno (Vo. Bo) de la Secretaría de Economía, previa notificación de la intención de celebrar dicho acuerdo.\n\n¿Qué debo hacer?\nPresentar un escrito libre, original y una copia, con las características abajo descritas.\n\nLos acuerdos de reconocimiento mutuo deberán contener, por lo menos:\n\n1. La identificación de las dependencias, instituciones, entidades u organismos que sean parte.\n2. El ámbito de aplicación del acuerdo, describiendo la rama, el sector industrial o la naturaleza de los productos que serán cubiertos por el mismo.\n3. La descripción de las normas o regulaciones técnicas, disposiciones legislativas o administrativas objeto del acuerdo.\n4. La enumeración de las autoridades o entidades que sin ser parte, se encuentran involucradas.\n5. Los procedimientos escritos para asegurar que el desarrollo, implementación y conservación del sistema de evaluación de la conformidad garantice el cumplimiento de los requisitos establecidos en las normas o reglamentos técnicos sujetos al acuerdo de reconocimiento mutuo.\n6. Los procedimientos que permitan establecer y mantener un sistema de verificación para que el sistema de evaluación de la conformidad de las partes se lleve a cabo de acuerdo con las disposiciones establecidas en el acuerdo correspondiente.\n7. Las disposiciones que permitan auditar la competencia de las partes, cuando así se requiera, y su cumplimiento con las disposiciones establecidas en el acuerdo.\n8. Las disposiciones en materia de responsabilidad y seguro.\n9. Las disposiciones en materia de confidencialidad tanto de los resultados obtenidos como de las pruebas efectuadas.\n10. La vigencia del acuerdo y las condiciones necesarias para su prórroga, ejecución o cancelación.\n11. Otros que la Secretaría, o las dependencias competentes consideren necesarias para la correcta implementación del acuerdo.\n\n¿Cuánto cuesta?\nEste trámite es gratuito.\n\nPlazo de respuesta: 10 días hábiles.\n\n   Responsable:\nIng. Carlos Martínez Nava\nDirector de Evaluación de la Conformidad\ncarlos.martinez@economia.gob.mx\nTeléfono(s):\n52 29 61 00 extensión 43214 y 43221'),(10,'Registro de contraste, logotipo o signo propio del importador o productor nacional para identificar sus productos de oro, plata, platino o paladio','¿Qué es?\nEs un registro con vigencia de dos años, susceptible de refrendo.\n\n¿Para qué sirve?\nPara obtener un número intransferible que permita la identificación y control de los productos que se comercialicen en territorio nacional. Dicho número deberá aparecer marcado en los productos.\n\n¿Qué debo hacer?\nPor medio del Formato SE-04-013 que proporciona la Dirección General de Normas. Deberá presentarse original y una copia.\n\n¿Cuál es el costo?\nPor el trámite y, en su caso, registro y autorización para el uso de marcas y contraseñas oficiales, se pagaran derechos conforme a la cuota de, $521.00 pesos y el pago se deberá efectuar vía electrónica en la página http://www.e5cinco.economia.gob.mx\n\nPlazo de respuesta: 15 días hábiles.\n\n   Responsable:\nIng. Carlos Martínez Nava\nDirector de Evaluación de la Conformidad\ncarlos.martinez@economia.gob.mx\nTeléfono(s):\n52 29 61 00 extensión 43214'),(11,'Autorización para la importación de muestras de mercancías sujetas a normas oficiales mexicanas competencia de la Secretaría de Economía.','¿Qué es?\nEs una autorización con una vigencia de 15 días y es otorgada por mes.\n\n¿Para qué sirve?\nPara obtener de la Secretaría de Economía el documento que identifique a las mercancías que se pretenden importar como muestras. Dicho documento debe acompañar al pedimento de importación ante la aduana para realizar la importación preliminar, siempre que se requiera importar una cantidad no mayor a tres muestras, o en su caso, al número de muestras determinadas por la norma oficial mexicana correspondiente, y se importen con el objeto de someter dichas muestras a las pruebas de laboratorio necesarias para obtener la certificación o la dictaminación del cumplimiento de las normas oficiales mexicanas de producto o de información comercial, según sea el caso.\n\n¿Qué debo hacer?\nPresentar un escrito libre, original y una copia, con las siguientes características:\n\n1. Nombre o razón social y en su caso, nombre del representante legal.\n2. Domicilio, en su caso número telefónico con lada.\n3. Firma del interesado o de su representante legal.\n4. Producto(s) al (a los) que se le(s) desea importar para obtener el Certificado NOM (marca, modelo, número de serie).\n5. Identificación de la norma oficial mexicana aplicable.\n6. País de origen.\n7. Datos del laboratorio acreditado y en su caso aprobado al cual será enviada la muestra.\n8. Aduana de ingreso al país.\n9. CURP (personas físicas)\n\n¿Cuál es el costo?\nValidación de muestras para pruebas de laboratorio (cartas de aduana), $282.00 + IVA.\n\nPlazo de respuesta: 10 días hábiles (plazo máximo).\n\n   Responsable:\nIng. José Agustín Pimentel Hernández\nSubdirector de Evaluación de la Conformidad de NOM de producto\njose.pimentel@economia.gob.mx\nTeléfono(s):\n57 29 61 00 extensión 43210'),(12,'Refrendo del número de contraste, logotipo o signo propio del importador o productor nacional para identificar sus productos de oro, plata, platino o paladio','¿Qué es?\nEs un refrendo de número, tiene una vigencia de dos años y es susceptible de refrendo.\n\n¿Para qué sirve?\nCuando deseen seguir utilizando el mismo número intransferible que permita la identificación y control de los productos que se comercialicen en territorio nacional. Dicho número deberá aparecer marcado en los productos.\n\n¿Qué debo hacer?\nPor medio del Formato SE-04-013 que proporciona la Dirección General de Normas. Deberá presentarse original y una copia.\n\n¿Cuál es el costo?\nPor el trámite y, en su caso, registro y autorización para el uso de marcas y contraseñas oficiales, se pagaran derechos conforme a la cuota de, $521.00 pesos y el formato para el pago lo encontrara en el portal de internet http://www.e5cinco.economia.gob.mx\n\nPlazo de respuesta: 15 días hábiles.\n\n   Responsable:\nIng. Carlos Martínez Nava\nDirector de Evaluación de la Conformidad\ncarlos.martinez@economia.gob.mx\nTeléfono(s):\n57 29 61 00 extensión 43214'),(13,'Certificado de Aprobación de Envasadores de Tequila (CAE)','¿Qué es?\nEs un certificado de vigencia indeterminada.\n\n¿Para qué sirve?\nPara la persona física o moral ajena al productor autorizado de Tequila, que pretende envasar el producto en Territorio Nacional o en el Extranjero, cuando requiera:\n\na) Envasar dentro del Territorio Nacional.\nb) Envasar dentro del Territorio de Estados Unidos de Norteamérica.\nc) Envasar en otra parte del mundo.\n\n¿Qué debo hacer?\nPresentar escrito libre, original, con las siguientes características:\n\nEl escrito original de solicitud debe de precisar el nombre, denominación o razón social de quien promueve, en su caso el representante legal, domicilio para notificaciones y personas autorizadas para recibirlas. Señalar de manera clara la petición que se formula (la emisión de certificado de aprobación del envasador) y firmado por el representante legal de la empresa que pretenda envasar el tequila.\n\nEl escrito deberá de ir acompañado de la siguiente documentación:\n\nI. CASO DE ENVASADORA EN TERRITORIO NACIONAL\na) Copia del Acta constitutiva de la empresa nacional envasadora y de su debida inscripción ante el Registro Público de Comercio, así como del poder que acredita al representante legal de la misma.\nb) Original del escrito signado por el representante legal de la empresa envasadora en el que se compromete a ser al cumplimiento con la totalidad de las disposiciones de la NOM-006-SCFI-2012\n\nII. CASO DE ENVASADORA EN EUA\na) Original del escrito signado por el representante legale de la empresa envasadora, mediante el cual se comprometen al cumplimiento de las disposiciones del MOU, a entregar en tiempo y forma los reportes trimestrales de uso al Organismo Evaluador de la Conformidad (CRT) y que el productor autorizado no solicitará el CAE sin consentimiento del envasador.\nb) Copia del permiso emitido por el TTB, apostillado original (con apostilla de la Haya emitido a la empresa envasadora del Distilled Spirits Plant Permit (DSP).\n                                                               c) Documento apostillado (Apostilla de la Haya) que acredite la personalidad jurídica de la empresa envasadora y la de su representante legal. En original.\n\nIII.- Caso de Envasadora en cualquier otra parte del mundo.\na) Original del escrito signado por el representante legal de la empresa envasadora, mediante el que se comprometen al cumplimento de las disposiciones de la NOM-006, en particular el envasador brindará las facilidades de inspección al Organismo Evaluador de la Conformidad (CRT) previstas en los apartados 6.5.4.2 a) segundo párrafo, y 6.5.4.2. c).\nb) Documento apostillado (apostilla de la Haya) que acredite la personalidad jurídica de la empresa envasadora y la de su representante legal. En original.\n\n¿Cuál es el costo?\nEste trámite es gratuito.\n\n   Responsable:\nIng. Carlos Martínez Nava\nDirector de Evaluación de la Conformidad\ncarlos.martinez@economia.gob.mx\nTeléfono(s):\n52 29 61 00 extensión 43214, 43221'),(14,'Autorización para producir Tequila y/o Tequila 100 % de Agave','¿Qué es?\nEs una autorización de vigencia indeterminada.\n\n¿Para qué sirve?\nPara que las personas físicas o morales productores nacionales de Tequila y/o Tequila 100% de agave obtengan la autorización según los siguientes casos:\na) Productores de tequila\nb) Productores de tequila 100% de agave\nc) Productores de ambas categorías\n\n¿Qué debo hacer?\nPor medio de un escrito libre con el que se atiende el trámite al momento.\n\nEl escrito deberá presentarse, en original, con las siguientes características:\nEl nombre, denominación o razón social de quien promueve, en su caso del representante legal, domicilio para notificaciones y personas autorizadas para recibirlas, claramente la petición que se formula (autorización para producir Tequila, Tequila 100% de agave o ambas) y firmado por el interesado o su representante legal\nClave Única de Registro Poblacional (CURP) (sólo en caso de ser persona física).\n\nAsí mismo deberá de anexar la documentación que se enumera a continuación:\n\n1. Copia del Instrumento Público que acredite la personalidad del representante legal (Poder). En original.\n2. Original del Dictamen emitido por el organismo evaluador de la conformidad (CRT) para Producir Tequila y/o Tequila 100% de Agave.\n3. Original del dictamen emitido por el CRT de las etiquetas que se van a utilizar para el Tequila y/o Tequila 100% de Agave.\n4. Original del comprobante de que la Empresa se encuentra en la zona de denominación de origen del Tequila (documento emitido por el CRT o bien recibo de luz o teléfono).\n5. Citar en escrito el número de identificación de registro de la Empresa. En original.\n6. Copia del Registro Federal de Causantes de la Empresa (RFC).\n7. Copia del Acta Constitutiva de la empresa (presentar copia certificada para cotejo).\n8. Copia del comprobante de que se cuenta con el suministro de agave necesario para producir Tequila, cosechado dentro del territorio de Denominación de Origen. Puede presentarse copia de los contratos de compra de agave, o comprobantes de posesión de plantíos de agave. Esta información deberá de coincidir con los registros de plantaciones del CRT.\n9. Copia de comprobantes de potabilidad del agua empleada en el proceso de producción. Se pueden presentar copia de los comprobantes de adquisición de equipo de filtrado y potabilización del agua, o comprobantes de compra de agua potable.\n10. Copia de los convenios de corresponsabilidad con los envasadores, solo en el caso de que la empresa cuente previamente con autorización para producir Tequila o Tequila 100% de Agave, y se solicite la ampliación de la autorización para la otra categoría.\n\n¿Cuál es el costo?\nEste trámite es gratuito.\n\n   Responsable:\nIng. Carlos Martínez Nava\nDirector de Evaluación de la Conformidad\ncarlos.martinez@economia.gob.mx\nTeléfono(s):\n52 29 61 00 extensión 43214, 43221'),(15,'Asignación del Código Identificador de Fabricante Internacional (CIFI)','¿Qué es el Número de Identificación Vehicular (NIV)?\nEs la combinación de diecisiete caracteres alfanuméricos que se efectúa conforme a las especificaciones de la norma oficial mexicana NOM-001-SSP-2008. Para la determinación, asignación e instalación del número de identificación vehicular, asignados por los fabricantes o ensambladores de vehículos, para efectos de identificación (Apartado 2.8 NOM-001-SSP-2008).\n\n¿Qué es el Código Identificador de Fabricante Internacional (CIFI)?\nTiene por objeto identificar individualmente a los fabricantes o ensambladores de vehículos a nivel mundial y consta de tres caracteres para fabricantes o ensambladores que producen más de 500 unidades al año, los cuales ocupan las posiciones uno a tres del NIV, ahora bien si el fabricante o ensamblador produce menos de 500 vehículos al año se le asigna una extensión del CIFI que ocupa las posiciones 12, 13 y 14 del NIV (Apartados  2.4, 3.2.3.1, 3.2.4, 3.2.4.1 y 3.2.4.2 NOM-001-SSP-2008).\n\n¿Cómo obtengo el CIFI?\nPara que a una persona física o moral, que haya fabricado algún vehículo, pueda asignársele un Número de Identificación Vehicular (NIV), primero debe solicitar ante la Dirección General de Normas la Asignación del Código Identificador de Fabricante internacional (CIFI), y una vez  otorgado, debe acudir ante la Dirección General del Registro Público Vehicular (DGREPUVE) http://www.repuve.gob.mx/index.html de la Secretaría de Gobernación (SEGOB),  para solicitar el Dictamen favorable de cumplimiento con las especificaciones para la determinación, asignación e instalación del Número de Identificación Vehicular (NIV).\n\nA continuación se indica el procedimiento para que sea otorgado el Código Identificador de Fabricante Internacional (CIFI) y, en consecuencia, asignar el Número de Identificación Vehicular (NIV) a los vehículos que pretenden fabricar,  o que ya se fabricaron.\n\nEl fabricante debe solicitar ante esta Dirección General de Normas formalmente en escrito libre (en idioma español) la asignación del CIFI, indicando la  siguiente información:\nNombre de la persona física o moral.\nDomicilio para oír y recibir notificaciones y en su caso personas autorizadas para recibirlas.\nNombre del representante legal, en su caso y forma de acreditar su personalidad.\nTipo de vehículos que pretende fabricar de acuerdo al apartado 2.12 de la NOM, fabricación anual de vehículos (menos de 500 unidades o más de acuerdo al apartado 3.2.4.2 de la NOM-001-SSP-2008); y domicilio de la planta de fabricación.\n\nLo anterior de acuerdo a los artículos 15, 15-A, 19 y demás relativos y aplicables a la Ley Federal de Procedimiento Administrativo.\n\nAnexar los siguientes documentos:\nCopia simple de la identificación oficial del promovente o de su representante legal (credencial para votar, cédula profesional o pasaporte) (artículo 15 de la LFPA).\nCopia simple del documento que acredite la personalidad del representante legal, puede ser el acta constitutiva o poder notarial (Artículo 15 de la LFPA).\nComprobante fehaciente de domicilio de la planta de fabricación que podrá consistir en la escritura de propiedad del inmueble, contrato de arrendamiento u otro similar, también podrá comprobar el domicilio con recibo de pago por servicio de energía eléctrica o servicio telefónico. (Apartados 1 y 3.2.4 de la NOM-001-SSP-2008).\nSolicitud de alta ante la Secretaría de Hacienda y Crédito Público y Cédula de Identificación Fiscal. (Apartado 1  de la NOM-001-SSP-2008).\nRegistro de la marca ante el Instituto Mexicano de la Propiedad Industrial (IMPI) en caso de ya cuente con él, de no ser así puede anexar copia de la solicitud del registro de marca ante el IMPI. (En caso de que aún no inicie este trámite ante el IMPI puede presentar copia del documento posteriormente indicando cuál será su marca)\nPara persona moral, copia simple del acta constitutiva.\n\nUna vez que el interesado ha cumplido con los requisitos anteriores\n\nEs programada una visita de verificación, previa a la asignación del CIFI, a que alude el Acuerdo por el que se Delegan Facultades en Materia de la Competencia de la Secretaría de Economía respecto del Número de Identificación Vehicular y del Código Identificador de Fabricante Internacional, cuyo objetivo es verificar la adecuada capacidad técnica, económica, material y humana, de la empresa para la fabricación de los vehículos que pretende producir.\nEl verificador levanta un acta circunstanciada de los hechos encontrados y de conformidad   con lo dispuesto por los artículos 88 y 91 de la Ley Federal sobre Metrología y Normalización; 19, fracciones XIV, XV, XVI del Reglamento Interior de la Secretaria de Economía; 17 A, de la Ley Federal de Procedimiento Administrativo,  recaba las copias de los documentos soporte de la comprobación de las capacidades, y son siguientes:\nListados, por cada departamento o área, de: maquinaria y equipo especializado para la fabricación y ensamble de los vehículos (como dobladoras, cortadoras tornos, equipos de soldar, herramientas etc.) y copias de facturas de las mismas.\nCopias de facturas de materias primas o insumos.\nRelación de insumos en el almacén.\nCopias de facturas de vehículos vendidos.\nCopias de la declaración de impuestos ISR del año anterior.\nEstados financieros suscritos por contador público.\nEstados de cuenta bancarios a nombre de la persona verificada.\nLista de personal técnico, operativo y obrero contratado.\nÚltima nómina pagada.\nAportaciones al IMSS y al INFONAVIT.\nLista de proveedores.\nMemoria de cálculo que contenga el diseño, medidas especificaciones de la fabricación de los vehículos, registro de marca ante el IMPI, fotografías de las instalaciones.\nCaracterísticas del lugar: dimensiones del terreno (m2), parte construida, techada, al aire libre; asignación de lugares para oficinas como sanitarios, comedor, vestidor, almacén.\n\nEs importante mencionar que el CIFI sólo se otorgará a los fabricantes y ensambladores de los vehículos comprendidos en el campo de aplicación de la NOM-001-SSP-2008, y que han demostrado contar con las capacidades técnica, económica material y de recursos humanos, necesarias.')"];
    }
}

- (NSMutableArray *)getServices{
    NSMutableArray *all = nil;
    
    NSArray *res = [base execSelect:@"SELECT * FROM servicios"];
    
    for (int i=0; i<res.count; i+=3) {
        NSInteger idServicio = [res[i] integerValue];
        NSString *titulo     = res[i+1];
        NSString *contenido  = res[i+2];
        
        Servicio *ser = [[Servicio alloc] initWithId:idServicio];
        ser.titulo    = titulo;
        ser.contenido = contenido;
        
        if (!all)
            all = [NSMutableArray array];
        [all addObject:ser];
    }
    
    return all;
}

- (NSMutableArray *)getAllNMX{
    
    NSMutableArray *all = nil;
    
    // Ejecucion de consulta a la base de datos
    NSArray *res = [base execSelect:@"SELECT * FROM NMX ORDER BY clave"];
    
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=11){
        // Formateo de fecha
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        [dateformat setDateFormat:@"YYYY-MM-DD"];
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *tipoNorma     = [res objectAtIndex:i+3];
        NSString *producto      = [res objectAtIndex:i+4];
        NSString *RAE           = [res objectAtIndex:i+5];
        NSString *CTNN          = [res objectAtIndex:i+6];
        NSString *ONN           = [res objectAtIndex:i+7];
        NSString *documento     = [res objectAtIndex:i+8];
        NSString *conteo        = [res objectAtIndex:i+9];
        BOOL favorito           = [[res objectAtIndex:i+10] isEqualToString:@"1"];
        NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nmx = [[Norma alloc] initWithKey:clave];
        nmx.titulo      = titulo;
        nmx.fecha       = fecha;
        nmx.tipoNorma   = tipoNorma;
        nmx.producto    = producto;
        nmx.RAE         = RAE;
        nmx.CTNN        = CTNN;
        nmx.ONN         = ONN;
        nmx.documento   = documento;
        nmx.conteo      = conteo;
        nmx.favorito    = favorito;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nmx];
    }
    return all;
}

- (NSMutableArray *)getAllNOM{
    NSMutableArray *all = nil;
    
    // Ejecucion de consulta a la base de datos
    NSArray *res = [base execSelect:@"SELECT * FROM NOM ORDER BY clave"];
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=14){
        // Formateo de fecha
        
        NSDate *fechaVigor = nil;
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *entrada       = [res objectAtIndex:i+3];
        NSString *tipoNorma     = [res objectAtIndex:i+4];
        NSString *internacional = [res objectAtIndex:i+5];
        NSString *producto      = [res objectAtIndex:i+6];
        NSString *concordancia  = [res objectAtIndex:i+7];
        NSString *RAE           = [res objectAtIndex:i+8];
        NSString *dependencia   = [res objectAtIndex:i+9];
        NSString *CCNN          = [res objectAtIndex:i+10];
        NSString *documento     = [res objectAtIndex:i+11];
        NSString *conteo        = [res objectAtIndex:i+12];
        BOOL favorito           = [[res objectAtIndex:i+13] isEqualToString:@"1"];
        NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        if (entrada && entrada.length>8)
            fechaVigor          = [dateformat dateFromString:[entrada substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nom = [[Norma alloc] initWithKey:clave];
        nom.titulo              = titulo;
        nom.fecha               = fecha;
        if (fechaVigor)
            nom.fechaEntrada    = fechaVigor;
        nom.tipoNorma           = tipoNorma;
        nom.normaInternacional  = internacional;
        nom.producto            = producto;
        nom.concordancia        = concordancia;
        nom.RAE                 = RAE;
        nom.dependencia         = dependencia;
        nom.CCNN                = CCNN;
        nom.documento           = documento;
        nom.conteo              = conteo;
        nom.favorito            = favorito;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nom];
    }
    return all;
}

- (NSMutableArray *)getTop10NMX{
    NSMutableArray *all = nil;
    
    // Ejecucion de consulta a la base de datos
    NSArray *res = [base execSelect:@"SELECT * FROM NMX ORDER BY conteo DESC LIMIT 10"];
    
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=11){
        // Formateo de fecha
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        [dateformat setDateFormat:@"YYYY-MM-DD"];
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *tipoNorma     = [res objectAtIndex:i+3];
        NSString *producto      = [res objectAtIndex:i+4];
        NSString *RAE           = [res objectAtIndex:i+5];
        NSString *CTNN          = [res objectAtIndex:i+6];
        NSString *ONN           = [res objectAtIndex:i+7];
        NSString *documento     = [res objectAtIndex:i+8];
        NSString *conteo        = [res objectAtIndex:i+9];
        BOOL favorito           = [[res objectAtIndex:i+10] isEqualToString:@"1"];
        NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nmx = [[Norma alloc] initWithKey:clave];
        nmx.titulo      = titulo;
        nmx.fecha       = fecha;
        nmx.tipoNorma   = tipoNorma;
        nmx.producto    = producto;
        nmx.RAE         = RAE;
        nmx.CTNN        = CTNN;
        nmx.ONN         = ONN;
        nmx.documento   = documento;
        nmx.conteo      = conteo;
        nmx.favorito    = favorito;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nmx];
    }
    
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.axkansoftware.DGNSharingDefaults"];
    Norma *nmx = all[0];
    [sharedDefaults setObject:nmx.clave forKey:@"nmxClave"];
    [sharedDefaults setObject:nmx.titulo forKey:@"nmxTitulo"];
    [sharedDefaults synchronize];
    
    return all;
}

- (NSMutableArray *)getTop10NOM{
    NSMutableArray *all = nil;
    
    // Ejecucion de consulta a la base de datos
    NSArray *res = [base execSelect:@"SELECT * FROM NOM ORDER BY conteo DESC LIMIT 10"];
    
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=14){
        // Formateo de fecha
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        [dateformat setDateFormat:@"YYYY-MM-DD"];
        
        NSDate *fechaVigor = nil;
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *entrada       = [res objectAtIndex:i+3];
        NSString *tipoNorma     = [res objectAtIndex:i+4];
        NSString *internacional = [res objectAtIndex:i+5];
        NSString *producto      = [res objectAtIndex:i+6];
        NSString *concordancia  = [res objectAtIndex:i+7];
        NSString *RAE           = [res objectAtIndex:i+8];
        NSString *dependencia   = [res objectAtIndex:i+9];
        NSString *CCNN          = [res objectAtIndex:i+10];
        NSString *documento     = [res objectAtIndex:i+11];
        NSString *conteo        = [res objectAtIndex:i+12];
        BOOL favorito           = [[res objectAtIndex:i+13] isEqualToString:@"1"];
        NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        if (entrada && entrada.length>8)
            fechaVigor          = [dateformat dateFromString:[entrada substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nom = [[Norma alloc] initWithKey:clave];
        nom.titulo              = titulo;
        nom.fecha               = fecha;
        if (fechaVigor)
            nom.fechaEntrada    = fechaVigor;
        nom.tipoNorma           = tipoNorma;
        nom.normaInternacional  = internacional;
        nom.producto            = producto;
        nom.concordancia        = concordancia;
        nom.RAE                 = RAE;
        nom.dependencia         = dependencia;
        nom.CCNN                = CCNN;
        nom.documento           = documento;
        nom.conteo              = conteo;
        nom.favorito            = favorito;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nom];
    }
    
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.axkansoftware.DGNSharingDefaults"];
    Norma *nom = all[0];
    [sharedDefaults setObject:nom.clave forKey:@"nomClave"];
    [sharedDefaults setObject:nom.titulo forKey:@"nomTitulo"];
    [sharedDefaults synchronize];
    return all;
}

- (BOOL)incNOM:(Norma *)nom{
    return [base execQuery:[NSString stringWithFormat:@"UPDATE NOM SET conteo=%d WHERE clave='%@'",[nom.conteo intValue]+1,nom.clave]];
}

- (BOOL)incNMX:(Norma *)nmx{
    return [base execQuery:[NSString stringWithFormat:@"UPDATE NMX SET conteo=%d WHERE clave='%@'",[nmx.conteo intValue]+1,nmx.clave]];
}

- (NSMutableArray *)getDependencias{
    NSMutableArray *resultado = [NSMutableArray array];
    resultado = (NSMutableArray *)[base execSelect:@"SELECT DISTINCT dependencia FROM NOM"];
    return resultado;
}

- (NSMutableArray *)getRaeNMX{
    NSMutableArray *resultado = [NSMutableArray array];
    resultado = (NSMutableArray *)[base execSelect:@"SELECT DISTINCT rae FROM NMX"];
    return resultado;
}

- (NSMutableArray *)getRaeNOM{
    NSMutableArray *resultado = [NSMutableArray array];
    resultado = (NSMutableArray *)[base execSelect:@"SELECT DISTINCT rae FROM NOM"];
    return resultado;
}

- (NSMutableArray *)buscaNMXPorClave:(NSString *)clave Dependencia:(NSString *)dep Definitiva:(BOOL)def RAE:(NSString *)rae deFecha:(NSDate *)fecha1 hastaFecha:(NSDate *)fecha2{
    
    NSMutableArray *all = nil;
    
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    
    NSString *query = @"SELECT * FROM NMX WHERE ";
    if (clave && clave.length > 0){
        query = [NSString stringWithFormat:@"%@ clave LIKE '%%%@%%'",query,clave];
    }
    if (def){
        if (![query isEqualToString:@"SELECT * FROM NMX WHERE "])
            query = [NSString stringWithFormat:@"%@ AND ",query];
        query = [NSString stringWithFormat:@"%@ tipo_norma='DEFINITIVA'",query];
    }
    if (rae && rae.length > 0){
        if (![query isEqualToString:@"SELECT * FROM NMX WHERE "])
            query = [NSString stringWithFormat:@"%@ AND ",query];
        query = [NSString stringWithFormat:@"%@ rae='%@'",query,rae];
    }
    if (fecha1 && fecha2){
        if (![query isEqualToString:@"SELECT * FROM NMX WHERE "])
            query = [NSString stringWithFormat:@"%@ AND ",query];
        query = [NSString stringWithFormat:@"%@ fecha_publicacion BETWEEN '%@' AND '%@'",query,[dateformat stringFromDate:fecha1],[dateformat stringFromDate:fecha2]];
    } else {
        if (fecha1){
            if (![query isEqualToString:@"SELECT * FROM NMX WHERE "])
                query = [NSString stringWithFormat:@"%@ AND ",query];
            query = [NSString stringWithFormat:@"%@ fecha_publicacion='%@'",query,[dateformat stringFromDate:fecha1]];
        }
        if (fecha2){
            if (![query isEqualToString:@"SELECT * FROM NMX WHERE "])
                query = [NSString stringWithFormat:@"%@ AND ",query];
            query = [NSString stringWithFormat:@"%@ fecha_publicacion='%@'",query,[dateformat stringFromDate:fecha2]];
        }
    }
    
    NSArray *res = [base execSelect:query];
    
    for (int i=0;i<res.count;i+=11){
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *tipoNorma     = [res objectAtIndex:i+3];
        NSString *producto      = [res objectAtIndex:i+4];
        NSString *RAE           = [res objectAtIndex:i+5];
        NSString *CTNN          = [res objectAtIndex:i+6];
        NSString *ONN           = [res objectAtIndex:i+7];
        NSString *documento     = [res objectAtIndex:i+8];
        NSString *conteo        = [res objectAtIndex:i+9];
        BOOL favorito           = [[res objectAtIndex:i+10] isEqualToString:@"1"];
        NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nmx = [[Norma alloc] initWithKey:clave];
        nmx.titulo      = titulo;
        nmx.fecha       = fecha;
        nmx.tipoNorma   = tipoNorma;
        nmx.producto    = producto;
        nmx.RAE         = RAE;
        nmx.CTNN        = CTNN;
        nmx.ONN         = ONN;
        nmx.documento   = documento;
        nmx.conteo      = conteo;
        nmx.favorito    = favorito;
        
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nmx];
    }
    
    return all;
    
}

- (NSMutableArray *)buscaNOMPorClave:(NSString *)clave Dependencia:(NSString *)dep Definitiva:(BOOL)def RAE:(NSString *)rae deFecha:(NSDate *)fecha1 hastaFecha:(NSDate *)fecha2{
    
    NSMutableArray *all = nil;
    
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    
    NSString *query2 = @"SELECT * FROM NOM WHERE ";
    if (clave && clave.length > 0){
        query2 = [NSString stringWithFormat:@"%@ clave LIKE '%%%@%%'",query2,clave];
    }
    if (dep && dep.length > 0){
        if (![query2 isEqualToString:@"SELECT * FROM NOM WHERE "])
            query2 = [NSString stringWithFormat:@"%@ AND ",query2];
        query2 = [NSString stringWithFormat:@"%@ dependencia='%@'",query2,dep];
    }
    if (def){
        if (![query2 isEqualToString:@"SELECT * FROM NOM WHERE "])
            query2 = [NSString stringWithFormat:@"%@ AND ",query2];
        query2 = [NSString stringWithFormat:@"%@ tipo_norma='DEFINITIVA'",query2];
    }
    if (rae && rae.length > 0){
        if (![query2 isEqualToString:@"SELECT * FROM NOM WHERE "])
            query2 = [NSString stringWithFormat:@"%@ AND ",query2];
        query2 = [NSString stringWithFormat:@"%@ rae='%@'",query2,rae];
    }
    if (fecha1 && fecha2){
        if (![query2 isEqualToString:@"SELECT * FROM NOM WHERE "])
            query2 = [NSString stringWithFormat:@"%@ AND ",query2];
        query2 = [NSString stringWithFormat:@"%@ ((fecha_publicacion BETWEEN '%@' AND '%@') OR (fecha_entrada BETWEEN '%@' AND '%@')) ",query2,[dateformat stringFromDate:fecha1],[dateformat stringFromDate:fecha2],[dateformat stringFromDate:fecha1],[dateformat stringFromDate:fecha2]];
    } else {
        if (fecha1){
            if (![query2 isEqualToString:@"SELECT * FROM NOM WHERE "])
                query2 = [NSString stringWithFormat:@"%@ AND ",query2];
            query2 = [NSString stringWithFormat:@"%@ (fecha_publicacion='%@' OR fecha_entrada='%@')",query2,[dateformat stringFromDate:fecha1],[dateformat stringFromDate:fecha1]];
        }
        if (fecha2){
            if (![query2 isEqualToString:@"SELECT * FROM NOM WHERE "])
                query2 = [NSString stringWithFormat:@"%@ AND ",query2];
            query2 = [NSString stringWithFormat:@"%@ (fecha_publicacion='%@' OR fecha_entrada='%@')",query2,[dateformat stringFromDate:fecha2],[dateformat stringFromDate:fecha2]];
        }
    }
    
    
    NSArray *res = [base execSelect:query2];
    
    
    for (int i=0;i<res.count;i+=14){
        // Formateo de fecha
        
        NSDate *fechaVigor = nil;
        NSDate *fecha = nil;
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *entrada       = [res objectAtIndex:i+3];
        NSString *tipoNorma     = [res objectAtIndex:i+4];
        NSString *internacional = [res objectAtIndex:i+5];
        NSString *producto      = [res objectAtIndex:i+6];
        NSString *concordancia  = [res objectAtIndex:i+7];
        NSString *RAE           = [res objectAtIndex:i+8];
        NSString *dependencia   = [res objectAtIndex:i+9];
        NSString *CCNN          = [res objectAtIndex:i+10];
        NSString *documento     = [res objectAtIndex:i+11];
        NSString *conteo        = [res objectAtIndex:i+12];
        BOOL favorito           = [[res objectAtIndex:i+13] isEqualToString:@"1"];
        if (publicacion && publicacion.length > 9)
        fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        if (entrada && entrada.length>9)
            fechaVigor          = [dateformat dateFromString:[entrada substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nom = [[Norma alloc] initWithKey:clave];
        nom.titulo              = titulo;
        nom.fecha               = fecha;
        if (fechaVigor)
            nom.fechaEntrada    = fechaVigor;
        nom.tipoNorma           = tipoNorma;
        nom.normaInternacional  = internacional;
        nom.producto            = producto;
        nom.concordancia        = concordancia;
        nom.RAE                 = RAE;
        nom.dependencia         = dependencia;
        nom.CCNN                = CCNN;
        nom.documento           = documento;
        nom.conteo              = conteo;
        nom.favorito            = favorito;
        
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nom];
    }
    return all;
}

- (NSMutableArray *)getFavoritosNMX{
    NSMutableArray *all = nil;
    NSArray *res = [base execSelect:@"SELECT * FROM NMX WHERE favorito=1"];
    
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=11){
        // Formateo de fecha
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        [dateformat setDateFormat:@"YYYY-MM-DD"];
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *tipoNorma     = [res objectAtIndex:i+3];
        NSString *producto      = [res objectAtIndex:i+4];
        NSString *RAE           = [res objectAtIndex:i+5];
        NSString *CTNN          = [res objectAtIndex:i+6];
        NSString *ONN           = [res objectAtIndex:i+7];
        NSString *documento     = [res objectAtIndex:i+8];
        NSString *conteo        = [res objectAtIndex:i+9];
        BOOL favorito           = [[res objectAtIndex:i+10] isEqualToString:@"1"];
        NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nmx = [[Norma alloc] initWithKey:clave];
        nmx.titulo      = titulo;
        nmx.fecha       = fecha;
        nmx.tipoNorma   = tipoNorma;
        nmx.producto    = producto;
        nmx.RAE         = RAE;
        nmx.CTNN        = CTNN;
        nmx.ONN         = ONN;
        nmx.documento   = documento;
        nmx.conteo      = conteo;
        nmx.favorito    = favorito;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nmx];
    }
    return all;
}

- (NSMutableArray *)getFavoritosNOM{
    NSMutableArray *all = nil;
    // Ejecucion de consulta a la base de datos
    NSArray *res = [base execSelect:@"SELECT * FROM NOM WHERE favorito=1"];
    
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=14){
        // Formateo de fecha
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        [dateformat setDateFormat:@"YYYY-MM-DD"];
        
        NSDate *fechaVigor = nil;
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *entrada       = [res objectAtIndex:i+3];
        NSString *tipoNorma     = [res objectAtIndex:i+4];
        NSString *internacional = [res objectAtIndex:i+5];
        NSString *producto      = [res objectAtIndex:i+6];
        NSString *concordancia  = [res objectAtIndex:i+7];
        NSString *RAE           = [res objectAtIndex:i+8];
        NSString *dependencia   = [res objectAtIndex:i+9];
        NSString *CCNN          = [res objectAtIndex:i+10];
        NSString *documento     = [res objectAtIndex:i+11];
        NSString *conteo        = [res objectAtIndex:i+12];
        BOOL favorito           = [[res objectAtIndex:i+13] isEqualToString:@"1"];
        NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        if (entrada && entrada.length>8)
            fechaVigor          = [dateformat dateFromString:[entrada substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nom = [[Norma alloc] initWithKey:clave];
        nom.titulo              = titulo;
        nom.fecha               = fecha;
        if (fechaVigor)
            nom.fechaEntrada    = fechaVigor;
        nom.tipoNorma           = tipoNorma;
        nom.normaInternacional  = internacional;
        nom.producto            = producto;
        nom.concordancia        = concordancia;
        nom.RAE                 = RAE;
        nom.dependencia         = dependencia;
        nom.CCNN                = CCNN;
        nom.documento           = documento;
        nom.conteo              = conteo;
        nom.favorito            = favorito;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nom];
    }
    return all;
    return nil;
}

- (BOOL)setFavorito:(BOOL)favorito aNMX:(Norma *)norma{
    norma.favorito = favorito;
    NSString * val = @"0";
    if (favorito)
        val = @"1";
    NSString *query = [NSString stringWithFormat:@"UPDATE NMX SET favorito = %@ WHERE clave = '%@'",val,norma.clave];
    NSLog(@"query: %@",query);
    
    return [base execQuery:query];
}

- (BOOL)setFavorito:(BOOL)favorito aNOM:(Norma *)norma{
    norma.favorito = favorito;
    NSString * val = @"0";
    if (favorito)
        val = @"1";
    return [base execQuery:[NSString stringWithFormat:@"UPDATE NOM SET favorito=%@ WHERE clave='%@'",val,norma.clave]];
}

- (Norma *)getNmxByKey:(NSString *)clave{
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    NSArray *res = [base execSelect:[NSString stringWithFormat:@"SELECT * FROM NMX WHERE clave='%@'",clave]];
    int i=0;
    NSString *clav         = [res objectAtIndex:i];
    NSString *titulo        = [res objectAtIndex:i+1];
    NSString *publicacion   = [res objectAtIndex:i+2];
    NSString *tipoNorma     = [res objectAtIndex:i+3];
    NSString *producto      = [res objectAtIndex:i+4];
    NSString *RAE           = [res objectAtIndex:i+5];
    NSString *CTNN          = [res objectAtIndex:i+6];
    NSString *ONN           = [res objectAtIndex:i+7];
    NSString *documento     = [res objectAtIndex:i+8];
    NSString *conteo        = [res objectAtIndex:i+9];
    BOOL favorito           = [[res objectAtIndex:i+10] isEqualToString:@"1"];
    NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
    
    // Agrupacion de datos en una sola entidad
    Norma *nmx = [[Norma alloc] initWithKey:clav];
    nmx.titulo      = titulo;
    nmx.fecha       = fecha;
    nmx.tipoNorma   = tipoNorma;
    nmx.producto    = producto;
    nmx.RAE         = RAE;
    nmx.CTNN        = CTNN;
    nmx.ONN         = ONN;
    nmx.documento   = documento;
    nmx.conteo      = conteo;
    nmx.favorito    = favorito;
    return nmx;
}

- (Norma *)getNomByKey:(NSString *)clave{
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    NSArray *res = [base execSelect:[NSString stringWithFormat:@"SELECT * FROM NOM WHERE clave='%@'",clave]];
    int i=0;
    NSDate *fechaVigor = nil;
    
    NSString *clav         = [res objectAtIndex:i];
    NSString *titulo        = [res objectAtIndex:i+1];
    NSString *publicacion   = [res objectAtIndex:i+2];
    NSString *entrada       = [res objectAtIndex:i+3];
    NSString *tipoNorma     = [res objectAtIndex:i+4];
    NSString *internacional = [res objectAtIndex:i+5];
    NSString *producto      = [res objectAtIndex:i+6];
    NSString *concordancia  = [res objectAtIndex:i+7];
    NSString *RAE           = [res objectAtIndex:i+8];
    NSString *dependencia   = [res objectAtIndex:i+9];
    NSString *CCNN          = [res objectAtIndex:i+10];
    NSString *documento     = [res objectAtIndex:i+11];
    NSString *conteo        = [res objectAtIndex:i+12];
    BOOL favorito           = [[res objectAtIndex:i+13] isEqualToString:@"1"];
    NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
    if (entrada && entrada.length>8)
        fechaVigor          = [dateformat dateFromString:[entrada substringToIndex:10]];
    
    // Agrupacion de datos en una sola entidad
    Norma *nom = [[Norma alloc] initWithKey:clav];
    nom.titulo              = titulo;
    nom.fecha               = fecha;
    if (fechaVigor)
        nom.fechaEntrada    = fechaVigor;
    nom.tipoNorma           = tipoNorma;
    nom.normaInternacional  = internacional;
    nom.producto            = producto;
    nom.concordancia        = concordancia;
    nom.RAE                 = RAE;
    nom.dependencia         = dependencia;
    nom.CCNN                = CCNN;
    nom.documento           = documento;
    nom.conteo              = conteo;
    nom.favorito            = favorito;
    return nom;
}

- (NSMutableArray *)searchInNMX:(NSString *)text{
    NSMutableArray *all = nil;
    
    // Ejecucion de consulta a la base de datos
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM NMX WHERE clave LIKE '%%%@%%' OR titulo LIKE '%%%@%%'",text,text];
    NSArray *res = [base execSelect:query];
    
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=11){
        // Formateo de fecha
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        [dateformat setDateFormat:@"YYYY-MM-DD"];
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *tipoNorma     = [res objectAtIndex:i+3];
        NSString *producto      = [res objectAtIndex:i+4];
        NSString *RAE           = [res objectAtIndex:i+5];
        NSString *CTNN          = [res objectAtIndex:i+6];
        NSString *ONN           = [res objectAtIndex:i+7];
        NSString *documento     = [res objectAtIndex:i+8];
        NSString *conteo        = [res objectAtIndex:i+9];
        BOOL favorito           = [[res objectAtIndex:i+10] isEqualToString:@"1"];
        if (publicacion.length > 9)
            publicacion = [publicacion substringToIndex:10];
        NSDate *fecha           = [dateformat dateFromString:publicacion];
        
        // Agrupacion de datos en una sola entidad
        Norma *nmx = [[Norma alloc] initWithKey:clave];
        nmx.titulo      = titulo;
        nmx.fecha       = fecha;
        nmx.tipoNorma   = tipoNorma;
        nmx.producto    = producto;
        nmx.RAE         = RAE;
        nmx.CTNN        = CTNN;
        nmx.ONN         = ONN;
        nmx.documento   = documento;
        nmx.conteo      = conteo;
        nmx.favorito    = favorito;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nmx];
    }
    return all;
}

- (NSMutableArray *)searchInNOM:(NSString *)text{
    NSMutableArray *all = nil;
    
    // Ejecucion de consulta a la base de datos
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM NOM WHERE clave LIKE '%%%@%%' OR titulo LIKE '%%%@%%'",text,text];
    NSArray *res = [base execSelect:query];
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=14){
        // Formateo de fecha
        NSDate *fechaVigor = nil;
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *entrada       = [res objectAtIndex:i+3];
        NSString *tipoNorma     = [res objectAtIndex:i+4];
        NSString *internacional = [res objectAtIndex:i+5];
        NSString *producto      = [res objectAtIndex:i+6];
        NSString *concordancia  = [res objectAtIndex:i+7];
        NSString *RAE           = [res objectAtIndex:i+8];
        NSString *dependencia   = [res objectAtIndex:i+9];
        NSString *CCNN          = [res objectAtIndex:i+10];
        NSString *documento     = [res objectAtIndex:i+11];
        NSString *conteo        = [res objectAtIndex:i+12];
        BOOL favorito           = [[res objectAtIndex:i+13] isEqualToString:@"1"];
        //NSLog(@"publicacion: %@\t\tentrada: %@",publicacion,entrada);
        if (publicacion.length > 9)
            publicacion = [publicacion substringToIndex:10];
        NSDate *fecha           = [dateformat dateFromString:publicacion];
        if (entrada.length>9)
            entrada = [entrada substringToIndex:10];
        fechaVigor          = [dateformat dateFromString:entrada];
        // Agrupacion de datos en una sola entidad
        Norma *nom = [[Norma alloc] initWithKey:clave];
        nom.titulo              = titulo;
        nom.fecha               = fecha;
        if (fechaVigor)
            nom.fechaEntrada    = fechaVigor;
        nom.tipoNorma           = tipoNorma;
        nom.normaInternacional  = internacional;
        nom.producto            = producto;
        nom.concordancia        = concordancia;
        nom.RAE                 = RAE;
        nom.dependencia         = dependencia;
        nom.CCNN                = CCNN;
        nom.documento           = documento;
        nom.conteo              = conteo;
        nom.favorito            = favorito;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nom];
    }
    return all;
}

@end
