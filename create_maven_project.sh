#!/bin/bash

# Comprobar si se proporcionó al menos el nombre del proyecto (obligatorio)
if [ -z "$1" ]; then
    echo "❌ Error: Debes proporcionar al menos el nombre del proyecto."
    echo "Uso: $0 <nombre-proyecto> [groupId] [version-java]"
    echo "Ejemplo básico: $0 mi-app"
    echo "Ejemplo avanzado: $0 mi-app com.miempresa.modulo 17"
    exit 1
fi

# Asignación de variables (con valores por defecto si no se envían)
ARTIFACT_ID="$1"
GROUP_ID="${2:-com.mycompany.app}"      # Usa el 2do argumento, si no existe usa 'com.mycompany.app'
JAVA_VERSION="${3:-21}"                 # Usa el 3er argumento, si no existe usa '21'

echo "🚀 Generando nuevo proyecto Java con Maven..."
echo "📦 ArtifactId  : $ARTIFACT_ID"
echo "🏢 GroupId     : $GROUP_ID"
echo "☕ Java Version : $JAVA_VERSION"
echo "--------------------------------------------------"

mvn -B archetype:generate \
  -DgroupId="$GROUP_ID" \
  -DartifactId="$ARTIFACT_ID" \
  -DarchetypeGroupId=org.apache.maven.archetypes \
  -DarchetypeArtifactId=maven-archetype-quickstart \
  -DarchetypeVersion=1.5 \
  -Dmaven.compiler.release="$JAVA_VERSION"
#  -Dmaven.compiler.source="$JAVA_VERSION" \
#  -Dmaven.compiler.target="$JAVA_VERSION"

if [ $? -eq 0 ]; then
    echo "--------------------------------------------------"
    echo "✅ ¡Proyecto '$ARTIFACT_ID' creado con éxito!"
    echo "👉 Para empezar: cd $ARTIFACT_ID"
else
    echo "--------------------------------------------------"
    echo "❌ Hubo un error al generar el proyecto."
fi


# Ejemplos de uso

# 1. Modo rápido (Usa los valores por defecto: Java 21 y com.mycompany.app):
# ./create_maven_project.sh mi-app-rapida

# 2. Modo personalizado de Organización (Cambias el GroupId, mantiene Java 21):
# ./create_maven_project.sh mi-app-empresa com.otromini.proyecto

# 3. Modo totalmente a la carta (Cambias todo, por ejemplo, para usar Java 17):
# ./create_maven_project.sh app-antigua org.cliente.modulo 17


