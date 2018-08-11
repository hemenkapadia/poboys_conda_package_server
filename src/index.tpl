<h1>Poboy's Conda Package Server</h1>
A poor boy's conda package server that can be used to host conda packages internally i.e. behind the corporate firewall.


<h2>Repositories<h2>

<h3>Poboy's Repositories</h3>
Below packages are hosted internally on Poboy's server
<ul>
    <li><a href="{{prefix}}/pkgs">Main Channel - Package List</a></li>
</ul>

<h3>Anaconda Repositories</h3>
Link to the external Anaconda Repository, just for reference. This is not hosted in Poboy's server.
<ul>
    <li><a href="https://repo.continuum.io/pkgs/" target="_blank">All Channels in Anaconda Repo</a></li>
    <li><a href="https://repo.continuum.io/pkgs/main/" target="_blank">Anaconda Main Channel</a></li>
</ul>

<h2> Poboy's package upload</h2>
<h3>Form Upload</h3>
<form action="{{prefix}}/upload" method="post" enctype="multipart/form-data">
<div>platform
    <select name="platform">
        %for platform in platforms:
        <option value="{{platform}}">{{platform}}</option>    
        %end 
    </select>
</div>
<div>filename
    <input type="file" name="fileupload" />
</div>
<div>
    <input type="submit" value="Upload" />
</div>
</form>

<h3>CURL Upload</h3>
You can use the below command to upload the conda package programmatically to poboy's server. Replace filename_name with
the name of the file you are uploading. Replace hostname:port with details of your poboy server. Possible values for
platform_value is one from the below list
<ul>
    <li>noarch</li>
    <li>linux-64</li>
    <li>win-64</li>
    <li>osx-64</li>
    <li>linux-ppc64le</li>
</ul>

<code>
curl -vvv -H 'Expect:' -F platform=platform_value -F fileupload=@filename_name http://hostname:port/poboys/upload
</code>




<h2>Caution</h2>
Poboy's conda package server is not fully enterprise ready, merely a poc. Please exercise caution before deploying to production use.
