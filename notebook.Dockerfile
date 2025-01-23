#The second image depends on the first one (p4-hdfs) allowing us to avoid repeating imports, as seen here with
# in the FROM line in "notebook.Dockerfile".
FROM p4-hdfs
RUN pip3 install jupyterlab==4.0.3 jupyter-client==8.4.0 pyarrow==17.0.0 pandas==2.2.3 requests==2.31.0 nbconvert==7.9.2
CMD export CLASSPATH=`$HADOOP_HOME/bin/hdfs classpath --glob` && \
    python3 -m jupyterlab --no-browser --ip=0.0.0.0 --port=5000 --allow-root --NotebookApp.token=''