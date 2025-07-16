rm --recursive --force /root/.jupyter
cp --recursive .jupyter/ /root/.jupyter/
cat ./rserver.conf > /etc/rstudio/rserver.conf

/opt/mamba/envs/jupyterlab/bin/pip install \
    --quiet \
    jupyterlab-code-formatter \
    jupyter-fs \
    jupyterlab-git

echo 'restarting rstudio-server'
systemctl --user unmask rstudio-server
systemctl --user restart rstudio-server

echo 'restarting jupyterlab'
systemctl --user restart jupyterlab
