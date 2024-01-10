import json
import zipfile #descomprime el documento
import os #ayuda a ejecutar comandos con esa libreria

api_token = {"username":"sandracisneros","key":"814c2a1ee810cd09dbfd001f4bfbfef3"} #contenido de archivo kaggle.json

#conectar a kaggle
with open("C:/Users/fcisn/.kaggle/kaggle.json","w") as file:
    json.dump(api_token,file)

location = "C:/Users/fcisn/Documents/MURUMURU/PROYECTO_PARCIAL/dataset"

##validar que la carpeta exista (para que no se caiga)
if not os.path.exists(location):
    ##si no existe la carpeta dataset entonces la creo
    os.makdir(location)
else:
    ##si la carpeta si existe, entonces voy a borrar su contenido
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root,name)) ##aqui elimino todos los archivos
        for name in dirs:
            os.rmdir(os.path.join(root,name)) ##elimino todas las carpetas

##descargar dataset de kaggle
os.system("kaggle datasets download -d henryshan/starbucks -p C:/Users/fcisn/Documents/MURUMURU/PROYECTO_PARCIAL/dataset")

##descomprimir el archivo de kaggle
os.chdir(location)
for file in os.listdir():
    zip_ref = zipfile.ZipFile(file,"r") ##lee archivo .zip
    zip_ref.extractall() ##extrae contenido de archivo zip
    zip_ref.close() #cierra archivo
