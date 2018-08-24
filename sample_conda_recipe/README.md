### Sample conda package

This folder contains a sample conda recipe that can be used to generate a sample conda package to test with Poboy's conda server. To build the package ensure that `conda` and `conda-build` are installed on your system.

#### Build conda package.
```bash
cd sample_conda_recipe
conda build .
```

#### Upload to conda.
```bash
curl -F platform=platform_value -F fileupload=@full_file_path http://hostname:port/poboys/upload
```
where

* `hostname` and `port` are the host and port where poboy's server is running
* `full_file_path` and `platform_value` can be obtained from the output of the command `conda build --output .`, where va`platform_value` is `linux-64` and `full_file_path` is the complete file path shown as the output of the command.


```bash
$ conda build --output .
/opt/miniconda3/conda-bld/linux-64/test_sample_pkg-1.0-0.tar.bz2
``` 
