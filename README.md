# Proyecto Quien es Quien (Profeco) 💰

# (MCD ITAM Primavera 2024)


## Autores 📚

| Nombre                     |  CU    | Correo Electrónico | Usuario Github |
|----------------------------|--------|--------------------|----------------|
| Blanca E. García Manjarrez | 118886 | bgarci11@itam.mx   |    BGARCIAMA   |
| Iván García                | ###### | xxxxxxxx@itam.mx   |   xxxxxxxxxxx  |
| Valeria Durán              | ###### | xxxxxxxx@itam.mx   |   xxxxxxxxxxx  |
| Yuneri Pérez Arellano      | 199813 | yperezar@itam.mx   |    YunPerez    |



# Contexto  🧠
* Repositorio del proyecto de cómputo distribuido con información del programa Quién es Quién en los Precios (QQP) recaba y difunde información de precios de productos de consumo regular en el hogar, como alimentos, bebidas, productos de aseo personal y del hogar, medicinas, electrodomésticos y artículos de temporada para ofrecer información que te permita tomar decisiones de compra mediante la comparación de precios.

* Para recabar los precios se visita una muestra de los principales establecimientos en cada una de las ciudades que forman parte del programa durante los cinco días hábiles de la semana.

* Los precios que se muestran contienen la fecha en que fueron tomados, sin embargo se encuentran sujetos a cambios, ya que algunos establecimientos pueden variar sus precios más de una vez por día, por lo que deben ser considerados como precios referencia.

# Objetivo del proyecto  🎯
* Utilizar tecnologías de gran escala vista en clase para analizar el dataset de Quién es Quién en los precios.

## Habilidades a evaluar 🧑‍💻
* Uso de herramientas de gran escala.
* Metodología vista en clase sobre limpieza de códigos
* SQL
* Pyspark

# Base de datos  ✍
* [Quién es Quién en los precios](https://datos.profeco.gob.mx/datos_abiertos/qqp.php). Registro histórico diario de más de 2,000 productos, a partir de 2015, en diversos establecimientos de la República Mexicana.
* Los dataset que se analizaron van del **2018-2024**.

# Estructura del Proyecto
## Parte A 📑
* En esta parte se levantó un cluster en AWS con Hadoop y Pyspark 

* Elaboramos un ETL con el Cluster donde: 
* - Se subió a S3 el archivo o archivos.
* - Se cargó el CSV en Spark.
* - Se guardó el CSV como parquet en S3, y se particionó por `catalogo` y `año`.
* - Se cargó el parquet en Spark.
* - Y se hizó el análisis solicitado en las instrucciones [instrucciones-proyecto-parcial.md](instrucciones-proyecto-parcial.md).
 
## Parte B 📑
Para esta parte se utilizó **Athena**. 

* - Se creó una base de datos `profeco_db` en Athena.
* - Así como una tabla externa `profeco` dentro de la base de datos profeco_db.

## Requerimientos de Software herramientas recomendadas

1. [Cuenta de Github](https://github.com)
2. [VSCodeIDE](https://code.visualstudio.com)
3. [AWS](https://aws.amazon.com)


- Correr los scripts en el siguiente orden:
  1. bash/limpieza.sh
  2. bash/union.sh
  3. [Parte_A.ipynb] (Parte_A.ipynb)
  4. [Parte_B.ipynb] (Parte_B.ipynb)

# Entregables 💯

* - 📸 Un screenshot de cómo se guardó los archivos en S3, donde se ven las particiones.
* - 📸 Un screenshot del dashboard del cluster, donde se ve el nombre, el id del cluster, el DNS, y el tiempo de ejecución.
* - 📸 Un screenshot del JupyterHub, donde se vea la dirección DNS (El URL).
* - 📸 Un screenshot de la consola de Athena donde se ve la base de datos y la tabla de Profeco.
* - 📓 Un cuaderno ejecutado con los resultados y el código con las preguntas y respuestas.

