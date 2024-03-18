#
# Dockerfile
FROM adoptopenjdk:11-jre-hotspot

# Create the airflow user
RUN groupadd -g 1000 airflow && \
    useradd -r -u 1000 -g airflow airflow

# Switch to root user temporarily for software installation
USER root

# Install OpenJDK 11
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    rm -rf /var/lib/apt/lists/*

# Set the JAVA_HOME environment variable for all users
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
RUN export JAVA_HOME

# Add Java bin directory to the PATH for all users
ENV PATH $PATH:$JAVA_HOME/bin
RUN export PATH

# Switch back to the airflow user
USER airflow

#23 # Dockerfile
# FROM adoptopenjdk:11-jre-hotspot

# # Switch to root user temporarily for software installation
# USER root

# # Install OpenJDK 11
# RUN apt-get update && \
#     apt-get install -y openjdk-11-jre-headless && \
#     rm -rf /var/lib/apt/lists/*

# # Set the JAVA_HOME environment variable for all users
# ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
# RUN export JAVA_HOME

# # Add Java bin directory to the PATH for all users
# ENV PATH $PATH:$JAVA_HOME/bin
# RUN export PATH

# # Switch back to the airflow user
# USER airflow


# #Dockerfile
# FROM adoptopenjdk:11-jre-hotspot

# # Create the airflow user
# RUN useradd -m -d /home/airflow airflow

# # Switch to the airflow user
# USER airflow

# # Set the JAVA_HOME environment variable explicitly
# ENV JAVA_HOME /opt/java/openjdk

# # Add Java bin directory to the PATH
# ENV PATH $PATH:$JAVA_HOME/bin

# # 








 
# # # Dockerfile
# FROM adoptopenjdk:11-jre-hotspot

# # Switch to root user temporarily for software installation
# USER root

# # Install OpenJDK 11 and set up environment variables
# RUN apt-get update && \
#     apt-get install -y openjdk-11-jre-headless && \
#     rm -rf /var/lib/apt/lists/*

# # Set the JAVA_HOME environment variable
# ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# # Add Java bin directory to the PATH
# ENV PATH $PATH:$JAVA_HOME/bin

# # Switch back to the airflow user
# USER airflow


# # Set the JAVA_HOME environment variable explicitly
# ENV JAVA_HOME /opt/java/openjdk

# # Add Java bin directory to the PATH
# ENV PATH $PATH:$JAVA_HOME/bin





 # Dockerfile
# FROM apache/airflow:2.8.0

# # Fix permissions
# USER root
# RUN mkdir -p /var/lib/apt/lists/partial && chmod 644 /var/lib/apt/lists/partial

# # Install git
# RUN apt-get update && \
#     apt-get install -y git && \
#     rm -rf /var/lib/apt/lists/*

# # Install OpenJDK 11
# RUN apt-get update && \
#     apt-get install -y openjdk-11-jre-headless && \
#     rm -rf /var/lib/apt/lists/*


# # Switch back to the airflow user
# USER airflow

# # Dockerfile
# FROM apache/airflow:2.8.0

# # Fix permissions
# USER root
# RUN mkdir -p /var/lib/apt/lists/partial && chmod 644 /var/lib/apt/lists/partial

# # Install git and OpenJDK 11
# RUN apt-get update && \
#     apt-get install -y git openjdk-11-jre-headless && \
#     rm -rf /var/lib/apt/lists/*

# # Set the PATH to include Java bin directory
# ENV PATH $PATH:/usr/lib/jvm/java-11-openjdk-amd64/bin

# # Switch back to the airflow user
# USER airflow
