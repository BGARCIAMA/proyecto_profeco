# Proyecto de Computo Distribuido

## Objetivo

* Utilizar tecnologías de gran escala vista en clase para analizar el dataset 
de Quién es Quién en los precios 

## Habilidades a evaluar

* Uso de herramientas de gran escala.
* Metodología que vimos en clase, revisa las notas, las demos y las tareas. Todo está ahi.
* SQL
* Pyspark

## Equipos

* Este proyecto se puede realizar en equipos de 3 a 4 personas. 

* Dependiendo del número de equipo en el que estas el catálogo que tendras:

  - 1	medicamentos
  - 2	refrescos envasados
  - 3	material escolar
  - 4	apartos electricos
  - 5	leche procesada
  - 6	hortalizas frescas
  - 7	condimentos
  - 8	arts para el cuidado personal
  - 9	frutas y legumbres procesadas
  - 10	chocolates y golosinas
  - 11	galletas pastas y harinas de trigo

> Solo en caso que tu catálogo no tenga suficientes datos por año (para que puedas hacer el análisis 2018-2024), podras hablar conmigo, para cambiarlo. Esto lo sabras hasta que termines la primera parte de la sección A.

## Entrega

* Solo se hará una entrega por cada equipo.

## Datos

* [Quién es Quién en los precios](https://datos.profeco.gob.mx/datos_abiertos/qqp.php). Registro histórico diario de más de 2,000 
productos, a partir de 2015, en diversos establecimientos de la República 
Mexicana.

* Los dataset que vas a analizar van del **2018-2024**.

* Este dataset, descomprimido pesa como 28 GB en CSV =), lo que quiere decir que
cuando lo carguen en memoria es dificil de maniobrar en su computadora local =).

## Instrucciones

* Este proyecto esta dividido en dos partes.

* Antes de cargar al cluster, limpien los datos, toma una muestra y examina
que puede salir mal, en principio el archivo tienes comas en las direcciones
por lo que cuando lo quieras cargar como CSV vas a tener problemas. Hay que 
resolver eso. Tienes también caracteres especiales que puedes eliminar para
obtener mejores resultados.


## Tips para limpieza

* Con `iconv` quitar todos los acentos que puedan venir ocupando: `iconv -f utf8 -t ascii//TRANSLIT` `archivo_limpio.csv`

* Pueden usar los comandos de bash o la librería de AWS o Python para los siguientes pasos:
  - convertir a minúsculas
  - cambiar las comas de separación de variables por algún caracter tipo `|`. Ojo con las comas que separan las direcciones, esas NO. HINT: Esta es la parte dificil, de alguna manera
  tienen que escapar esos caracteres. Esto de escapar caracteres en bash se hace con `gsub` y escapar caracteres con `\`.

* Sacar tu mejor juego para limpiar este dataset.

### Parte A

En esta parte necesitarán levantar un cluster en AWS con Hadoop y Pyspark 
(Como lo hicimos en clase). Solo necesitan 1 cluster por equipo.

* El nombre de tu cluster debe ser cluster_ + la mátricula (número de 
estudiante) más chica de los miembros del equipo. Por ejemplo: `cluster_54903`.

ETL con el Cluster. 

* Deberán subir a S3 el archivo o archivos de la tabla que descarguen a S3.
* Carga el CSV en Spark
* Guarda el CSV como parquet en S3, particionalo por `catalogo`. (Utiliza todos los trucos que consideres).
* Carga el parquet en Spark

Contesta las siguientes preguntas utilizando PySpark. Realiza el siguiente análisis **(por año)** y sobre todos los catálogos.

* ¿Cuántos catálogos diferentes tenemos?
* ¿Cuáles son los 20 catálogos con más observaciones? Guarda la salida de este 
query en tu bucket de S3, lo necesitaremos más adelante.
* ¿Tenemos datos de todos los estados del país? De no ser así, ¿cuáles faltan?
* ¿Cuántas observaciones tenemos por estado?
* De cada estado obten: el número de catalogos diferentes por año, ¿ha 
aumentado el número de catálogos con el tiempo?

Utilizando Spark contesta las siguientes preguntas a partir **del catálogo que
le tocó a tu equipo**. Recuerda trabajar en el archivo con los datos particionados
de otra manera tus queries van a tardar mucho.

* ¿Cuańtas marcas diferentes tiene tu categoría?
* ¿Cuál es la marca con mayor precio? ¿En qué estado?
* ¿Cuál es la marca con menor precio en CDMX? (en aquel entonces Distrito Federal)
* ¿Cuál es la marca con mayores observaciones?
* ¿Cuáles son el top 5 de marcas con mayor precio en cada estado? ¿Son diferentes?
* ¿Cuáles son el top 5 de marcas con menor precio en CDMX? (en aquel entonces Distrito Federal)
* ¿Cuáles son el top 5 de marcas con mayores observaciones? ¿Se parecen a las de nivel por estado?
* ¿Ha dejado de existir alguna marca durante los años que tienes? ¿Cuál? ¿Cuándo desapareció?
* Genera una gráfica de serie de tiempo por estado para la marca con mayor 
precio -en todos los años-, donde el eje equis es el año y el eje ye es el 
precio máximo.

**Nota**: Recuerden descargar del cluster su análisis en Jupyter, de otra 
manera se borrará.

**Hint**: Guarda tus consultas en archivos que puedas guardar en S3 y luego
leer desde Pandas o RStudio, para hacer tus gráficas o cuadros compartivos.

### Parte B

Apaguen su cluster de EMR, en esta parte no lo necesitarán. Para esta parte 
utilizaremos Athena. 

* Crea una base de datos `profeco_db` en Athena.
* Crea una tabla externa `profeco` dentro de la base de datos profeco_db.
* **¡¡¡Recuerda crear la tabla profeco con la tabla particionada, de otra forma
tus queries van a ser costosos!!!**.
* A partir de la siguiente pregunta **utiliza Athena** desde R o Python:

De acuerdo a la categoría que te haya tocado obtén (**desde 2018 a 2022**):

* ¿De qué año a qué año tienen datos de esa categoría?
* ¿Cuántos registros de fecha hay vacíos?
* ¿Cuántos registros tienes por año?
* ¿Cuál es el precio mínimo, máximo, promedio, desviación estándar, mediana, 
* cuantil 25 y 75% de tu categoría por año?
* ¿Cuáles son el top 5 de marcas con mayor precio en cada estado? ¿Verifica si te dió lo mismo en Spark?
* ¿Cuáles son el top 5 de marcas con menor precio en CDMX? (en aquel entonces Distrito Federal) ¿Verifica si te dió lo mismo en Spark?
* ¿Cuáles son el top 5 de marcas con mayores observaciones? ¿Se parecen a las de nivel por estado? ¿Verifica si te dió lo mismo en Spark?
* Genera un boxplot por año, para cada una de las top 5 marcas de tu categoría.

**Nota:** ¡¡¡Lo principal aqui es tu código de SQL para construir las tablas!!! Eso es lo que voy a calificar. R y Pandas, están ahi para que puedas gráficar y hacer tus tablas bonitas en el reporte, OJO no para sacar las estadísticas.

**Hint**: Guarda tus consultas en archivos que puedas guardar en S3 y luego
leer desde Pandas o RStudio, para hacer tus gráficas o cuadros compartivos.

## Entregables

* Un screenshot de cómo guardaste los archivos en S3, donde se puedan ver
las particiones.
* Un screenshot del dashboard del cluster, donde se vea el nombre, el id del 
cluster, el DNS, y el tiempo de ejecución.
* Un screenshot del JupyterHub, donde se vea la dirección DNS (El URL).
* Un screenshot de la consola de Athena donde se vea la base de datos y la
tabla de Profeco.
* Un cuaderno ejecutado con los resultados y el código. El cuaderno debe de
incluir cada pregunta y su respuesta. El cuaderno puede ser un ipynb, un RMD o un quarto, o un PDF.

**Nota: Si consideras que para cualquiera de las preguntas de exploración 
necesitas gráficas con las que se explique mejor tu resultado agrégalas.**

## Evaluación

Este proyecto se los voy a calificar como parte del rubro de examen final que
vale 30% de su calificación final. Checa el syllabus.

No hay cambios de fecha.

## Fechas 

> **Tienen dos semanas para realizarlo y mi sugerencia es que la primera semana saquen la primera parte y la segunda la parte restante y el reporte**

> Tienes del **miércoles 17 de abril al miércoles 1 de mayo.**

## Recomendaciones

> **TIP 1**: NO sale en un fin de semana, no se arriesguen.
> **TIP 2**: Hagan análisis exploratorio de sus datos para apoyar sus decisiones de limpieza.
> **TIP 3**: Trabajen en un solo cluster y se dividen los costos. Si quieren hacerlo en más. Solo recuerden que para hacer sus resultados reproducibles necesitan tener los mismos pasos de limpieza.
> **TIP 4**: Comiencen con un extracto pequeños de los datos en su compu en local, para explorar las características del dataset, ya luego lo suben al cluster.
> **TIP 5**: Entre mejor limpien sus datos y lo hagan con estrategia, más rápido acaban.
> **TIP 6**: Revisa bien el capítulo 4, hay mil pasos de metodología que te harán la vida simple en el proyecto. Si no me crees no lo revises y veamos en dos semanas =).
